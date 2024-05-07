#!/bin/bash

check_update_romlist() {
	cd ~/RetroPie/roms/
	git fetch
	
    UPSTREAM=${1:-'@{u}'}
	LOCAL=$(git rev-parse @)
	REMOTE=$(git rev-parse "$UPSTREAM")
	BASE=$(git merge-base @ "$UPSTREAM")

	if [ $LOCAL = $REMOTE ]; then
		dialog --backtitle "$__backtitle" --title "Déjà à jour" --msgbox "La liste de jeux est déjà à jour." 8 76
	elif [ $LOCAL = $BASE ]; then
		dialog --backtitle "$__backtitle" --title "Pas à jour" --yesno "La liste de jeux n'est pas à jour.\n\nVoulez-vous télécharger les nouvelles ROMS ?" 8 76
		if [ $? = 0 ]; then
			git pull
			if [ $? = 0 ]; then
				dialog --backtitle "$__backtitle" --title "Succés" --msgbox "La liste de jeux a bien été mise à jour." 8 76
			else
				dialog --backtitle "$__backtitle" --title "Erreur" --msgbox "Une erreur inconnue est survenue !" 8 76
			fi
		fi
	elif [ $REMOTE = $BASE ]; then
		dialog --backtitle "$__backtitle" --title "Erreur !" --msgbox "La liste de jeux ne peut pas être mise jour car des jeux ont été ajouté manuellement sur la borne." 8 76
	else
		dialog --backtitle "$__backtitle" --title "Erreur !" --msgbox "La liste de jeux ne peut pas être mise jour pour une raison inconnue." 8 76
	fi
}

wget -q --spider https://github.com/

if [ $? -eq 0 ]; then
	check_update_romlist
else
    dialog --backtitle "$__backtitle" --title "Erreur : Pas de connection internet" --msgbox "Impossible de synchroniser la liste de jeux sans connection internet !\n\nVeuillez vous connecter avant de réessayer..." 8 76
fi
