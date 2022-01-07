pkgname=cairo
pkgver=master
LICENSE=COPYING*

fetch() {
        curl "https://gitlab.freedesktop.org/cairo/cairo/-/archive/master/cairo-master.tar.gz" -o $pkgname-$pkgver.tar>
        tar -xf $pkgname-$pkgver.tar.xz
        mkdir $pkgname-$pkgver/build
}

build() {
        cd $pkgname-$pkgver
        cd build
        meson .. \
                --buildtype=release \
                --prefix=/usr \
                --libexecdir=lib \
                -Dglib=enabled
        samu
}

package() {
        cd $pkgname-$pkgver
        cd build
        samu install
}

backup() {
        return
}

license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
