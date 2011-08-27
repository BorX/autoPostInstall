Goals
=====
Post-install script (great after very soft Debian GNU/Linux installation), easy to customize and to maintain.

Working
=======
All the script turns around the `packages/packages.list` file who lists which packages should be installed.

A package refers to a subdirectory of `packages` directory.
For each package listed in `packages/packages.list` file, the main script invokes the `install.sh` file placed in its directory.

Installation
============
`git clone git://github.com/BorX/autoPostInstall.git`

For installing a Xen VM, it mays be interesting to clone it in `/etc/xen-tools/skel/opt/` directory.

Using
=====
Configuration
-------------
* Customize your packages in each subdirectory of the `packages` directory
* Select, in the `packages/packages.list` file, which packages who should be installed and in which order

Running
-------
* Run the script by invoking `autoPostInstall.sh`
