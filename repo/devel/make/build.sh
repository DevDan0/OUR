pkgver=4.3
pkgname=make
pkgrel=1
deps="musl"
bad="make"
ext="doc:dev"
LICENSE=COPYING

fetch() {
	curl "https://ftp.gnu.org/gnu/make/make-4.3.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
	cd $pkgname-$pkgver
	./configure \
		--prefix=/usr \
		--disable-nls
	make
}

package() {
	cd $pkgname-$pkgver
	./make install
#	rm -r $pkgdir/usr/share
#	rm -r $pkgdir/usr/include
}

package_doc() {
	cd $pkgname-$pkgver
	./make install
#	rm -r $pkgdir/usr/bin
#	rm -r $pkgdir/usr/share/info
#	rm -r $pkgdir/usr/include
}
package_dev() {
	cd $pkgname-$pkgver
	./make install
#	rm -r $pkgdir/usr/bin
#	rm -r $pkgdir/usr/share
}

license() {
	cd $pkgname-$pkgver
	cat $LICENSE
}
