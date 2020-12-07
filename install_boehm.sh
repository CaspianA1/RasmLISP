version="gc-8.0.4"
install_dir="/usr/local/bin"
rm -r lib/GC/$version
echo "Install the newest archive here: https://github.com/ivmai/bdwgc/releases"
echo "Once you're done put it in the lib/GC directory."
read delay
cd lib/GC
tar xvfz "${version}.tar.gz"
cd $version
./configure --prefix=$install_dir --disable-threads
make  # CFLAGS_EXTRA="-DGC_PRINT_VERBOSE_STATS"
make check
make install
