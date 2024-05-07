# RetroPie menuscripts

Some scripts for RetroPie

## Installation

Remove or backup original scripts and the gamelist
```shell
# Remove
rm -Rf ~/RetroPie/retropiemenu
rm /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
# Backup
mv ~/RetroPie/retropiemenu ~/RetroPie/old_retropiemenu
mv /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/old_gamelist.xml
```

Clone the repository
```shell
git clone https://github.com/born-to-geek/retropie-menuscripts retropiemenu
```

Link the new gamelist
```shell
ln -s ~/RetroPie/retropiemenu/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
```

Reboot
```shell
sudo reboot
```