
STREAM_SITE := https://www.cs.virginia.edu/stream/FTP/Code

BENCHMARK_SRC_DIR := src
BENCHMARK_SRC := $(patsubst %,$(BENCHMARK_SRC_DIR)/%,\
	LICENSE.txt \
	Makefile \
	READ.ME \
	mysecond.c \
	stream.c \
	stream.f \
	Versions/READ.ME \
	Versions/second_cpu.c \
	Versions/second_cpu.f \
	Versions/stream_d.c \
	Versions/stream_d.f \
	Versions/stream_mpi.c \
	Versions/stream_mpi.f \
	Versions/stream_omp.c \
	Versions/stream_tuned.f \
)


ifneq ($(shell which gfortran 2>/dev/null),)
FF ?= gfortran
endif
ifneq ($(shell which fort77 2>/dev/null),)
FF ?= fort77
endif
ifneq ($(shell which g77 2>/dev/null),)
FF ?= g77
endif

.PHONY: all
all: src
	$(MAKE) -C $(BENCHMARK_SRC_DIR) $(if $(FF),FF=$(FF),stream_c.exe)
	file $(BENCHMARK_SRC_DIR)/stream_c.exe
	size $(BENCHMARK_SRC_DIR)/stream_c.exe
	$(BENCHMARK_SRC_DIR)/stream_c.exe

.PHONY: src
src: $(BENCHMARK_SRC)

$(BENCHMARK_SRC): $(BENCHMARK_SRC_DIR)/%:
	@mkdir -p $(@D)
	cd $(@D) && wget $(STREAM_SITE)/$*

.PHONY: clean
clean:
ifneq ($(wildcard $(BENCHMARK_SRC_DIR)),)
	$(MAKE) -C $(BENCHMARK_SRC_DIR) clean
endif
