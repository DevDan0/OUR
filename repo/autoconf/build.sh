pkgname=autoconf
pkgver=2.52
LICENSE=COPYING

fetch() {
	curl -L https://ftp.gnu.org/gnu/autoconf/autoconf-2.52.tar.bz2 -o $pkgname-$pkgver.tar.bz2
	tar -xf $pkgname-$pkgver.tar.bz2
}

build() {
        cd $pkgname-$pkgver
	./configure
	make clean
}

package() {
        cd $pkgname-$pkgver
	make clean install
}

uninstall() {
        cd $pkgname-$pkgver
	make uninstall
}
license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
