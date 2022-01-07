pkgname=nano
pkgver=main
LICENSE=LICENSE

fetch() {
	curl -L "https://github.com/MrVeink/nano/archive/refs/heads/main.zip" -o $pkgname-$pkgver.zip
	unzip $pkgname-$pkgver.zip
}

build() {
        cd $pkgname-$pkgver
	./autogen.sh
	sudo ./configure --prefix=/usr
	make
}

package() {
        cd $pkgname-$pkgver
	sudo make install
}

license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
