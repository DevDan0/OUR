pkgver=0.8.6
pkgname=toybox
LICENSE=LICENSE

fetch() {
	curl "http://www.landley.net/toybox/downloads/$pkgname-$pkgver.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
	curl "https://pci-ids.ucw.cz/v2.2/pci.ids" -o pci.ids
	cd $pkgname-$pkgver
	patch -p1 < ../../ls-colour.patch
	patch -p1 < ../../mksh-make.patch
	patch -p1 < ../../xxd-i.patch
}

build() {
	cd $pkgname-$pkgver
	CPUS=1 make defconfig
	CPUS=1 make 
}

backup() {
	return
}

package() {
	install -d $pkgdir/usr/share/misc
	install -Dm 644 pci.ids $pkgdir/usr/share/misc

	cd $pkgname-$pkgver
	install -d /bin
	install -Dm755 ./toybox /bin/
	install -d /usr/bin
	make install
}

license() {
	cd $pkgname-$pkgver
	cat $LICENSE
}
