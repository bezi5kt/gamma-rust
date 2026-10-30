# Packs the registry file (.hnmod): horizon-native.json + mixins/<id>/*.rs|*.toml,
# with forward-slash names as the launcher expects. Usage: .\pack.ps1
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem
$root = $PSScriptRoot
$native = Get-Content (Join-Path $root 'horizon-native.json') -Raw | ConvertFrom-Json
$out = Join-Path $root "dist\$($native.id)-$($native.version).hnmod"
New-Item -ItemType Directory -Force (Split-Path $out) | Out-Null
if (Test-Path $out) { Remove-Item $out }
$names = @('horizon-native.json') + (Get-ChildItem (Join-Path $root "mixins\$($native.id)") -File |
    Where-Object { $_.Extension -in '.rs', '.toml' } | ForEach-Object { "mixins/$($native.id)/$($_.Name)" })
$zip = [IO.Compression.ZipFile]::Open($out, 'Create')
try {
    foreach ($name in ($names | Sort-Object)) {
        $entry = $zip.CreateEntry($name, 'Optimal')
        $entry.LastWriteTime = [DateTimeOffset]'2026-01-01T00:00:00Z'
        $bytes = [IO.File]::ReadAllBytes((Join-Path $root $name))
        $s = $entry.Open(); $s.Write($bytes, 0, $bytes.Length); $s.Dispose()
    }
} finally { $zip.Dispose() }
"$out ($($names.Count) files)"
