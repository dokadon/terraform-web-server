fdisk /dev/xvdh << DO_THIS
n




w
q
DO_THIS
mkfs.ext4 /dev/xvdh1
mkdir /var/lib/jenkins
echo "/dev/xvdh1 /var/lib/jenkins ext4 defaults 1 1" >> /etc/fstab
mount /var/lib/jenkins
