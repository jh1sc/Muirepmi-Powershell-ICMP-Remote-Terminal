$ttd=360
Add-Type -AssemblyName System.Windows.Forms
$Xcp = [System.Windows.Forms.Cursor]::Position.X
$Ycp = [System.Windows.Forms.Cursor]::Position.Y
write-host -nonewline CurrentCursorPos - x:[$Xcp] y:[$Ycp];write-host
while($true){

foreach ($degree in 0..$ttd) {
$YRadius = 10
$XRadius = 10
$radians = $degree * [Math]::PI/180;
    $x = $Xcp + $XRadius * [Math]::cos($radians);    
    $y = $Ycp + $YRadius * [Math]::sin($radians);
    $x = [math]::Floor($x)
    $y = [math]::Floor($y)
write-host -nonewline CurrentDegree[$degree] x: [$x] y: [$y];write-host
[Windows.Forms.Cursor]::Position = "$($x),$($y)"
Start-Sleep -s 0
}
} 