function invoke-cacklarn() {
    param(
        [Parameter(Mandatory=$true)][string]$path,
        [switch]$recurse
    )
[array]$folder = (get-childitem $path).directory | select -expand FullName
[array]$folder += (get-childitem $path -Recurse:$recurse) | select -expand FullName
$folder = $folder | sort -Unique

foreach($item in $folder){
$permission = (Get-Acl $item -ErrorAction SilentlyContinue).Access | ?{$_.IdentityReference -in "$env:USERDOMAIN\$env:USERNAME",$env:USERDOMAIN\Domain Users","BUILTIN\Users","Everyone","NT AUTHORITY\Authenticated Users"} | Select IdentityReference,FileSystemRights,RegistryRights
$permission | Add-Member -MemberType NoteProperty -name path -Value $($item | Split-Path -NoQualifier) -passthru -ErrorAction SilentlyContinue | out-null
$permission | where {
                   $_.FileSystemRights -like "*CreateFiles*" -or 
                   $_.FileSystemRights -like "*AppendData*" -or 
                   $_.FileSystemRights -like "*FullControl*" -or
                   $_.FileSystemRights -like "*Modify*" -or
                   $_.FileSystemRights -like "*Write*" -or
                   $_.FileSystemRights -like "*Delete*" -or 
		   ## registry
                   $_.RegistryRights -like "*CreateFiles*" -or 
                   $_.RegistryRights -like "*AppendData*" -or 
                   $_.RegistryRights -like "*FullControl*" -or
                   $_.RegistryRights -like "*Modify*" -or
                   $_.RegistryRights -like "*Write*" -or
                   $_.RegistryRights -like "*Delete*"
                   }
}
}
