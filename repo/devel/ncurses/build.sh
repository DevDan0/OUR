pkgname=ncurses
pkgver=6.2
LICENSE=COPYING

fetch() {
        curl -l "https://invisible-island.net/datafiles/release/ncurses.tar.gz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
        ./configure --prefix=/usr --with-shared --without-normal --enable-overwrite
        make
}

package() {
        cd $pkgname-$pkgver
        make install
}

license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
