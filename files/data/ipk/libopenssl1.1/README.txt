蒲公英用
data.tar.gz\.\usr\lib\libcrypto.so.1.1
data.tar.gz\.\usr\lib\libssl.so.1.1

可以用好压打开，直接把这两个文件放入/usr/lib即可


mv /usr/lib/libcrypto.so.1.1 /usr/lib/libcrypto.so.1.1.bak
mv /usr/lib/libssl.so.1.1 /usr/lib/libssl.so.1.1.bak
opkg install /tmp/libopenssl1.1_1.1.1v-13_x86_64.ipk

ls -lh /usr/lib/libcrypto.so.1.1
ls -lh /usr/lib/libssl.so.1.1
