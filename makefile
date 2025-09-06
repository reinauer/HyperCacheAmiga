#LFLAGS=sc sd nd verbose define __main=__tinymain

CC   := m68k-amigaos-gcc
VASM := vasmm68k_mot
LDFLAGS :=-mcrt=clib2 -lgcc -lc -lamiga 

MAIN=cache
OBJECTS=cache.o infoserver.o arg.o backio.o 

cache: $(OBJECTS)
	$(CC) -o $(MAIN) $(OBJECTS) $(LDFLAGS)

.c.o:	
	$(CC) $(CFLAGS) -c -o $@ $<

.asm.o:
	$(VASM) -quiet -m68020 -Fhunk -o $@ $<

clean:
	rm -f $(OBJECTS) $(MAIN)
