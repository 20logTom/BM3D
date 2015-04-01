CC      = clang
BIN     = noising bm3d
SRC     = main.c error.c png_io.c param_pars.c csv_export.c utils.c noising.c bm3d.c
LIBS    = -lm -lpng12
CFLAGS  = -c -g3 -Wall -I/usr/include/libpng12
EXT     = c
SRCDIR  = src
OBJDIR  = obj
IMGDIR  = img
OBJ     := $(subst .$(EXT),.o,$(SRC))
OBJ     := $(addprefix $(OBJDIR)/, $(OBJ))
 
all: $(BIN)

noising: $(OBJDIR)/error.o $(OBJDIR)/png_io.o $(OBJDIR)/utils.o $(OBJDIR)/noising.o 
	@echo "Link $< ..."
	@$(CC) -o $@ $(OBJDIR)/error.o $(OBJDIR)/png_io.o $(OBJDIR)/utils.o $(OBJDIR)/noising.o
 
bm3d: $(OBJDIR)/error.o $(OBJDIR)/png_io.o $(OBJDIR)/param_pars.o $(OBJDIR)/utils.o $(OBJDIR)/bm3d.o $(OBJDIR)/main.o 
	@echo "Link $< ..."
	@$(CC) -o $@ $(OBJDIR)/error.o $(OBJDIR)/png_io.o $(OBJDIR)/param_pars.o $(OBJDIR)/utils.o $(OBJDIR)/bm3d.o $(OBJDIR)/main.o $(LIBS)
 
$(OBJDIR)/error.o: $(SRCDIR)/error/error.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
       
$(OBJDIR)/png_io.o: $(SRCDIR)/png_io/png_io.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
       
$(OBJDIR)/param_pars.o: $(SRCDIR)/param_pars/param_pars.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
       
$(OBJDIR)/csv_export.o: $(SRCDIR)/csv_export/csv_export.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
       
$(OBJDIR)/utils.o: $(SRCDIR)/utils/utils.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
       
$(OBJDIR)/noising.o: $(SRCDIR)/noising/noising.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
       
$(OBJDIR)/bm3d.o: $(SRCDIR)/bm3d/bm3d.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
       
$(OBJDIR)/main.o: $(SRCDIR)/main.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
 
clean:
	rm noising bm3d $(OBJ) $(IMGDIR)/rgb/*.png $(IMGDIR)/yuv/*.png 
