#!/bin/bash

source ./config.sh_lib

lockFiles() {
	cd $menudir
	declare -a files=("audiosettings.rp"
					  "bluetooth.rp"
					  "configedit.rp"
					  "esthemes.rp"
					  "filemanager.rp"
					  "raspiconfig.rp"
					  "retroarch.rp"
					  "retronetplay.rp"
					  "rpsetup.rp"
					  "runcommand.rp"
					  "splashscreen.rp"
					  )
	for file in ${files[@]}; do
		mv -- "$file" "$file.lock"
	done
}

unlockFiles() {
	cd $menudir
	for file in *.rp.lock; do
		mv -- "$file" "${file%.rp.lock}.rp"
	done
}

keyboardInput "password" 1
if [ $? -eq 0 ]; then
	if [ "$output_text" = "dadfba24" ]; then
		dialog --backtitle "$__backtitle" --title "Verrouiller/Déverrouiller" --yes-label "Verrouiller" --no-label "Déverrouiller" --yesno "Voulez-vous verrouiller ou déverrouiller les menu de la borne ?" 8 76
		if [ $? -eq 0 ]; then
			lockFiles
		else
			unlockFiles
		fi
		sudo reboot
	else
		dialog --backtitle "$__backtitle" --title "Erreur !" --msgbox "Mot de passe incorrect !" 8 76
	fi
fi
