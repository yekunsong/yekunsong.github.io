param(
    [ValidateRange(1024, 65535)]
    [int]$Port = 4000,
    [switch]$BuildOnly
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$localRuby = Join-Path $projectRoot '.tools\ruby\bin\ruby.exe'
$rubyCommand = Get-Command ruby.exe -ErrorAction SilentlyContinue

if (Test-Path -LiteralPath $localRuby) {
    $rubyExecutable = $localRuby
} elseif ($rubyCommand) {
    $rubyExecutable = $rubyCommand.Source
} else {
    throw 'Ruby is missing. Install Ruby+Devkit 3.3 from https://rubyinstaller.org/downloads/ and run this script again.'
}

function Invoke-Bundle {
    param([string[]]$BundleArguments)
    & $rubyExecutable -S bundle @BundleArguments
    if ($LASTEXITCODE -ne 0) {
        throw "Bundler failed with exit code $LASTEXITCODE."
    }
}

$originalSearchPath = $env:Path
$env:Path = (Split-Path -Parent $rubyExecutable) + ';' + $originalSearchPath
Push-Location -LiteralPath $projectRoot
try {
    Invoke-Bundle -BundleArguments @('config', 'set', '--local', 'path', 'vendor/bundle')
    & $rubyExecutable -S bundle check
    if ($LASTEXITCODE -ne 0) {
        Invoke-Bundle -BundleArguments @('install')
    }

    if ($BuildOnly) {
        Invoke-Bundle -BundleArguments @('exec', 'jekyll', 'build')
    } else {
        Write-Host "Preview: http://127.0.0.1:$Port/zh/ (Ctrl+C to stop)"
        Invoke-Bundle -BundleArguments @('exec', 'jekyll', 'serve', '--host', '127.0.0.1', '--port', "$Port", '--livereload')
    }
} finally {
    Pop-Location
    $env:Path = $originalSearchPath
}
