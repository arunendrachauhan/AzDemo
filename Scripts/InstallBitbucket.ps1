$output = 'C:\MOFS'
Configuration InstallBitbucket
{
    Import-DscResource -ModuleName DSCR_Application
    cApplication AtlassianBitbucket
    {
        Name = '*Bitbucket*'   # You can use RegExp when Fuzzy=$true
        Fuzzy = $true
        Version = '5.16.0'
        Ensure = 'Present'
        InstallerPath = "C:\bitbucket\setup.exe"
        Arguments = '-install ALLUSERS=1 /S /quite'
        NoRestart = $true
    }
}

InstallBitbucket -OutputPath $output -ErrorAction Continue
Start-DscConfiguration -Path $output -Wait -Force -Verbose