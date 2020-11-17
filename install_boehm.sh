echo Install the newest archive here: https://github.com/ivmai/bdwgc/releases
echo "Once you're done put it in the lib/GC directory."
read delay
cd lib/GC
tar xvfz *.gz
cd *
./configure --prefix=/usr/local/bin --disable-threads
make
make check
make install