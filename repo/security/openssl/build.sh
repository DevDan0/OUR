pkgname=openssl
pkgver=3.0.0
LICENSE=LICENSE.txt

fetch() {
        curl -l "https://www.openssl.org/source/openssl-3.0.0.tar.gz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
        ./Configure
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
