pkgname=libevent
pkgver=2.1.12
LICENSE=LICENSE

fetch() {
	curl -L https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
	mv $pkgname-$pkgver-stable $pkgname-$pkgver
}

build() {
        cd $pkgname-$pkgver
	./configure
	make
}

package() {
	make clean install
}

uninstall() {
	make uninstall
}

license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
