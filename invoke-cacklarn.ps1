function invoke-cacklarn() {
    param(
        [Parameter(Mandatory=$true)][string]$path,
        [switch]$recurse
    )
[array]$folder = (get-childitem $path -ErrorAction SilentlyContinue).directory.fullname
[array]$folder += (get-childitem $path -ErrorAction SilentlyContinue -Recurse:$recurse).FullName
$folder = $folder | sort -Unique

foreach($item in $folder){
$permission = (Get-Acl $item -ErrorAction SilentlyContinue).Access | ?{$_.IdentityReference -in "BUILTIN\Users","Everyone"} | Select IdentityReference,FileSystemRights
$permission | Add-Member -MemberType NoteProperty -name "path" -Value $item -passthru -ErrorAction SilentlyContinue | out-null
$permission | where {
                   $_.FileSystemRights -like "*CreateFiles*" -or 
                   $_.FileSystemRights -like "*AppendData*" -or 
                   $_.FileSystemRights -like "*FullControl*" -or
                   $_.FileSystemRights -like "*Modify*" -or
                   $_.FileSystemRights -like "*Write*" -or
                   $_.FileSystemRights -like "*Delete*"
                   }
}
}
