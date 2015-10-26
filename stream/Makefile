
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


.PHONY: all
all: src
	$(MAKE) -C $(BENCHMARK_SRC_DIR) FF=fort77
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