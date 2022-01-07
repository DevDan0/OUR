pkgname=yaml
pkgver=0.2.5
LICENSE=License

fetch() {
        curl -L "http://pyyaml.org/download/libyaml/yaml-0.2.5.tar.gz" -o $pkgname-$pkgver.tar.gz
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
 
