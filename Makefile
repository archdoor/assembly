F :=

all: $(F)
	@as --32 $^ -o obj.o
	@ld --dynamic-linker /lib/ld-linux.so.2 -L/usr/lib32 -lc -m elf_i386 obj.o
	@rm -rf obj.o

