Microservice :=  wispeeer
ServiceBinary := $(foreach n, $(Microservice),${n})

all: build

.PHONY: build
build:    ## Build with native env.
	@for p in $(ServiceBinary);  \
	do                           \
		./scripts/build.sh $$p;  \
	done                         \

.PHONY: clean
clean:    ## Clean build cache.
	@rm -rvf bin
	@echo "clean [ ok ]"

.PHONY: help
help:     ## Show this help.
	@echo "Makefile Help Menu >>>\n"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
