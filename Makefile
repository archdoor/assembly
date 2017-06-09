F :=

all: clean run

run: $(F)
	@as --32 -gstabs $^ -o obj.o
	@ld --dynamic-linker /lib/ld-linux.so.2 -L/usr/lib32 -lc -m elf_i386 obj.o
	@rm -rf obj.o

clean:
	@-rm -rf *.out *.o
