<# 
.SYNOPSIS 
Password Generator
 
.DESCRIPTION  
Simple password generator that mimics iCloud Keychain password generator 
 
.NOTES 
Written by: Fernando Gonzalez
Password will be in the following format xxxxxx-xxxxxx-xxxxxx-xxxxxx-xxxxxx it will be copied to the clipboard and after 10 seconds the clipboard will clear.

Change Log 
V1.00, 09/11/2019 - Initial version
V1.01, 09/11/2019 - Replaced Get-Random with RNGCryptoServiceProvider
                  - Implemented the use of GC to clear up memeory after clearing variables and clipboard. 
v1.02, 09/13/2019 - Added additional values to characterlist
                  - Increased Length to 33 allowing for longer
                  - Removed '-' from formatting and allowed to be included as character set for random placement
#>
Function Get-Password() {
    $characterList = Get-Random(32)
    # $characterList = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&-+_"
    $len = 33

    # Creating the random password
    $bytes = New-Object "System.Byte[]" $len
    $rng = New-Object System.Security.Cryptography.RNGCryptoServiceProvider
    $rng.GetBytes($bytes)
    $password = ""
    for ($i = 0; $i -le $len; $i++) {
        #if ($i -eq 6 -or $i -eq 13 -or $i -eq 20 -or $i -eq 27) {
        #    $password += "-"
        # instead of forcing the '-' at specified interval, let's update and check for at least x number of times
        # ie. if found check for number of upper case, lower case, numbers, special characters and enforce password 
        # complexity rules.  Could also check for no consecutive repeating characters and even compare against password list
        #}
        #else {
            $password += $characterList[ $bytes[$i] % $characterList.Length ]
        #}
    }
    
    # Copying the password to clipboard for pasting
    Set-Clipboard $password
    Write-Host "Password Copied. Password will clear from clipboard in 10 seconds" -ForegroundColor Green

    # Clearing the password variable and clearing the clipboard after 20 seconds.
    Start-Sleep -s 10

    $password = $Null
    [System.GC]::Collect() # used to free up the memory location used for $password
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Clipboard]::Clear()
    [System.GC]::Collect() # used to free up the memory location. Make sure the password is nowhere on the system after clipboard is cleared.
}