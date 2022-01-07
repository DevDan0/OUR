pkgname=flex
pkgver=2.6.4
LICENSE=COPYING

fetch() {
        curl -L "https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver 
        ./autogen.sh
        ./configure --prefix=/usr
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
