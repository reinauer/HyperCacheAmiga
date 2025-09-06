#LFLAGS=sc sd nd verbose define __main=__tinymain

CC      := m68k-amigaos-gcc
STRIP   := m68k-amigaos-strip
CFLAGS  := -Os -Wall
LDFLAGS := -mcrt=clib2 -lgcc -lc -lamiga
VASM    := vasmm68k_mot

MAIN=cache
OBJECTS=cache.o infoserver.o arg.o backio.o

$(MAIN): $(OBJECTS)
	$(CC) -o $(MAIN) $(OBJECTS) $(LDFLAGS) $(CFLAGS)
	$(STRIP) -s $(MAIN)

.c.o:	
	$(CC) $(CFLAGS) -c -o $@ $<

.asm.o:
	$(VASM) -quiet -m68020 -Fhunk -o $@ $<

clean:
	rm -f $(OBJECTS) $(MAIN)
