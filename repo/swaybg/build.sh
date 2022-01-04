pkgname=swaybg
pkgver=1.1
LICENSE=LICENSE

fetch() {
	curl -L "https://github.com/swaywm/swaybg/releases/download/v$pkgver/swaybg-$pkgver.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
	mkdir $pkgname-$pkgver/build
}

build() {
	cd $pkgname-$pkgver
	cd build
	meson .. \
		--buildtype=release \
		--prefix=/usr \
		--libexecdir=lib
	samu
}

package() {
	cd $pkgname-$pkgver
	cd build
	samu install
}

license() {
	cd $pkgname-$pkgver
	cat $LICENSE
}
