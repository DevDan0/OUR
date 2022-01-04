pkgname= # Fill with the name of the package
pkgver= # Fill with the version of the package (If GitHub's zip file, usually master or main)
LICENSE= # The License file inside the source code

fetch() {
	# Do not use Git or .zip files for fetching!
	# The source needs to be able to be extracted with tar to keep dependencies as low as possible.
	# For a .tar.xz file you want to use the following command (And put link to the file between "" `curl -L "" -o $pkgname-$pkgver.tar.xz`
	# For a .tar.gz file you want to use the following command (And put link to the file between "" `curl -L "" -o $pkgname-$pkgver.tar.gz`
	# For a .tar.bz2 file you want to use the following command (And put link to the file between "" `curl -L "" -o $pkgname-$pkgver.tar.bz2`

	# After the source is downloaded, you want to extract it.
	# If you have a some sort of tar package use `tar -xf $pkgname-$pkgver.tar.##´ (replace ## with correct extension) 
}

build() {
        # This part is different with every package. This is where you compile the package. I cannot give examples but usually this part starts
	# with `cd $pkgname-$pkgver` but this depends on the tar or zip file. Instuctions on how to make this part is included in the source of
	# of the package you're making.
}

package() {
        # This part is different with every package. This is where you install the package. I cannot give examples but usually this part starts
        # with `cd $pkgname-$pkgver` but this depends on the tar or zip file. Instuctions on how to make this part is included in the source of
        # of the package you're making.
}

remove() {
	# This part is different with every package. This is where you have remove instructions to delete the package.
	# This will heavily differ between packages with some using `make uninstall` and multiple different build systems. You will likely have to 
	# lookup what the uninstall commands are for the build system being used (make, meson, etc.) and on some more obscure packages you will need to 
	# manually `rm -rf` the file paths
}
license() {
	# Only changes that you possibly need to do but not neccesarily is that you change the folder to the one that is the equivilent of the
	# tar's folder. You must provide a LICENSE file.
        cd $pkgname-$pkgver
        cat $LICENSE
}
