pkgname=sway
pkgver=4732325
LICENSE=LICENSE

fetch() {
	curl -L "http://nic.orangeos.xyz:8906/graphics/sway/sway-13_12_21.tar.xz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.gz
	mkdir $pkgname/build
	cd $pkgname
}

build() {
	cd $pkgname
	cd build
	meson .. \
		--buildtype=release \
		--prefix=/usr \
		--libexecdir=lib \
		-Ddefault-wallpaper=true \
		-Dzsh-completions=true \
		-Dbash-completions=false \
		-Dfish-completions=false \
		-Dxwayland=disabled \
		-Dtray=disabled \
		-Dgdk-pixbuf=disabled \
		-Dman-pages=disabled
	samu
}

package() {
	cd $pkgname
	cd build
	samu install
}

backup() {
	echo /etc/sway/config
}

license() {
	cd $pkgname-$pkgver
	cat $LICENSE
}
