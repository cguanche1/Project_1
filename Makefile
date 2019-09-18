

all: installs git mail processing


installs:
	sudo apt-get -y install unclutter
	sudo apt-get -y install msmtp
	sudo apt-get -y install ca-certificates
	sudp apt-get -y install mutt
	set sendmail="/usr/bin/msmtp"
	set use_from=yes
	set realname="Guanche Pi"
	set from=guanchepi1@gmail.com
	set envelope_from=yes

git:
	mkdir /Project_1
	cd /Project_1
	git init
	git remote add origin https://github.com/cguanche1/Project_1
	git pull https://github.com/cguanche1/Project_1
	cd /

mail:
	cat /Project_1/msmtprc > /etc/msmtprc
	ifconfig wlan0 | msmtp carlos.guanche@yale.edu

processing:





