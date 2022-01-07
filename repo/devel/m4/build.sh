pkgname=m4
pkgver=1.4.19
LICENSE=COPYING

fetch() {
        curl -L "https://ftp.gnu.org/gnu/m4/m4-latest.tar.gz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
        ./configure
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
