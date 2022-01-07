pkgname=libffi
pkgver=3.4.2
LICENSE=LICENSE-BUILDTOOLS LICENSE 

fetch() {
        curl -l "https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz" -o $pkgname-$pkgver.tar.gz
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
