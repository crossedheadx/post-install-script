#!/bin/bash
## HAL9000 v0.004 install tools
## auth: Cesare Vigliani aka crossedhead aka crossedheadx
## github https://github.com/crossedheadx

##Post install tools

##functions

function debian {

  echo 'Password'
  user = $USER 
  release = $(lsb_release)
  su -c 'apt-get install sudo && usermod -aG sudo $user && visudo' #TODO: automate better this part
  echo 'Password, again'
  ## add repos 

  sudo apt-get update 
  sudo apt-get upgrade -y 
  clear
  
  # install some stuff
  sudo apt-get install -y git curl vlc firmware-realtek firmware-iwlwifi firmware-linux-non-free fslint rsnapshot mc xsane $release-backports libreoffice htop nmap gdebi 

  echo "Job Completed!"
  sleep 1
  clear 

}

function buntu { 
  release = $(lsb_release -sc)
	sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $release main universe restricted multiverse"
  sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $release partner"
  echo 'Enabled server Universe and partners, much more software!'
	clear
	while true;
	do
    		echo 'Wait, is this an Ubuntu (o)fficial or (d)erivate?'
    		read ris
			##nested controls to insert correct data between d or o && x l k
    		if [[ $ris = "o" || $ris = "d" ]]; then
      			while true; 
				do
        				case $ris in
            					u)	
							suffix="ubuntu"
                					break
							;;
            					d)
							echo 'which of these?'
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
									echo 'bad answer'
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
	## simple update check
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
	echo 'Casual crash error suppression'
	sleep 0.8
	sudo sed -i "s/enabled=1/enabled=0/" /etc/default/apport
	echo 'P2P software needed (torrent, eMule)? [y/N]'
  if [ $risp = 'y']; then
		echo 'hai fastweb a casa? [y/N] (for italians users)'
		read ris
		if [$ris = 'y']; then
			sudo apt install amule-adunanza -y
		else
			sudo apt install amule -y
		fi
	fi
	clear
	echo 'Complete LibreOffice needed? [y/N]'
	read risp
	if [ $risp = 'y' ]; then
		sudo apt install libreoffice-base -y
	fi
	clear
	echo 'Graphic/editing video/audio packages needed? [y/N]'
	read risp
	if [ $risp = 'y' ];then
		clear
		echo 'All right, choose what you need|'
		echo '1) Audio pkgs			 |'
		echo '2) Graphics/publishing pkgs		 |'
		echo '3) Video pkgs			 |'
		echo '4) All toghether					 |'
		echo 'multiple choices allowed (ex.23 or 12)|'
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
      *)
        echo 'Combination not allowed'
        sleep 1 
        clear
        ;;
		esac
		clear
	fi
	clear
	echo 'Job completed!'
	sleep 1
	echo '<<--'
	sleep 1.5 
}

function aliases {
  echo "alias ll='ls -l'" >> $HOME/.bashrc
  echo "alias la='ls -A'" >> $HOME/.bashrc
  echo "alias l='ls -CF'" >> $HOME/.bashrc
  echo "alias rm='rm -i'" >> $HOME/.bashrc
  echo "alias cp='cp -i'" >> $HOME/.bashrc
  echo "alias mv='mv -i'" >> $HOME/.bashrc
  sleep 0.5
  echo "Now your shell is more cool!"
}

##main menu
while true;
do
	clear
	echo '### --- Install Tool v3 --- ###'
	echo ' # post install commands set #'
	echo '1) - Debian essentials'
	echo '2) - *buntu essentials'
	echo '3) - Fedora/CentOS/RHEL essentials'
	echo '4) - OpenSuSE essentials'
	echo '5) - Arch install guide'
	echo '6) - Alpine Linux setup'
	echo '7) - Cool aliases for your shell!'
  echo '8) - Exit'
	echo -ne '-->'	

	read IT
	
	case $IT in
		1)
			clear
			echo 'building'
			sleep 1
			clear
			;;
		2)
			clear
			echo '*buntu essentials'
			sleep 0.5
			echo 'start post installation'
			sleep 1
			clear
			echo -ne '-->>'
			buntu
			;;
		3)clear
			echo 'building'
			sleep 1
			clear
			;;
		4)clear
			echo 'building'
			sleep 1
			clear
			;;
		5)clear
			echo 'building'
			sleep 1
			clear
			;;
		6)clear
			echo 'building'
			sleep 1
			clear
			;;
    7)
      echo 'Cool aliases! Yea!'
      sleep 1 
      echo 'begin'
      clear 
      echo -ne '-->>'
      aliases
      ;;
		8)
			clear
			echo -ne 'Exiting'
			sleep 2
			clear
      exit
			;;
		*)
			clear
			echo -ne 'bad command!'
			sleep 0.5
			;;
	esac
done
