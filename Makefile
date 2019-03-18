EXTLIBS := -L/usr/lib64 -Lport_i/lib -lm -lc -lgfortran -lport_i
FOPTS   := -fno-second-underscore
CCPL    := g++ -O 
FCPL    := gfortran -O

TARGETS := recons

.PHONY: all install clean

all: $(TARGETS) install

install: $(TARGETS)
	@cp $(TARGETS) /pbs/throng/trend/soft/bin/.

clean:
	rm -rf objs/*.o objs/*.a $(TARGETS)

recons: objs/recons.o objs/libfittools.a
	$(CCPL) -o recons objs/recons.o objs/libfittools.a $(EXTLIBS)

example: objs/example.o objs/libfittools.a
	$(CCPL) -o example objs/example.o objs/libfittools.a $(EXTLIBS) 

objs/recons.o: src/recons.cxx
	$(CCPL) -o objs/recons.o -c src/recons.cxx

objs/example.o: src/example.cxx
	$(CCPL) -o objs/example.o -c src/example.cxx

objs/FitTools.o: src/FitTools.h src/FitTools.cxx
	$(CCPL) -o objs/FitTools.o -c src/FitTools.cxx

objs/AS153.o: src/AS153.f
	$(FCPL) -o objs/AS153.o -c src/AS153.f

objs/libfittools.a: objs/FitTools.o objs/AS153.o
	ar rv objs/libfittools.a objs/FitTools.o objs/AS153.o
	ranlib objs/libfittools.a 
