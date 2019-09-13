#disable fips
set-ItemProperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy\ -Name Enabled -Value 0
get-ItemProperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy\
#sleep for 30 minutes then automatically enable fips again
Write-Output("sleeping for 10 minutes")
Start-Sleep(600)

<# #>
Function Start-Sleep($seconds)
{
$doneDT = (Get-Date).AddSeconds($seconds)
while($doneDT -gt (Get-Date))
{
$secondsLeft = $doneDT.Subtract((Get-Date)).TotalSeconds
$percent = ($seconds - $secondsLeft) / $seconds * 100
Write-Host (Write-progress -Activity "Pausing" -Status "Pausing..." -SecondsRemaining $secondsLeft -PercentComplete $percent)
[System.Threading.Thread]::Sleep(1800)
}
Write-Host (Write-Progress -Activity "Pausing" -Status "Pausing..." -SecondsRemaining 0 -Completed)
}


#enable fips
set-ItemProperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy\ -Name Enabled -Value 1
get-ItemProperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy\
