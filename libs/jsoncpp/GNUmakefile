CC = gcc
CXX = g++
CPPFLAGS = -Iinclude
CXXFLAGS = -g -ggdb -O2 -Wall

INSTALL = install
INSTALL_DATA = $(INSTALL) -m 644
#INSTALL_EXEC = $(INSTALL) -m 755

prefix = /usr
includedir = $(prefix)/include
libdir = $(prefix)/lib

all: libjsoncpp.a
install:
	$(INSTALL) -d $(DESTDIR)$(libdir)
	$(INSTALL_DATA) libjsoncpp.a $(DESTDIR)$(libdir)
	$(INSTALL) -d $(DESTDIR)$(includedir)/json
	$(INSTALL_DATA) $(wildcard include/json/*.h) $(DESTDIR)$(includedir)/json

libjsoncpp.a: \
	src/lib_json/json_reader.o \
	src/lib_json/json_value.o \
	src/lib_json/json_writer.o 
	$(AR) src $@ $^

%.o: %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $^

