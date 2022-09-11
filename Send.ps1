$ICMPClient = New-Object System.Net.NetworkInformation.Ping
    $PingOptions = New-Object System.Net.NetworkInformation.PingOptions
    $PingOptions.DontFragment = $True
$Host.UI.RawUI.BackgroundColor = 'Black';cls
$CIP = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00"}).IPAddress
Write-Host Your Current IP Is ' ' -nonewline;Write-Host $CIP -ForegroundColor red -BackgroundColor DarkBlue
Write-Host ====Pevious Connected Hosts====


$TP=Test-Path -Path $env:tmp\hosts.tmp
if ($TP -eq 'True'){Get-Content $env:tmp\hosts.tmp} else {Write-Host No Previous Hosts Yet!;New-Item -Path $env:tmp\hosts.tmp -ItemType File}
while($true){$IP = Read-Host -Prompt "Connected IP-ADDRESS";$TC=Test-Connection -BufferSize 32 -Count 1 -ComputerName $IP -Quiet;if ($TC -eq 'True'){Add-Content -Path $env:tmp\hosts.tmp -Value $IP;cls;break} else {;write-host Please Enter A Valid and Online Computer.;sleep 3;cls}}


while($True){   
$text = Read-Host -Prompt "["
if($text -eq "clss"){cls;$text=' '}
$txtn = ([text.encoding]::ASCII).GetBytes("$text-")
foreach($EncodedTxt in $txtn){;ping -n 1 -l $EncodedTxt $IP | Out-Null}
}