#!/bin/sh

echo -n "%%%{PBXSelection}%%%"
/opt/local/bin/uncrustify -q -l oc+ -c $HOME/bin/uncrustify.cfg <&0
echo -n "%%%{PBXSelection}%%%"
