/tracing thread pid = \(.*\)/d
s/spawn \(.*\) single/spawn PATH single/
s/Program invoked with \(.*\)\/start.sh/Program invoked with PATH\/start.sh/
s/Starting UML \(.*\)\/start.*sh/Starting UML PATH\/start.sh/
s/Kernel command line: .*/Kernel command line:/
/mconsole .*initialized on .*/d
s/Calculating module dependencies... .*/Calculating module dependancies/
s/Loading modules: .*/Loading modules: LIST/
/modprobe: /d
s/Calibrating delay loop... .*/Calibrating delay loop... XXXX bogomips/
s/Linux version .*/Linux version XXXX/
/hostfs on /d
s/devfs: v.* Richard Gooch (rgooch@atnf.csiro.au)/devfs: VERSION Richard Gooch (rgooch@atnf.csiro.au)/
s/devfs: boot_options: .*/devfs: boot_options Q/
s/block: .*/block: slots and queues/
/INIT: can't open(.etc.ioctl.save, O_WRONLY): Permission denied/d
/VFS: Mounted root (root.hostfs filesystem) readonly./d
s/^VFS: Disk.*/VFS: Diskquotas version dquot_6.4.0 initialized/
/ipsec_setup: Unknown HZ value! .* Assume 100./d
/^Checking for/d
/^Checking that/d
/^Memory: .* available/d
/^Netdevice .* : daemon backend.*/d
/^daemon_setup : Ignoring data socket specification/d
/^unable to open /d
/^nbd: module cleaned up./d
/^ip_conntrack .*/d
/^ip_tables: .*/d
/echo Starting loading module/,/^Finished loading module.*/d
/^none on \/testing type hostfs .*/d
/^none on \/usr\/src type hostfs .*/d
/^zone(.): .* pages./d
/^Initializing stdio console driver/d
/^cp: .etc.nologin: No such file or directory/d
/Openswan KLIPS IPsec stack version: .*/d
/Kernel logging (proc) stopped/d
/Kernel log daemon terminating/d
s/\(Dentry\).\(cache hash table entries:\).*/\1-\2 NUMBERS/
s/\(Inode\).\(cache hash table entries:\).*/\1-\2 NUMBERS/
s/\(Mount.cache hash table entries:\).*/Mount-cache hash table entries: NUMBERS/
s/\(Buffer.cache hash table entries:\).*/Buffer-cache hash table entries: NUMBERS/
s/\(Page-cache hash table entries:\).*/\1 NUMEBRS/
/block: slots and queues/d
/RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize/d
s/\(PPP generic driver version\).*/\1 VERSION/
s/\(Universal TUN\/TAP device driver\).*/\1 VERSION/
/arp_tables: /d
/^Checking whether the host supports skas mode/d
/^blkmtd: error, missing `device' name/d
/^Initializing software serial port version/d
s/TCP: Hash tables configured (established .* bind .*)/TCP: Hash tables configured (established 2048 bind 2048)/
/Configured mcast device: .*/d
/Netdevice 2/d
/VFS: Mounted root /d
/blkmtd: .*/d
/ipt_recent /d
/klips_info:pfkey_cleanup: shutting down PF_KEY domain sockets./d
/klips_info:cleanup_module: ipsec module unloaded./d
/klips_info:ipsec_alg_init: KLIPS alg v=0.8.1-0.*/d
/klips_info:ipsec_alg_init: calling ipsec_alg_static_init.*/d
/ipsec_aes_init(alg_type=15 alg_id=12 name=aes): ret=0/d
/ipsec_aes_init(alg_type=14 alg_id=9 name=aes_mac): ret=0/d
/aio_thread failed to initialize context/d
/2.6 AIO not supported/d
/Disabling 2.6 AIO in tt mode/d
/none on \/usr\/local/d
/none on \/var\/tmp/d
/^$/d
/INIT: Switching to runlevel: 0/d
/INIT: Sending processes the TERM signal/d

