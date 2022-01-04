pkgname=levditor
pkgver=master
LICENSE=LICENSE

fetch() {
	git clone https://github.com/DevDan0/Levanditor --depth 1 --jobs 5
	cp -r Levanditor/$pkgname ./
	rm -rf Levanditor
}

build() {
	cd $pkgname
	echo "Nothing to do"
}

package() {
	cd $pkgname
	sh installer.sh
}

remove() {
   cd $pkgname-$pkgver
   sh uninstall.sh
}

LICENSE() {
  echo "LICENSE: N/A"
}




