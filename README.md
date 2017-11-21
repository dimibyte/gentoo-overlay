# Dimibyte's Gentoo Overlay

### How to add the overlay
As a superuser, add to /etc/portage/repos.conf/gentoo.conf the following:

    [dimibyte]
    location = /var/db/git/dimibyte
    sync-type = git
    sync-uri = https://github.com/dimibyte/gentoo-overlay.git

#### media-plugins/alsaequal

Using [topic materials](https://forums.gentoo.org/viewtopic-p-7807070.html#7807070), bugfix for:

    $ alsamixer -D equal
    ALSA lib ctl_equal.c:289:(_snd_ctl_equal_open) Problem with control file .alsaequal.bin.
    cannot open mixer: Operation not permitted

Some notes about configuration can be found [here](https://forums.gentoo.org/viewtopic-p-7236424.html?sid=a4c096766ec5366fb4f3fa775c355027#7236424).
