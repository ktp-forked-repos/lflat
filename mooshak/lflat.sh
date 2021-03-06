#!/bin/bash
. ${0%${0##*/}}defs.sh

# Runs L-FLAT in the Mooshak context

export LOGTALKHOME=/usr/share/logtalk
export LOGTALKUSER=${MOOSHAK_HOME}logtalk

umask 0000
cat > input_test.lgt

/usr/bin/swilgt -q -g "{'$MOOSHAK_LFLAT_HOME/mloader'}, contests::$1('$2', input_test)." | tail --lines=+11

rm -f input_test.lgt input_test.pl $2.pl
