# mount-idun

> Mount home and work directories from the samba share at [Idun HPC cluster](https://www.hpc.ntnu.no/display/hpc/Idun+Cluster) at NTNU.

This script mounts the home and work directories from Idun to your (Linux) computer, to allow for downloading and uploading your files (as an alternative to scp/sftp).
To change permissions, mount points or samba server, please change the configuration variables in the script.

Default mount points:

* `/tmp/hpc-work` (lustre share)
* `/tmp/hpc-home` (home directory)

Default samba server:

* `idun-samba1.hpc.ntnu.no`(see up-to-date information on the samba share [here](https://www.hpc.ntnu.no/display/hpc/Transferring+Data))

Default user/group: (check your id's with `id`)

* uid: 1000
* gid: 1000


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
  * Recommended: To add the VPN [natively to your network connections in your DE](https://grepitout.com/install-openconnect-ubuntu-vpn-client/) with [openconnect](http://www.infradead.org/openconnect/) (not using the Cisco AnyConnect GUI app): Execute `sudo apt install openconnect network-manager-openconnect network-manager-openconnect-gnome` (Ubuntu Gnome) and open Network settings to add `vpn.ntnu.no` and username/password. You can then initiate a VPN connection from your network settings in your task/status bar.
  * Alternatively, use `sudo openconnect vpn.ntnu.no` in a terminal window to initiate a VPN connection. Enter username and password when prompted. To run in the background, use `sudo openconnect -b vpn.ntnu.no`
* You might need to install dependency `cifs-utils` or similar to mount shares, depending on your Linux distro
  * Install with: `sudo apt install cifs-utils` (Debian/Ubuntu)

## Licence

* [MIT License](LICENSE)
