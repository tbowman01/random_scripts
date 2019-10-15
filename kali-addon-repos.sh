#!/bin/bash
# shortlink to github: shorturl.at/pBOP7
# shortlink to raw file: shorturl.at/DL069
cd ~/Downloads
echo "downloading a few extra scripts that might be helpful"
mkdir extras && cd extras
curl --progress-bar -o Shells-Linux https://book.hacktricks.xyz/shells/shells#shells-linux
curl --progress-bar -o Shells-Windows https://book.hacktricks.xyz/shells/shells#shells-windows
curl --progress-bar -o oh-shit-guide.html https://anhtai.me/oscp-fun-guide/
curl --progress-bar -o windows_recon_script https://gist.githubusercontent.com/sckalath/8dacd032b65404ef7411/raw/9149b02372d8ca903f03f2fe3bce3a2830981033/windows_privesc
curl --progress-bar -o linpeas.sh https://raw.githubusercontent.com/carlospolop/linux-privilege-escalation-awsome-script/master/linpeas.sh
# download knockknock and extract
curl --progress-bar -o knockknock-0.1.3.tar.gz https://files.pythonhosted.org/packages/29/37/d3d3abb10f3a87cbd84bcc191dd6b5c391b476acb529b25b1106e9f7bc12/knockknock-0.1.3.tar.gz
tar -xf knockknock-0.1.3.tar.gz

cd ~/Downloads
repos=( https://github.com/OWASP/Amass.git
   	https://github.com/danielmiessler/SecLists.git
	https://github.com/knockout/knockout.git
	https://github.com/SecWiki/windows-kernel-exploits
	https://github.com/SecWiki/linux-kernel-exploits.git
	https://github.com/jondonas/linux-exploit-suggester-2
	https://github.com/tbowman01/misc-scripts.git
	https://github.com/abatchy17/SetupScripts.git
	https://github.com/ucki/URP.git
	https://github.com/mad-robot/Spartan.git
	https://github.com/trustedsec/unicorn.git
	)

for each in ${repos[@]};
do
	#echo 'Downloading : '$each
	git clone $each
done
