pkgname=wayland
pkgver=1.20.0

fetch() {
	curl "http://nic.orangeos.xyz:8906/graphics/wayland/wayland-$pkgver.tar.xz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
	mkdir $pkgname-$pkgver/build
}

build() {
	cd $pkgname-$pkgver
	cd build
	meson .. \
		--buildtype=release \
		--prefix=/usr \
		-Dlibraries=true \
		-Dscanner=true \
		-Dtests=false \
		-Ddocumentation=false \
		-Ddtd_validation=false
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
	cat $LICENSE
}
