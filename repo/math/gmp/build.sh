pkgname=gmp
pkgver=6.2.1
LICENSE="COPYING.LESSERv3 COPYINGv2 COPYINGv3 COPYING"

fetch() {
        curl -l "https://gmplib.org/download/gmp/gmp-6.2.1.tar.xz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
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
}

license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
