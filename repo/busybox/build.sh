pkgver=1.34.1
pkgname=busybox
LICENSE=LICENSE

fetch() {
	curl "http://nic.orangeos.xyz:8906/sysutils/$pkgname/$pkgname-$pkgver.tar.xz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
	cd $pkgname
	patch -p1 < ../../clang-fix.patch
	patch -p1 < ../../modprobe.patch
}

build() {
	cd $pkgname
	make HOSTCC=cc CC=cc defconfig
	make HOSTCC=cc CC=cc
	make HOSTCC=cc CC=cc install
}

package() {
	cd $pkgname
	install -d
	cp -r ./_install/* 
	chmod 4755 /bin/busybox
	install -d /etc/profile.d
	install -Dm755 ./examples/udhcp/simple.script /usr/share/udhcpc/default.script
}

license() {
	cd $pkgname
	cat $LICENSE
}
