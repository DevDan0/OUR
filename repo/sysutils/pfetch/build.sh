pkgname=pfetch
pkgver=master
LICENSE=LICENSE.md

fetch() {
	curl -L "https://github.com/dylanaraps/pfetch/archive/refs/heads/master.zip" -o $pkgname-$pkgver.zip
	unzip $pkgname-$pkgver.zip
}

build() {
	cd $pkgname-$pkgver
	echo "Nothing to do"
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 pfetch /usr/bin/
}

license() {
	cd $pkgname-$pkgver
	cat $LICENSE
}
