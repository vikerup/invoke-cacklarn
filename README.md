# invoke-cacklarn

## Getting started

invoke-cacklarna is an easy to use script to quickly find modifiable files on windows systems and shares. `icacls.exe` will give you the plague and `get-acl` will give you cholera, invoke-cacklarn will hopefully give you $null

### Usage

`iex (new-object net.webclient).downloadstring("https://raw.githubusercontent.com/vikerup/invoke-cacklarn/main/invoke-cacklarn.ps1")`

```
PS C:\ProgramData> invoke-cacklarn C:\ProgramData -recurse -ErrorAction SilentlyContinue

IdentityReference FileSystemRights RegistryRights path
----------------- ---------------- -------------- ----
BUILTIN\Users                Write                C:\ProgramData\Adobe
BUILTIN\Users                Write                C:\ProgramData\Adobe\Acrobat
BUILTIN\Users                Write                C:\ProgramData\Adobe\Acrobat\11.0
BUILTIN\Users                Write                C:\ProgramData\Adobe\Acrobat\11.0\Replicate
BUILTIN\Users                Write                C:\ProgramData\Adobe\Acrobat\11.0\Replicate\Security
BUILTIN\Users                Write                C:\ProgramData\Adobe\Setup
BUILTIN\Users                Write                C:\ProgramData\Adobe\Setup\{AC76BA86-7AD7-1033-7B...
BUILTIN\Users                Write                C:\ProgramData\Applications
BUILTIN\Users                Write                C:\ProgramData\Applications\Cache
[...]
```
