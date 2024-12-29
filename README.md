# gentoo-overlay

This is my personal gentoo overlay to fit my 3D addict needs.

All packages in my overlay are usable but not enough tested to be considered stable. Keywords have to be set in `/etc/portage/package.accept_keywords` if your system is globally set on a stable keyword.

## Install this overlay in your system

### Using `app-eselect/eselect-repository`

```
eselect repository enable lastrodamo
```

### Using `app-portage/layman`

```
layman -fa lastrodamo
```

### Installing in `/etc/portage/repos.conf/lastrodamo.conf`

```
[Case_Of]
# Set the priority you wish to use
priority = 1000
location = /path/to/lastrodamo-overlay
sync-type = git
sync-uri = https://codeberg.org/lastrodamo/gentoo-overlay.git
```

## Signature

This overlay commits are signed with the PGP key `` that I also use in Gentoo's official portage tree contributions.