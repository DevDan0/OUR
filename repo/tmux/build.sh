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
	# Only changes that you possibly need to do but not neccesarily is that you change the folder to the one that is the equivilent of the
	# tar's folder. You must provide a LICENSE file.
        cd $pkgname-$pkgver
        cat $LICENSE
}
