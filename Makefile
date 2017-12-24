# Make file for the Termayerter project build. Here we have only two targets for
# now: udp-server, that builds the server executable and clean that clears or environ-
# ment for a new build. Currently we are compiling some object files (.o) from
# header files (.h), which are then linked to create the final binary.

udp-server: src/udp-server.c
	@if test ! -d bin; then mkdir bin; fi
	@echo "Now objects will be linked."
	$(CC) -c $^ -o bin/$@

temp-esp: src/temp-esp.c
	@if test ! -d firmware; then mkdir firmware; fi
	@echo "Now objects will be linked."
	xtensa-lx106-elf-gcc -c $^ -o bin/$@
	esptool elf2image bin/temp-esp -o firmware/$@.bin

clean:
	@echo "Cleaning up..."
	$(RM) obj/*.o

distclean:
	@echo "Cleaning up..."
	$(RM) obj/*.o
	@if test -d bin; then $(RM) -rf bin; fi
	@if test -d firmware; then $(RM) -rf firmware; fi
