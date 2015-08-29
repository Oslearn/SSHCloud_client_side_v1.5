#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Email : e2ma3n@Gmail.com
# Website : https://SSHCloud.net
# License : GPL v3.0
# SSHCloud client side v1.5
#####################################################

# check function: for check sshfs is install or not install
function check { reset

echo "[+] ----------------------------------------------------------------- [+]"
echo "[+] Welcome to SSHCloud client side"
echo "[+] check sshfs execute files and settings on system" ; echo '[+]'

# check sshfs on system
ls /usr/bin/sshfs &> /dev/null
if [ "$?" != "0" ] ; then
        echo "[-] sshfs not found on system, Maybe not installed"
	echo "[+] Please install sshfs"
	echo "[+] Debian base: sudo apt-get install sshfs"
	echo "[+] Redhat base: sudo yum install fuse-sshfs"
	exit 0
else
        echo "[+] sshfs founded on system"
fi
echo "[+] IF you need more help, please contact us : https://SSHCloud.net"
echo "[+] ----------------------------------------------------------------- [+]"

}

# mount function: for mounting cloud disk on system
function SSHmount { reset

echo "[+] ----------------------------------------------------------------- [+]"
echo "[+] Welcome to SSHCloud client side"
echo "[+] Mount your Cloud Disk"

# enter user account by USER
echo -n "[+] SSHCloud username: " ; read username

# check this path is available or not. if the path is unavailable, created new directory for mounting cloud disk
ls $HOME/$username &> /dev/null
if [ "$?" != "0" ];then
	mkdir $HOME/$username &> /dev/null
fi

# enter cloud server ip address by USER
echo -n "[+] Server ip address: " ; read ip
echo -n "[+] SSH port (default is 22): " ; read port

# connecting to server and mounting cloud disk
echo -n "[+] " ; sshfs -o idmap=user $username@$ip:/$username $HOME/$username -p $port &> /dev/null
if [ "$?" = "0" ];then
	echo "[+] Connected"
	echo "[+] Path : $HOME/$username"
	echo "[+] ----------------------------------------------------------------- [+]"
else
	echo "" ; echo "[-] Not connected"
	echo "[+] Maybe your cloud disk already mounted"
	echo "[+] Test manually and check this : sshfs -o idmap=user USERNAME@IP_ADDRESS:/ DIRECTORY"
	echo "[+] For example : sshfs -o idmap=user OSLearn@sshcloud.net:/ /home/iman/my_cloud"
	echo "[+] IF you need more help, please contact us : https://SSHCloud.net"
	echo "[+] ----------------------------------------------------------------- [+]"
fi
}

# unmount function: for unmounting cloud disk on system
function SSHumount { reset

echo "[+] ----------------------------------------------------------------- [+]"
echo "[+] Welcome to SSHCloud client side"
echo "[+] Unmount your Cloud Disk"

# enter user account by USER
echo -n "[+] SSHCloud username: " ; read username

# check disk is mounted on system or not
mount | grep $HOME/$username &> /dev/null
if [ "$?" = "0" ];then
	# if disk mounted on system, we try unmount this
	echo -n "[+] " ; sudo umount $HOME/$username
	echo -e "\n[+] Disk umounted"
else
	echo "[-] Your cloud disk not found, Maybe your disk in not mount on system"
	echo "[-] For check manually : mount | grep fuse.sshfs"
	echo "[+] IF you need more help, please contact us : https://SSHCloud.net"
fi
echo "[+] ----------------------------------------------------------------- [+]"

}

# help function
function help {

echo "Usage: ./SSHCloud.sh [-c check] [-m mount] [-u unmount] [-h help]"
echo "	-c	check sshfs execute files and settings on system"
echo "	-m	mounting cloud disk on your system"
echo "	-u	unmounting cloud disk on your system"
echo "	-h	help menu"
echo '' ; echo "Warning: in the first step, run ./SSHCloud.sh -c to check your system" ; echo ''

}

# if you run prigram whit out sw, this funtion show for user
function show {

echo "Use -h to see help menu"
echo "./SSHCloud.sh -h" ; echo ''

}

case $1 in
	-c) check ;;
	-m) SSHmount ;;
	-u) SSHumount ;;
	-h) help ;;
	*) show ;;
esac
