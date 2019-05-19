#!/bin/bash
## HAL9000 v0.003 install tools
## auth: Cesare Vigliani aka crossedhead aka crossedheadx
## github https://github.com/crossedheadx

##Post install tools

##funzioni

function buntu { 
  release = $(lsb_release -sc)
	sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $release main universe restricted multiverse"
  sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $release partner"
  echo 'Abilitati server Universe e partners, per più software!'
	clear
	while true;
	do
    		echo 'Aspetti, questa è una Ubuntu (u)fficiale o (d)erivata?'
    		read ris
    		##controlli annidati per immettere dati corretti qui tra d o u && x l k
    		if [[ $ris = "u" || $ris = "d" ]]; then
      			while true; 
				do
        				case $ris in
            					u)	
							suffix="ubuntu"
                					break
							;;
            					d)
							echo 'quale di queste?'
                					echo '(x)ubuntu'
                					echo '(l)ubuntu'
                					echo '(k)ubuntu'
                					read ri
                					case $ri in
                    						x) 
									suffix='xubuntu'
									;;
                    						l) 	
									suffix='lubuntu'
									;;
                    						k) 
									suffix='kubuntu'
									;;
                    						*)	
									echo 'opzione non valida, signore'
                    							clear
									;;
                					esac
                					if [[ $ri = "x" || $ri = "l" || $ri = "k" ]]; then
                  						break
							fi
							;;
        				esac
      				done
      			break
    		fi
  	done
	## aggiornamento
	sudo apt update
	sudo apt dist-upgrade -y
	clear
  	sudo apt install -y $suffix-restricted-extras p7zip ntp ssh vlc gdebi synaptic build-essential gparted unetbootin  language-pack-it language-pack-gnome-it aspell-it myspell-it libdvd-pkg libdvdread4 python3
  	clear
  	sudo dpkg-reconfigure libdvd-pkg
 	 clear
  	sudo apt-get install openjdk-8-jre icedtea-8-plugin
  	clear
	if [ $suffix ='ubuntu' ]; then
		sudo apt install unity-tweak-tool unity-tweak -y
		clear
	fi
	echo 'Soppressione di errori sys casuali'
	sleep 0.8
	sudo sed -i "s/enabled=1/enabled=0" /etc/default/apport
	echo 'necessita di programmi P2P (torrent, eMule)? [y/N]'
  if [ $risp = 'y']; then
		echo 'ha fastweb a casa? [y/N]'
		read ris
		if [$ris = 'y']; then
			sudo apt install amule-adunanza -y
		else
			sudo apt install amule -y
		fi
	fi
	clear
	echo 'necessita di LibreOffice completo? [y/N]'
	read risp
	if [ $risp = 'y' ]; then
		sudo apt install libreoffice-base -y
	fi
	clear
	echo 'necessita pacchetti di grafica/editing video/audio? [y/N]'
	read risp
	if [ $risp = 'y' ];then
		clear
		echo 'molto bene, indichi cosa intende installare|'
		echo '1) Pacchetti audio			 |'
		echo '2) Pacchetti grafica/publishing		 |'
		echo '3) Pacchetti video			 |'
		echo '4) tutti					 |'
		echo 'possibilità di scelte multiple (es.23 o 12)|'
		audio=' ubuntustudio-audio ubuntustudio-audio-plugins'
		graph=' ubuntustudio-fonts ubuntustudio-graphics ubuntustudio-photography ubuntustudio-publishing gimp-plugin-registry krita'
		video=' ubuntustudio-video'
		read extra
		case $extra in
			1)
				sudo apt install $audio -y
				;;
			2)
				sudo apt install $graph -y
				;;
			3)
				sudo apt install $video -y 
				;;
			12)
				sudo apt install $audio $graph -y
				;;
			13)
				sudo apt install $audio $video -y
				;;
			23)
				sudo apt install $graph $video -y
				;;
			4)	
				sudo apt install $audio $graph $video -y
				;;
		esac
		clear
	fi
	clear
	echo 'Lavoro completato!'
	sleep 1
	echo '<<--'
	sleep 1.5 
}

##programma principale
while true;
do
	clear
	echo '### --- Install Tool v3 --- ###'
	echo ' # set comandi post install  #'
	echo '1) - Debian essentials'
	echo '2) - *buntu essentials'
	echo '3) - Fedora/CentOS/RHEL essentials'
	echo '4) - OpenSuSE essentials'
	echo '5) - Arch install guide'
	echo '6) - Alpine Linux setup'
	echo '7) - Chiudere'
	echo -ne '-->'	

	read IT
	
	case $IT in
		1)
			clear
			echo 'in costruzione'
			sleep 1
			clear
			;;
		2)
			clear
			echo '*buntu essentials'
			sleep 0.5
			echo 'avvio post installazione'
			sleep 1
			clear
			echo -ne '-->>'
			buntu
			;;
		3)clear
			echo 'in costruzione'
			sleep 1
			clear
			;;
		4)clear
			echo 'in costruzione'
			sleep 1
			clear
			;;
		5)clear
			echo 'in costruzione'
			sleep 1
			clear
			;;
		6)clear
			echo 'in costruzione'
			sleep 1
			clear
			;;
		7)
			clear
			echo -ne 'Uscita'
			sleep 2
			clear
      exit
			;;
		*)
			clear
			echo -ne 'comando non valido'
			sleep 0.5
			;;
	esac
done
