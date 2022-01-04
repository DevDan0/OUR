pkgname=tmux
pkgver=3.2a
LICENSE=COPYING

fetch() {
	curl -L "https://github.com/tmux/tmux/releases/download/3.2a/tmux-3.2a.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
	./configure
	make
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
