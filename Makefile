CFLAGS = -O2 -g -save-temps
#-fvisibility=hidden
O=obj

all: lib.so

$O:
	mkdir -p $O

$O/lib.o: lib.c | $O
	$(CC) $(CFLAGS) -c -o $@ -fPIC $<

$O/objects.o: $O/lib.o
	$(LD) -r -o $@ $^

#lib.so: $O/lib.o lib.map
lib.so: $O/objects.o lib.map
	$(CC)  -o $@ -shared -Wl,--version-script=lib.map $<

clean:
	-rm -rf lib.so $O

s-%:
	@echo Symbols
	readelf --symbols $*
	@echo Dynsyms
	readelf --dyn-syms $*

