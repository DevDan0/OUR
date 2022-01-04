pkgname=tinycc
pkgver=ca11849
LICENCE=COPYING

fetch() {
  curl "https://repo.or.cz/tinycc.git/snapshot/ca11849ebb88ef4ff87beda46bf5687e22949bd6.tar.gz" -o $pkgname.tar.gz
  tar -xf $pkgname.tar.gz
}

build() {
  cd $pkgname-$pkgver
  ./configure
  make
  make test
}

package() {
  cd $pkgname-$pkgver
  make install
}


licence() {
  cd $pkgname-$pkgver
  cat $LICENCE
}
