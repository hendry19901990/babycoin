#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BABYCOIND=${BABYCOIND:-$SRCDIR/babycoind}
BABYCOINCLI=${BABYCOINCLI:-$SRCDIR/babycoin-cli}
BABYCOINTX=${BABYCOINTX:-$SRCDIR/babycoin-tx}
BABYCOINQT=${BABYCOINQT:-$SRCDIR/qt/babycoin-qt}

[ ! -x $BABYCOIND ] && echo "$BABYCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BBCVER=($($BABYCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for babycoind if --version-string is not set,
# but has different outcomes for babycoin-qt and babycoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$BABYCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $BABYCOIND $BABYCOINCLI $BABYCOINTX $BABYCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BBCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BBCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
