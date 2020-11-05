version_number="8.0.4"
cd lib/GC
tar xvfz gc-$version_number.tar.gz
cd gc-$version_number
./configure --disable-threads
make
make check
make install