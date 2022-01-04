pkgname=levditor
pkgver=master
LICENSE=LICENSE

fetch() {
	git clone https://github.com/DevDan0/Levanditor --depth 1 --jobs 5 "$pkgname-$pkgver"
	
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
  echo "LICENSE: N/A"
}




