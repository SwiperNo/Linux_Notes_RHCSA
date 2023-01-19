#Create physical volume for vdo disk
sudo pvcreate /dev/mapper/advancedlab

#create volume group for vdo 
sudo vgcreate vg_advancedlab /dev/mapper/advancedlab

#verify
sudo vgdisplay vg_advancedlab
sudo vgdisplay

#Create two logical volumes
sudo lvcreate -n lvAL -L 5G vg_advancedlab
sudo lvs
sudo vgs

#Make FS type xfs - preping to mount the two logical volumes
sudo mkfs.xfs -K /dev/vg_advancedlab/lvAL

#Verify configuration
lsblk


#Create directory to mount
sudo mkdir /data
sudo mkdir /data/advancedlab_storage
lsblk

#Mount file system to system
sudo mount -o discard /dev/vg_advancedlab/lvAL /data/advancedlab_storage
