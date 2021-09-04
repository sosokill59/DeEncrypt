function choix(){
	echo "1 - Chiffrer"
	echo "2 - Dechiffrer"
	read rep

	if [ $rep -eq 1 ]
	then
		encrypt_file
	elif [ $rep -eq 2 ]
	then
		decrypt
	else
		exit
	fi
}

function encrypt_file(){
		echo "Fichier à chiffrer : "
		read filepath
		if [ -a $filepath ]
		then
			openssl aes-256-cbc -salt -pbkdf2 -in $filepath -out $filepath.enc
			echo "Le fichier a été chiffrer correctement : $filepath.enc"

		else
			echo "Le fichier n'existe pas"
			encrypt_file
		fi
}

function decrypt(){

		echo "Fichier à déchiffrer : "
                read filepath2
                if [ -a $filepath2 ]
                then
			echo "Nouveau nom du fichier à déchiffrer : "
			read name
                        openssl aes-256-cbc -d -salt -pbkdf2 -in $filepath2 -out  $(dirname $filepath2)/$name
                	echo "Le fichier a été dechiffrer correctement : $(dirname $filepath2)/$name"

		else
                        echo "Le fichier n'existe pas"
                        decrypt
		fi
}

choix
