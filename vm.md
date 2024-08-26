# Hyper-v notes

Get the IP address of a running VM:

```
Get-VM | ?{$_.State -eq "Running"} | Select -ExpandProperty networkadapters
```

> see [https://stackoverflow.com/questions/26003195/how-to-get-ip-address-of-all-virtual-machines-running-on-hyper-v](https://stackoverflow.com/questions/26003195/how-to-get-ip-address-of-all-virtual-machines-running-on-hyper-v)


Get the Windows username:

```
Get-WMIObject -class Win32_ComputerSystem | select username
```

# Set AZERTY keyboard

```
Set-WinUserLanguageList -LanguageList fr-FR
```

# Authorize PING response

https://serverfault.com/questions/827181/hyper-v-not-able-to-ping-my-local-vm-from-host

# Install Open SSH

https://www.linuxtricks.fr/wiki/windows-server-installer-openssh-server-en-powershell

Create a user:

```
New-LocalUser -Name 'dev' -Description 'dev'
```

> password: `dev`

Test the SSH server:

```
# Get the IP address of a running VM => 172.29.103.131
Get-VM | ?{$_.State -eq "Running"} | Select -ExpandProperty networkadapters
ssh 172.29.103.131 -l dev
```
