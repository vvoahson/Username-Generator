param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile
)

# Read the names from the input file
$names = Get-Content $InputFile

# Initialize an empty array to store the usernames
$usernames = @()

# Process each name and generate the usernames
foreach ($name in $names) {
    $firstName, $lastName = $name -split '\s+'
    
    # Generate the usernames
    $username1 = "$firstName.$lastName"
    $username2 = "$($firstName[0])$lastName"
    
    # Add the usernames to the array
    $usernames += $username1
    $usernames += $username2
}

# Set the output file path relative to the current directory
$outputFile = Join-Path (Get-Location) "usernames.txt"

# Save the usernames to the output file
$usernames | Out-File $outputFile

Write-Host "Usernames generated and saved to $outputFile"
