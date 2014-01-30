# Top level makefile for Slackware firewall.
# (C) 2013..2014 Michiel Broek
#

all:
	@echo "Nothing to do."


install:
	@mkdir -p ${DESTDIR}/etc/mbse-firewall/conf.d
	@mkdir -p ${DESTDIR}/usr/sbin
	install -m 0644 etc/firewall.conf ${DESTDIR}/etc/mbse-firewall
	install -m 0644 etc/*.example ${DESTDIR}/etc/mbse-firewall/conf.d
	install -m 0755 sbin/mbse-firewall ${DESTDIR}/usr/sbin
	@mkdir -p ${DESTDIR}/etc/rc.d
	cd ${DESTDIR}/etc/rc.d ; ln -s /usr/sbin/mbse-firewall rc.firewall ; cd -

dist:
	cd .. ; tar cvfz mbse-firewall-`grep MBSEFW_VERSION= mbse-firewall/sbin/mbse-firewall | cut -d '=' -f 2 | tr -d '"'`.tar.gz mbse-firewall/* ; cd -
