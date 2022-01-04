pkgname=levditor
pkgver=master
LICENSE=LICENSE

fetch() {
	curl -L https://github.com/DevDan0/Levanditor/archive/refs/tags/Release.tar.gz -o $pkgname-$pkgver.tar.gz
	tar -xvf $pkgname-$pkgver.tar.gz
}

build() {
	cd $pkgname-$pkgver
	echo "Nothing to do"
}

package() {
	cd $pkgname-$pkgver/Editor
	sh ./installer.sh
}

uninstall() {
  cd $pkgname-$pkgver/Editor
  sh ./uninstall.sh
}

LICENSE() {
  cd $pkgname-$pkgver
  cat $LICENSE
}




