# PowerShell

- [Documentation](https://docs.microsoft.com/en-us/powershell/)

```
$ pwsh
PS >
```

## Windows

```
powershell.exe {program}.ps1
```

Run powershell.exe

```
PS > .\{program}.ps1
```

## Troubleshooting

```
powershell.exe {program}.ps1 -executionpolicy bypass
```

Or

```
> Set-ExecutionPolicy Bypass -Scope Process
```

Or

```
> Get-ExecutionPolicy -list
> Set-ExecutionPolicy Unrestricted
```
