pkgname=readline
pkgver=master
LICENSE=COPYING

fetch() {
        curl -l "http://git.savannah.gnu.org/cgit/readline.git/snapshot/readline-master.tar.gz" -o $pkgname-$pkgver.tar.gz
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
