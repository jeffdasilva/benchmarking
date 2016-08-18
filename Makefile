
SHELL := /bin/bash

BENCHMARKS = \
	coremark \
	lmbench \
	stream

RUN_TARGETS = $(patsubst %,run-%,$(BENCHMARKS))
CLEAN_TARGETS = $(patsubst %,clean-%,$(BENCHMARKS))

.PHONY: all
all: runall

.PHONY: runall
runall: print-start $(RUN_TARGETS) print-end

.PHONY: $(RUN_TARGETS)
$(RUN_TARGETS): run-%: %/Makefile print-end
	$(MAKE) -C $(<D)

.PHONY: print-start print-end
print-start print-end: print-%:
	@echo ""
	@echo "-------------------------------------------------------"
	@echo " $(shell hostname) $*: $(shell date)"
	@echo "-------------------------------------------------------"
	@echo ""

print-end: $(RUN_TARGETS)

.PHONY: clean
clean: $(CLEAN_TARGETS)

.PHONY: $(CLEAN_TARGETS)
$(CLEAN_TARGETS): clean-%: %/Makefile
	$(MAKE) --no-print-directory -C $(<D) clean


