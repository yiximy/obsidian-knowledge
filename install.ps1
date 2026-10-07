param(
    [Parameter(Mandatory = $true)]
    [string]$VaultPath
)

$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $VaultPath)) {
    throw "Vault not found: $VaultPath"
}

$sourceRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

Get-ChildItem -LiteralPath (Join-Path $sourceRoot 'Knowledge') -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($sourceRoot.Length).TrimStart('\')
    $destination = Join-Path $VaultPath $relative
    if (-not (Test-Path -LiteralPath $destination)) {
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $destination) | Out-Null
        Copy-Item -LiteralPath $_.FullName -Destination $destination
    }
}

$agentsDestination = Join-Path $VaultPath 'AGENTS.md'
if (-not (Test-Path -LiteralPath $agentsDestination)) {
    Copy-Item -LiteralPath (Join-Path $sourceRoot 'AGENTS.md') -Destination $agentsDestination
}

Write-Host "Installed knowledge base template into: $VaultPath"