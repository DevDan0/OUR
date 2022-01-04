pkgname=uwuTerm
pkgver=28_11_21
LICENSE=LICENSE

fetch() {
	wget http://nic.orangeos.xyz:8906/uwuTools/uwuTerm/$pkgname-$pkgver.tar.xz
	tar xvf $pkgname-$pkgver.tar.xz
}

build() {
	cd $pkgname
	meson build
	cd build
	meson compile
}

package() {
	cd $pkgname
	install -Dm755 build/uwuterm /usr/bin/
}

license() {
	cd $pkgname
    cat $LICENSE
}

uninstall() {
	rm /usr/bin/uwuterm
}