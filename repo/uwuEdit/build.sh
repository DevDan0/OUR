pkgname=uwuEdit
pkgver=31_08_21
LICENSE=LICENSE

fetch() {
	wget http://nic.orangeos.xyz:8906/uwuTools/uwuEdit/$pkgname-$pkgver.tar.xz
	tar xvf $pkgname-$pkgver.tar.xz
}

build() {
	cd $pkgname
	echo "Nothing to do"
}

package() {
	cd $pkgname
	./install.sh
}

license() {
	cd $pkgname
	cat $LICENSE
}

uninstall() {
	# why did i do symlinks
	if [[ -L /bin ]]; then
		rm /bin/uwuEdit
	else
		rm /usr/bin/uwuEdit
		rm /bin/uwuEdit
	fi
}
