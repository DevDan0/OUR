pkgname=zig
pkgver=0.9.0
LICENSE=LICENSE

fetch() {
	curl -L "https://ziglang.org/download/0.9.0/zig-0.9.0.tar.xz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
}

build() {
        cd $pkgname-$pkgver
	mkdir build
	cmake \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DZIG_PREFER_CLANG_CPP_DYLIB=ON
	cmake --build build
	make
}

package() {
        cd $pkgname-$pkgver
	make clean install
}

remove() {
        cd $pkgname-$pkgver
	rm /usr/bin/zig
}
license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
