

.PHONY: run
run: lmbench.tar.gz
	rm -rf lmbench-*
	tar xzf $<
	$(MAKE) -C lmbench-* build
	echo -e "1\n1\n\nall\nno\n\n\n\n\n\n\nno\n" | $(MAKE) -C lmbench-*/src results

lmbench.tar.gz:
	rm -rf $@
	wget http://sourceforge.net/projects/lmbench/files/latest/download -O $@