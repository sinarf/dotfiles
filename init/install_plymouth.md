# plymouth


To `/etc/mkinitcpio.conf`
Add `i915` to `MODULES`
Add `plymouth` to the HOOKS

Add the following parameter to kernel /boot/loader/entries/2023-04-11_11-49-25_linux.conf 
:
`quiet splash loglevel=3 rd.udev.log_priority=3 vt.global_cursor_default=0`

Install the theme:
`sudo plymouth-set-default-theme -R neat`
