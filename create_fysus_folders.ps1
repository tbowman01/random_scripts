# Create template directory structure for IAVA Disc
# version 1.1
#
# parent directory 
#
#
# New-Item -ItemType Directory -Path C:\NewPath\NewSubPath\AnotherSubDir\WowThisIsReallyNested -Force

# display current fiscal year to be used
$FY_SUS = 'fy20sus'
Write-Host "Currently using '$FY_SUS' as the root.  If this is not correct, abort and update the script"

# Display current directory path 
# $DOCDIR = [Environment]::GetFolderPath("MyDocuments")
$DOCDIR = Get-Location
Write-Host "Current working directory path is: $DOCDIR"

$CWD = $DOCDIR

# prompt for sprint version (ie. MAR)
$TARGETDIR = Read-Host 'Please enter the sprint version: '

Write-Host "Creating $TARGETDIR at the following location: $CWD"

# check if folder already exists
if(!(Test-Path -Path $TARGETDIR )){
    New-Item -ItemType directory -Path $TARGETDIR
}

# create folder structure for iava disc
# 
# example below
# MAR
# MAR\fy19sus\
# MAR\fy19sus\10
# MAR\fy19sus\2012r2
# MAR\fy19sus\2012r2\all
# MAR\fy19sus\certs
# MAR\fy19sus\noautoinstall
# MAR\fy19sus\office2013
# MAR\fy19sus\office2013\!servicepack
# MAR\fy19sus\office2013\patches
# MAR\fy19sus\sqlserver2012
# MAR\fy19sus\sqlserver2012\!servicepack
# MAR\fy19sus\sqlserver2012\patches

#$DOCDIR = [Environment]::GetFolderPath("MyDocuments")
#$TARGETDIR = '$DOCDIR\MatchedLog'
#if(!(Test-Path -Path $TARGETDIR )){
#    New-Item -ItemType directory -Path $TARGETDIR
#}

# Set Folders list
[array]$FOLDERS = '10', '2012r2', '2012r2\all', 'certs', 'noautoinstall', 'office2013', 'office2013\!servicepack', 'office2013\patches', 'server2012', 'server2012\!servicepack', 'server2012\patches'

#Go through each folder in the base path.
ForEach ($ITEM in $FOLDERS) {
    #write-host Folder to be created is: "$CWD\$FY_SUS\$TARGETDIR\$ITEM"
    #if (!(Test-Path -Path $CWD\$FY_SUS\$TARGETDIR\$ITEM)) {
    #    New-Item -ItemType Directory -Path $CWD\$FY_SUS\$TARGETDIR\$ITEM -Force
    #}
    #New-Item -ItemType Directory -Path $CWD\$FY_SUS\$TARGETDIR\$ITEM -Force
    Write-Host "Creating directory: $CWD\$TARGETDIR\$FY_SUS\$ITEM"
    New-Item -ItemType Directory -Path $CWD\$TARGETDIR\$FY_SUS\$ITEM -Force -Verbose
}

# next steps...  
# work on validation of file types in $TARGETDIR
# after successful validate then zip each main folder (10, 2012, etc) into a folder-month.zip
# create powershell script to recursively upload files to nexus
# trigger jenkins job to create ISO
#