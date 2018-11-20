CC = gcc

# Dossiers principaux
IDIR = include
ODIR = obj
BDIR = bin
SDIR = src
CPPFLAGS += -Iinclude -I/usr/include/cairo
LDFLAGS += -lcairo -lm -lX11

# Flags compilateur
CFLAGS = -I$(IDIR) -Wall -g
# OBJECTS = $(SOURCES:src/%.c=%.o)

vpath %.h $(IDIR)
vpath %.c $(SDIR)
vpath %.o $(ODIR)

main: main.o jeu.o io.o grille.o
	@mkdir -p $(BDIR)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $(BDIR)/$@ $(ODIR)/main.o $(ODIR)/jeu.o $(ODIR)/io.o $(ODIR)/grille.o
	@echo "\n=== Compilation terminée avec succès ==="
	@echo "Lancez le programme avec ./bin/main <numéro de grille>"

%.o: %.c
	@mkdir -p $(ODIR)
	$(CC) $(CFLAGS) -o $(ODIR)/$@ -c $<

dist:
	@mkdir -p dist
	tar -J -cvf dist/FleschBoris-GoL-v0.2.tar.xz grilles include src makefile Doxyfile
	@echo "\n=== Archive créée avec succès ==="
	@echo "Chemin relatif de l'archive : dist/FleschBoris-GoL-v0.2.tar.xz"

clean:
	rm -f $(ODIR)/*.o
	rm -f $(BDIR)/*
	rm -rf dist/
	rm -rf doc/
	@echo "\n=== Artefacts de compilation éliminés avec succès ==="
