PKG_NAME := ssroute-data
VERSION  := $(shell git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo "0.0.1")
DEB_FILE := $(PKG_NAME)_$(VERSION)_all.deb
DEST     := /etc/ssroute

.PHONY: all deb clean

all: deb

deb:
	$(eval TMPDIR := $(shell mktemp -d))
	mkdir -p $(TMPDIR)/DEBIAN
	mkdir -p $(TMPDIR)$(DEST)/data
	mkdir -p $(TMPDIR)$(DEST)/default_route
	cp data/*.json $(TMPDIR)$(DEST)/data/
	cp default_route/*.json $(TMPDIR)$(DEST)/default_route/
	printf 'Package: $(PKG_NAME)\nVersion: $(VERSION)\nArchitecture: all\nMaintainer: muric\nDescription: Route data files for ssroute\n IP ranges and default route JSON files used by ssroute daemon.\nSection: net\nPriority: optional\n' > $(TMPDIR)/DEBIAN/control
	dpkg-deb --build $(TMPDIR) $(DEB_FILE)
	rm -rf $(TMPDIR)
	@echo "Built $(DEB_FILE)"

clean:
	rm -f $(PKG_NAME)_*_all.deb
