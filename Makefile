-include ./config.make

all:
	-@echo Nothing to do...

install:
	install -d $(DESTDIR)$(prefix)/bin
	install -m 0755 ./bin/gvp $(DESTDIR)$(prefix)/bin/$(exec)

test:
	cd test && ./run_all_tests.sh

.PHONY: all install test
