pkgname=neofetch
pkgver=master
LICENSE=LICENSE.md

fetch() {
	curl -L "https://github.com/dylanaraps/$pkgname/archive/refs/heads/$pkgver.zip" -o $pkgname-$pkgver.zip
	unzip $pkgname-$pkgver.zip
}

build() {
	cd $pkgname-$pkgver
	echo "Nothing to do"
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 neofetch /usr/bin/
}

license() {
	cd $pkgname-$pkgver
	cat $LICENSE
}
