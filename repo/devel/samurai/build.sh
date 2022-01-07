pkgver=1.2
pkgname=samurai
LICENSE=LICENSE

fetch() {
	curl -L "http://github.com/michaelforney/samurai/releases/download/1.2/$pkgname-$pkgver.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
	cd $pkgname-$pkgver
	ninja
}

package() {
	cd $pkgname-$pkgver
	make install
}

license() {
	cd $pkgname-$pkgver
	cat $LICENSE
}
