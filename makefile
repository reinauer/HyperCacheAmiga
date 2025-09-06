#LFLAGS=sc sd nd verbose define __main=__tinymain

CC      := m68k-amigaos-gcc
STRIP   := m68k-amigaos-strip
CFLAGS  := -Os -Wall
LDFLAGS := -mcrt=clib2 -lgcc -lc -lamiga
VASM    := vasmm68k_mot

MAIN=cache
OBJECTS=cache.o infoserver.o arg.o backio.o

DMAIN=dcache
DOBJECTS=dcache.o infoserver.o arg.o backio.o

OMAIN=ocache
OOBJECTS=ocache.o infoserver.o arg.o backio.o

OMAIN2=ocache2
OOBJECTS2=ocache2.o infoserver.o arg.o backio.o

all: $(MAIN) $(DMAIN) $(OMAIN) $(OMAIN2)

$(MAIN): $(OBJECTS)
	$(CC) -o $(MAIN) $(OBJECTS) $(LDFLAGS) $(CFLAGS)
	$(STRIP) -s $(MAIN)

$(DMAIN): $(DOBJECTS)
	$(CC) -o $(DMAIN) $(DOBJECTS) $(LDFLAGS) $(CFLAGS)
	$(STRIP) -s $(DMAIN)

$(OMAIN): $(OOBJECTS)
	$(CC) -o $(OMAIN) $(OOBJECTS) $(LDFLAGS) $(CFLAGS)
	$(STRIP) -s $(OMAIN)

$(OMAIN2): $(OOBJECTS2)
	$(CC) -o $(OMAIN2) $(OOBJECTS2) $(LDFLAGS) $(CFLAGS)
	$(STRIP) -s $(OMAIN2)

.c.o:	
	$(CC) $(CFLAGS) -c -o $@ $<

.asm.o:
	$(VASM) -quiet -m68020 -Fhunk -o $@ $<

clean:
	rm -f $(OBJECTS) $(MAIN)
