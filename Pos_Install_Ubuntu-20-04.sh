#!/usr/bin/env bash
##Removendo possíveis travas do apt
##Removing possible locks from apt
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;
##Adicionando suporte a arquitetura 32 bits
##Adding support for 32-bit architecture
sudo dpkg --add-architecture i386

##Atualização dos repositórios nativos e Sistema
##Updating native repositories and system
sudo apt update -y &&

sudo apt upgrade -y

##Criando Pasta para Arquivos de instalação
##Creating folder for installation files
cd $HOME/Downloads
mkdir -p TempFiles

##Indo para a pasta criada e baixando os arquivos
##going to the created folder and making file downloads
cd TempFiles
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
##Instalando os pacotes .deb baixados anteriormente e tema
##Installing previously downloaded packages and theme
sudo dpkg -i *.deb
cd
##Adicionando repositórios de alguns programas
##Adding repositories for some programs
sudo add-apt-repository ppa:obsproject/obs-studio -y 
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y 
sudo add-apt-repository ppa:lutris-team/lutris -y
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key 
sudo apt-key add winehq.key 
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y

##Atualização dos repositórios
##Update of repositories
sudo apt update -y

##Instalando os pacotes dos repositórios adicionados anteriormente e outros
##Installing packages from previous repositories and others
sudo apt install kdenlive breeze frei0r-plugins -y
sudo apt install ffmpeg -y
sudo apt install adb -y
sudo apt install obs-studio -y
sudo apt install qbittorrent-stable -y
sudo apt install lutris -y
sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y &&
sudo apt install steam-installer -y
sudo apt install steam-devices -y
sudo apt install steam:i368 -y
sudo apt install libvulkan1 -y 
sudo apt install libvulkan1:i368 -y
sudo apt install libgnutls30:i386 -y 
sudo apt install libldap-2.4-2:i386 -y 
sudo apt install libgpg-error0:i386 -y 
sudo apt install libxml2:i386 -y 
sudo apt install libasound2-plugins:i386 -y 
sudo apt install libsdl2-2.0-0:i386 -y 
sudo apt install libfreetype6:i386 -y
sudo apt install libdbus-1-3:i386 -y
sudo apt install libsqlite3-0:i386 -y
sudo apt install mesa-vulkan-drivers vulkan-utils -y
sudo apt install flatpak -y
sudo apt install build-essential default-jdk fontconfig software-properties-common git curl -y
sudo apt install ubuntu-restricted-extras -y
sudo apt install audacity -y
sudo apt install gnome-tweak-tool -y
sudo apt install unzip -y
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0

##Instalando pacotes snap
##Installing snap packages
sudo snap install photogimp
sudo snap install spotify
sudo snap install eclipse --classic
sudo snap install handbrake-jz
sudo snap install netbeans --classic

##Conclusão, atualização e limpeza
##Completion, update and cleaning

sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
##Apagando arquivos de instalação
##Deleting installation files
cd $HOME/Downloads
rmdir TempFiles
cd
printf "%s" 'Seu computador será reiniciado em '
for i in {5..1}
do
  printf "%s\b" $i
  sleep 1
done
##Reiniciando o pc
##Restarting the pc
reboot
