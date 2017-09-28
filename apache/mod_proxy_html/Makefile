prefix = /usr/local
bindir = $(prefix)/bin
sbindir = $(prefix)/sbin
apxs = $(sbindir)/apxs2
comma = ,

CFLAGS = -g -ggdb -O2 -Wall
APXSFLAGS = $(addprefix -Wc$(comma),$(CFLAGS))
CLEANFILES = $(wildcard *.la *.lo *.o *.slo)
INCLUDES = -I$(prefix)/include/libxml2
DEFS = -DPATH_MAX=4096

all: mod_proxy_html.la
install: all
	$(apxs) -i mod_proxy_html.la

mod_proxy_html.la: mod_proxy_html.c
	$(apxs) $(APXSFLAGS) $(DEFS) $(INCLUDES) -c $(@:%.la=%.so) $^ -lxml2

clean:
	$(RM) $(CLEANFILES)
