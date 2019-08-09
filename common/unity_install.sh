if [ -f "/system/xbin/fd" ]; then
  BIN="xbin"
else
  BIN="bin"
fi

cp_ch -i $TMPDIR/fd $TMPDIR/system/$BIN/fd

# Get rep/nrep from zip name
OIFS=$IFS; IFS=\|; MID=false; NEW=false
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *nrep*) REP=true;;
  *rep*) REP=false;;
esac
IFS=$OIFS

$REP && sed -i "s|<BIN>|$BIN|" $TMPDIR/common/service.sh || rm -f $TMPDIR/common/service.sh
