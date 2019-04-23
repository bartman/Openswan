# Makefile for the Openswan in-tree test cases
# Copyright (C) 2014 Michael Richardson <mcr@xelerance.com>
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2 of the License, or (at your
# option) any later version.  See <http://www.fsf.org/copyleft/gpl.txt>.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.

OPENSWANSRCDIR?=$(shell cd ../../..; pwd)
srcdir?=${OPENSWANSRCDIR}/tests/unit/libpluto

all: programs

include ${OPENSWANSRCDIR}/Makefile.inc

UNITTESTS_0+=lp003-whacksemantics
UNITTESTS_0+=lp004-nsscert
UNITTESTS_0+=lp005-sha256cert
UNITTESTS_0+=lp007-orient
UNITTESTS_0+=lp028-addrinfoserialize
UNITTESTS_0+=lp029-adns
UNITTESTS_0+=lp030-dnskick
UNITTESTS_0+=lp031-IDhostpair
UNITTESTS_0+=lp033-IDanypair
UNITTESTS_0+=lp033-dnsload2
UNITTESTS_0+=lp033-IDanypair
UNITTESTS_0+=lp034-orientafterlisten
UNITTESTS_0+=lp040-orientafterprivate
UNITTESTS_0+=lp041-orientmoon
UNITTESTS_0+=lp042-loadbobdefaultroute
UNITTESTS_0+=lp050-rekey-no-reply-rekey
UNITTESTS_0+=lp060-bestif
UNITTESTS_0+=lp070-invalid-init-msg

UNITTESTS_I1+=lp002-parentI1
UNITTESTS_R1+=lp006-parentR1notchosen
UNITTESTS_R1+=lp008-parentR1
UNITTESTS_I2+=lp010-parentI2
UNITTESTS_I2+=lp011-parentI2dup
UNITTESTS_R2+=lp012-parentR2
UNITTESTS_I3+=lp013-parentI3

UNITTESTS_I1+=lp014-initiateself
UNITTESTS_R1+=lp015-respondself
UNITTESTS_I2+=lp016-initiateselfI2
UNITTESTS_R2+=lp017-childselfpolicy

UNITTESTS_I1+=lp018-certificateselfI1
UNITTESTS_R1+=lp019-certreplyselfR1
UNITTESTS_I2+=lp020-certificateselfI2
UNITTESTS_R2+=lp021-certreplyselfR2
UNITTESTS_R2+=lp022-certreplymanyR2



UNITTESTS_I1+=lp023-davecertI1
UNITTESTS_R2+=lp024-certreplydaveR2
UNITTESTS_R2+=lp025-wrongcacert
UNITTESTS_I2+=lp026-davecertI2

UNITTESTS_I1+=lp027-dnsloadI1
UNITTESTS_R2+=lp032-parentR2anychoice
UNITTESTS_I1+=lp036-h2hI1
UNITTESTS_R1+=lp037-h2hR1
UNITTESTS_I2+=lp038-h2hI2
UNITTESTS_R2+=lp039-h2hR2

UNITTESTS_I1+=lp071-alg-h2hI1
UNITTESTS_R1+=lp072-alg-h2hR1
UNITTESTS_I2+=lp073-alg-h2hI2
UNITTESTS_R2+=lp074-alg-h2hR2
UNITTESTS_I3+=lp075-alg-h2hI3
UNITTESTS_I3+=lp076-s2s-while-h2h-I1

UNITTESTS_I3+=lp077-del-matching-st
UNITTESTS_R4+=lp080-h2h-rekeyikev2-R2-msgid0
UNITTESTS_I3+=lp081-h2h-rekeyikev2-I3-msgid0
UNITTESTS_R2+=lp082-h2h-deleteSA-R2
UNITTESTS_I3+=lp083-h2h-deleteSA-I3
UNITTESTS_R2+=lp084-h2h-deleteSA-R2-R
UNITTESTS_I3+=lp085-h2h-invalid-deleteSA-I3
UNITTESTS_R2+=lp086-h2h-invalid-deleteSA-R2-R
UNITTESTS_I1+=lp090-h2h-sareplace-I1
UNITTESTS_R1+=lp091-h2h-sareplace-R1

UNITTESTS_I1+=lp043-parentM1

UNITTESTS_R1+=lp044-h2hR1-deny-ikev1
UNITTESTS_R1+=lp045-h2hR1-noikev2
UNITTESTS_I1+=lp046-rekeyikev2-I1
UNITTESTS_R1+=lp047-rekeyikev2-R1
UNITTESTS_I4+=lp048-rekeyikev2-inCR1
UNITTESTS_I1+=lp052-davecert-gatewayID-I1
UNITTESTS_R1+=lp053-davecert-gatewayID-R1
UNITTESTS_I2+=lp054-davecert-gatewayID-I2
UNITTESTS_R2+=lp055-davecert-gatewayID-R2
UNITTESTS_I1+=lp056-rekeyv2nopfs-I1
UNITTESTS_R1+=lp057-rekeyv2nopfs-R1
UNITTESTS_I4+=lp058-rekeyv2nopfs-inCR1
UNITTESTS_I1+=lp061-nattI1
UNITTESTS_R1+=lp062-nattR1
UNITTESTS_I2+=lp063-nattI2
UNITTESTS_R2+=lp064-nattR2
UNITTESTS_I3+=lp065-nattI3
UNITTESTS_I4+=lp066-natt-replaceI
UNITTESTS_R4+=lp067-natt-replaceR

UNITTESTS_I1+=lp087-rekeyv2-inval-I1
UNITTESTS_R1+=lp088-rekeyv2-inval-R1
UNITTESTS_I4+=lp089-rekeyv2-inval-inCR1

# first runs tests that have no interdependancies
UNITTESTS=${UNITTESTS_0}
# then run all the I1,R1,I2,R2,I3
UNITTESTS+=${UNITTESTS_I1}
UNITTESTS+=${UNITTESTS_R1}
UNITTESTS+=${UNITTESTS_I2}
UNITTESTS+=${UNITTESTS_R2}
UNITTESTS+=${UNITTESTS_I3}
UNITTESTS+=${UNITTESTS_I4}
UNITTESTS+=${UNITTESTS_R4}

# running 'make check KEEPGOING=1' will run through all tests w/o stopping
ERROR_CHECK=$(if ${KEEPGOING},,set -e;)
programs clean check pcapupdate:
	@${ERROR_CHECK} for unittest in ${UNITTESTS}; do ${MAKE} -C $$unittest $@; done

testlist:
	@echo ${UNITTESTS}
