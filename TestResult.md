# cr660x
- /mnt/img2/tmp/x-wrt-cr660x-ok-60048f155baf8141c0913967cb3ce125-202311251943passwallusing
  - 当前 CR6609 运行中，是包含 passwall 的
- /mnt/img2/tmp/x-wrt-cr660x-ok-60048f155baf8141c0913967cb3ce125-202311251943passwallusingbak
  - ok .config.ramips-mt7621_feeds_202311251904_多播改M，多加了less和more和一些协议M
- 5.10 内核失败，【 ERROR: package/feeds/x/natflow failed to build. 】

# x86
- /mnt/img2/tmp/x-wrt-x86-ok202311252304
  - 当前要试的版本
  - 试加了feeds但软件包不变
- /mnt/img2/tmp/x-wrt-x86-ok202311252304passwall
  - 编译一次后，默认 go1.19 改为 go1.20，然后加passwall编译才成功
- /mnt/img2/tmp/x-wrt-x86-ok-f9ecc5be113339650afc94ed11a2c868-202311251343bak
  - make clean，然后用 go1.20 似乎不太行，正式测试中
- 默认 go1.19 无法编译 alist go1.20就可以
- 