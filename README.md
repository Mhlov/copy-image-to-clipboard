# copy-image-to-clipboard

Copy-image-to-clipboard is a desktop file that provides the function
of copying an image to the X clipboard in file managers that supporting
desktop files :)

## INSTALLATION

There are two variants to install. The first is a separate desktop file
and the second is a desktop and a shell script files.

### A desktop file only

#### Dependecies

* xclip
* perl
* MIME::Types (perl module)

	sudo apt-get install xclip perl libmime-types-perl

#### Installation

	cp share/copy-image-to-clipboard.desktop $HOME/.local/share/applications/
	update-desktop-database $HOME/.local/share/applications/

### With a shell script 

#### Dependencies

* xclip
* file

	sudo apt-get install xclip file

#### Installation

	cp bin/img2clip $HOME/bin/
	cp share/img2clip.desktop $HOME/.local/share/applications/
	update-desktop-database $HOME/.local/share/applications/

