pkgname=pango
_pkgver=1.48
pkgver=$_pkgver.10
LICENSE=LICENSE

fetch() {
	curl -L "https://download.gnome.org/sources/pango/$_pkgver/pango-$pkgver.tar.xz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
	mkdir $pkgname-$pkgver/build
	cd $pkgname-$pkgver
	rm -rf subprojects
	: > tests/meson.build
	: > examples/meson.build
	: > docs/meson.build
	patch -p1 < ../../no-fribidi.patch
}

build() {
	cd $pkgname-$pkgver
	cd build
	meson .. \
		--buildtype=release \
		--prefix=/usr \
		--libexecdir=lib \
		-Dgir=false \
		-Dgtk_doc=false \
		-Dxft=disabled \
		-Dintrospection=disabled \
		-Dinstall_tests=false
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
	cat LICENSE
}
