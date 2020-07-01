# copy-image-to-clipboard

Copy-image-to-clipboard is a desktop file that provides a function of copy an
image to the X clipboard in file managers that support desktop files :)

## INSTALLATION

There are two variants for installation. The first is a separate desktop file
and the second is a desktop file with a script.

### Dependecies

* xclip
* perl
* MIME::Types (perl module)

```
sudo apt-get install xclip perl libmime-types-perl
```

### Desktop file only

```
mkdir -p $HOME/.local/share/applications
cp share/copy-image-to-clipboard.desktop $HOME/.local/share/applications/
update-desktop-database $HOME/.local/share/applications/
```

### Desktop file with a script

```
cp bin/img2clip $HOME/bin/
mkdir -p $HOME/.local/share/applications
cp share/img2clip.desktop $HOME/.local/share/applications/
update-desktop-database $HOME/.local/share/applications/
```

