#!/bin/sh

xclip -selection clipboard -t $(file -b --mime-type $1) -i $1
