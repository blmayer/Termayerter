# Make file for the Termayerter project build. Here we have only two targets for
# now: udp-server, that builds the server executable and clean that clears or environ-
# ment for a new build. Currently we are compiling some object files (.o) from
# header files (.h), which are then linked to create the final binary.

SRC:=$(shell ls src/*.c)
OBJ:=$(patsubst src/%.c, obj/%.o, $(SRC))

udp-server: $(OBJ)
	@if test ! -d bin; then mkdir bin; fi
	@echo "Now objects will be linked."
	$(CC) $^ -o bin/$@

obj/%.o: src/%.c
	@echo "Compiling $<..."
	$(CC) -c $< -o $@

clean:
	@echo "Cleaning up..."
	$(RM) obj/*.o

distclean:
	@echo "Cleaning up..."
	$(RM) obj/*.o
	@if test -d bin; then $(RM) -rf bin; fi
