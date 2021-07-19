pkgver=0.8.5
pkgname=toybox
pkgrel=1
deps="musl:pci-ids"

fetch() {
	curl "http://www.landley.net/toybox/downloads/$pkgname-$pkgver.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
	cd $pkgname-$pkgver
	CPUS=1 make defconfig
	CPUS=1 make
}

package() {
	cd $pkgname-$pkgver
#	install -d $pkgdir/bin
#	install -Dm755 ./toybox $pkgdir/bin/
#	ln -sr $pkgdir/bin/toybox $pkgdir/bin/ln
#	ln -sr $pkgdir/bin/toybox $pkgdir/bin/uname
#	install -d $pkgdir/usr/bin
#	ln -sr $pkgdir/bin/toybox $pkgdir/usr/bin/install
#	ln -sr $pkgdir/bin/toybox $pkgdir/usr/bin/lspci
	gmake PREFIX=$pkgdir install

	# Provided by NetBSD Curses
	rm $pkgdir/usr/bin/clear
	rm $pkgdir/usr/bin/reset

	# LLVM Provides this
	rm $pkgdir/usr/bin/readelf
#	rm $pkgdir/usr/bin/tar
}

license() {
	cd $pkgname-$pkgver
	cat LICENSE
}
