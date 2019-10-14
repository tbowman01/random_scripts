#!/bin/bash
cd ~/Downloads
repos=( https://github.com/OWASP/Amass.git
   	https://github.com/danielmiessler/SecLists.git
	https://github.com/knockout/knockout.git
	https://github.com/SecWiki/windows-kernel-exploits
	https://github.com/SecWiki/linux-kernel-exploits.git
	https://github.com/jondonas/linux-exploit-suggester-2
	https://github.com/tbowman01/misc-scripts.git
	https://github.com/abatchy17/SetupScripts.git
	)

for each in ${repos[@]};
do
	echo 'Downloading : '$each
	git clone $each
done
cd ~/Downloads
echo "downloading a few extra scripts that might be helpful"
mkdir extra_scripts && cd extra_scripts
curl -o Shells-Linux https://book.hacktricks.xyz/shells/shells#shells-linux
curl -o Shells-Windows https://book.hacktricks.xyz/shells/shells#shells-windows
curl -o oh-shit-guide https://anhtai.me/oscp-fun-guide/
curl -o windows_recon_script https://gist.githubusercontent.com/sckalath/8dacd032b65404ef7411/raw/9149b02372d8ca903f03f2fe3bce3a2830981033/windows_privesc
curl -o linpeas.sh https://raw.githubusercontent.com/carlospolop/linux-privilege-escalation-awsome-script/master/linpeas.sh
