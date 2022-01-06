pkgname=byacc
pkgver=24_12_21
LICENSE=LICENSE

fetch() {
        curl -L "http://nic.orangeos.xyz:8906/devel/byacc/$pkgname-$pkgver.tar.xz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
}

build() {
        cd $pkgname
        ./configure --prefix=/usr
        make
}

package() {
        cd $pkgname
        make install
}

license() {
        cd $pkgname
        cat $LICENSE
}

