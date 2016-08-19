

.PHONY: run
run: lmbench.tar.gz
	rm -rf lmbench-*
	tar xzf $<
	$(MAKE) update-config.guess
	$(MAKE) -C lmbench-* build
	printf "1\n1\n\nall\nno\n\n\n\n\n\n\nno\n" | $(MAKE) -C lmbench-* results
	$(MAKE) -C lmbench-* rerun
	$(MAKE) -C lmbench-* rerun
	$(MAKE) -C lmbench-* rerun
	$(MAKE) -C lmbench-*/results


lmbench.tar.gz:
	rm -rf $@
	wget http://sourceforge.net/projects/lmbench/files/latest/download -O $@

.PHONY: clean
clean:
ifneq ($(wildcard lmbench-*),)
	$(MAKE) -C lmbench-* clean
endif

.PHONY: update-config.guess
update-config.guess:
	rm -rf config
	git clone git://git.sv.gnu.org/config.git
	cp config/config.guess lmbench-*/scripts/gnu-os

