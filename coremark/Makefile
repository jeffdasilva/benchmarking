


.PHONY: all
all: coremark_v1.0/Makefile
	$(MAKE) -C $(<D) SHELL=/bin/bash
	file $(<D)/coremark.exe
	size $(<D)/coremark.exe
	@cat $(<D)/run1.log $(<D)/run2.log

coremark_v1.0/Makefile: coremark_v1.0.tgz
	tar xzf $<
	@touch $@

# unzip password is "password"
coremark_v1.0.tgz: benchmark.zip
	@rm -rf $@
	unzip $<
	@touch $@

.PHONY: clean
clean:
	rm -rf coremark_v1.0.tgz coremark_v1.0
