cls

Write-Host "Obtention des URLs Audio..."

$Page = Invoke-WebRequest -Uri https://raphaelgj.github.io/Kirtan

$Fichiers = $page.ParsedHtml.getElementsByTagname("source") | select -ExpandProperty outerHTML

[System.Collections.ArrayList]$Urls = foreach ($Fichier in $Fichiers) {
$Fichier = $Fichier -replace '<SOURCE type="audio/mpeg" src="' -replace '">'
$URL = "https://raphaelgj.github.io/Kirtan/" + $Fichier
$URL
}


$ChantRandom = $null
$ChantTrouve = $null
Start-process "https://raphaelgj.github.io/Kirtan/"

do {
cls
Stop-Process -name VLC -ErrorAction SilentlyContinue
$ChantRandom = Get-Random -InputObject $URLS
Start-process "C:\Program Files\VideoLAN\VLC\vlc.exe" "$ChantRandom"
$ChantRandom
$urls.Remove($ChantRandom)
"$($urls.Count) chants restants"
pause

} while ($true)
