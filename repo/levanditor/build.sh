pkgname=levanditor
pkgver=master
LICENSE = LICENSE

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
	./installer.sh
}

remove() {
  ./uninstall.sh
}

LICENSE() {
  echo "LICENSE: N/A"
}




