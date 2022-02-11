function Prompt
{
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal `
        ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    Write-Host ('PowerShell ') -ForegroundColor Blue -NoNewline

    if ($IsAdmin) {
        Write-Host ('Admin') -BackgroundColor Blue `
            -ForegroundColor Black -NoNewline
        Write-Host (' ') -NoNewline
    }


    Write-Host (Get-Location) -ForegroundColor Green -NoNewline

    if (Get-IsGitRepo) 
    {
        Write-Host ' [' -NoNewline
        Write-Host (Get-GitBranchName)      `
            -ForegroundColor Cyan -NoNewline
        Write-Host ']' -NoNewline
    }

    # Additional write for guaranteed newline
    Write-Host  

    # Prints the leader character in blue
    Write-Host '>' -ForegroundColor Blue -NoNewline

    return ' '
}

function Get-IsGitRepo
{
    git branch 2> $null 
    return ($LastExitCode -eq 0)
}


function Get-GitBranchName
{
    $GitBranches = git branch 2> $null | Select-String '\*'
    $IsGitRepo = $LastExitCode -eq 0

    if ($IsGitRepo) {
        return ($GitBranches -split ' ')[1]
    }
    return
}
