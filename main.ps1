net.exe start Audiosrv
net.exe user $env:UserName "12345678"
write-host Username: $env:UserName
write-host Password: 12345678
Invoke-WebRequest https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip -OutFile ngrok.zip
Expand-Archive ngrok.zip
.\ngrok\ngrok.exe authtoken 2RNsdOIx7tvImPXPdErmJJk6qIE_2i7y8rwqAUmAAnxyRyGqz
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1
Start-Process Powershell -ArgumentList '-Noexit -Command ".\ngrok\ngrok.exe tcp 3389"'
sleep 320
yes
