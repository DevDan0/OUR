pkgname=gdbm
pkgver=1.22
LICENSE=COPYING

fetch() {
        curl -l "https://ftp.gnu.org/gnu/gdbm/gdbm-1.22.tar.gz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
        ./configure --enable-libgdbm-compat COMPATINCLUDEDIR=/usr/include/gdbm
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
