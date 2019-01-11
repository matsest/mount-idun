# mount-idun

> Mount home and work directories from the samba share at [Idun HPC cluster](https://www.hpc.ntnu.no/display/hpc/Idun+Cluster) at NTNU.

This script mounts the home and work directories from Idun to your (Linux) computer, to allow for downloading and uploading your files (as an alternative to scp/sftp).
To change mount points or samba server, please change the configuration variables in the script.

Default mount points:

* `/tmp/hpc-work` (lustre share)
* `/tmp/hpc-home` (home directory)

Default samba server:

* `idun-samba1.hpc.ntnu.no`(see up-to-date information on the samba share [here](https://www.hpc.ntnu.no/display/hpc/Transferring+Data))

## Usage

    # Mount
    mount-idun.sh
    
    # Unmount
    mount-idun.sh -u
    
    # Display help
    mount-idun.sh -h

## Limitations

* Script be executed with sudo (root) privileges to mount shares
* You must be at NTNU campus or connected with VPN ([How-to](https://innsida.ntnu.no/wiki/-/wiki/English/Install+VPN)) 
* You might need to install `cifs-utils` or similar, depending on your Linux distro

## Licence

* [MIT License](LICENSE)
