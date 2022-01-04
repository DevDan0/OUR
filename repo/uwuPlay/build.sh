pkgname=uwuPlay
pkgver=04_09_21
LICENSE=LICENSE

fetch() {
    wget http://nic.orangeos.xyz:8906/uwuTools/uwuPlay/$pkgname-$pkgver.tar.xz
    tar xvf $pkgname-$pkgver.tar.xz
}

build() {
    cd $pkgname
    echo "Nothing to do"
}

package() {
    cd $pkgname
    install -Dm755 uwuplay /usr/bin/
}

license() {
    cd $pkgname
    cat $LICENSE
}

uninstall() {
    rm /usr/bin/uwuplay
}
