# SSHCloud_client_side_v1.5
SSHCloud client side v1.5
  Programming and idea by : E2MA3N [Iman Homayouni] <br>
  Email : e2ma3n@Gmail.com <br>
  Website : https://SSHCloud.net <br>
  License : GPL v3.0 <br>
  SSHCloud client side v1.5 <br>
 
  Dependencies: <br>
 	1. sshfs <br>
 	2. mount <br>
 	3. umount <br>
 	4. sudo <br>
 	5. gpasswd or usermod <br>
 
  Usage: <br>
 	1. ./SSHCloud.sh -h #to see help menu <br>
 	2. ./SSHCloud.sh -c #to check your system for sshfs and fuse group settings <br>
 	3. ./SSHCloud.sh -m #to mount your cloud disk <br>
 	4. ./SSHCloud.sh -u #to unmount your cloud disk <br>
 
  Notes: <br>
 	1. in the first step, run ./SSHCloud.sh -c to check your system <br>
 	2. IF you need more help, please contact us : https://SSHCloud.net <br>
 	3. IF you use root user, you can remove sudo on source file <br>
 
  Install sshfs on ubuntu: <br>
 	1. sudo apt-get install sshfs <br>
 	2. sudo gpasswd -a $USER fuse <br>
 	  https://help.ubuntu.com/community/SSHFS <br>
 
  Install sshfs on debian: <br>
 	1. sudo apt-get install sshfs <br>
 	2. sudo gpasswd -a $USER fuse <br>
 	 https://packages.debian.org/en/sid/sshfs <br>
 
 
  Install sshfs on arch: <br>
 	1. sudo pacman -S sshfs fuse <br>
 	2. sudo gpasswd -a "$USER" fuse <br>
 	  https://wiki.archlinux.org/index.php/Sshfs <br>
 
  Install sshfs on RHEL or CentOS: <br>
 	1. sudo yum install fuse-sshfs <br>
 	2. sudo gpasswd -a "$USER" fuse <br>
