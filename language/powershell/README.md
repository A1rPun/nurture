# PowerShell

```
powershell.exe {program}.ps1
```

### powershell.exe

```
> .\{program}.ps1
```

### Troubleshooting

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
