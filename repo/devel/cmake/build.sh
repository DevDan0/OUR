pkgver=3.21.0
pkgname=cmake
LICENSE=Copyright.txt

fetch() {
	curl "https://cmake.org/files/v3.21/cmake-3.21.0.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
    cd $pkgname-$pkgver
    ./bootstrap \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --datadir=/usr/share/$pkgname \
    --docdir=/usr/share/doc/$pkgname \
    --generator=Ninja \
    --no-system-libs
    samu
}

package() {
    cd $pkgname-$pkgver
    samu install

}

package_doc() {
    cd $pkgname-$pkgver
    make install
#   rm -r $pkgdir/usr/bin
#   rm -r $pkgdir/usr/share/info
#   rm -r $pkgdir/usr/include
}
package_dev() {
    cd $pkgname-$pkgver
    make install
#   rm -r $pkgdir/usr/bin
#   rm -r $pkgdir/usr/share
}

license() {
    cd $pkgname-$pkgver
    cat $LICENSE
}
