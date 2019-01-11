# mount-idun

Mount home and work directories from the samba share at [Idun HPC cluster](https://www.hpc.ntnu.no/display/hpc/Idun+Cluster) at NTNU.

This script mounts the home and work directories from Idun to your (Linux) computer. 
To change mount points or samba server, please change the configuration variables in the script.

Default mount points:

* `/tmp/hpc-work` (lustre share)
* `/tmp/hpc-home` (home directory)

## Usage

### Mount

    mount-idun.sh

### Unmount

    mount-idun.sh -u
    
### Display help

    mount-idun.sh -h

## Limitations

* Script be executed with sudo (root) privileges to mount shares
* You must be at NTNU campus or connected with VPN ([How-to](https://innsida.ntnu.no/wiki/-/wiki/English/Install+VPN)) 

## Licence

* [MIT License](LICENSE)
