pkgname=zsh
pkgver=5.8
LICENSE=LICENSE

fetch() {
	curl -L "http://ftp.funet.fi/pub/unix/shells/zsh/zsh-5.8.tar.xz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
}

build() {
	cd $pkgname-$pkgver
	./configure
	make
	make check 
}

package() {
	cd $pkgname-$pkgver
	make install
	make install.man
	make install.fns
}

uninstall() {
        cd $pkgname-$pkgver
	make uninstall
}
license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
