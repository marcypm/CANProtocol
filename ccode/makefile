#compile FIR filter program
CC = clang

# compiler flags
#CFLAGS = -I /usr/include/openssl
#CRYPTFLAGS = -lssl -lcrypto

#require a target argument
CPP_FILES := $(wildcard src/*.c)
OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.c=.o)))

#must define exe file
TARGET = $(target)
BINDIR = bin


main.exe: clean $(OBJ_FILES)
	$(CC) $(CFLAGS) -g -o bin/$(TARGET) obj/$(TARGET).o $(CRYPTFLAGS)

clean:
	rm -f bin/* obj/*.o

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -g -c -o $@ $<
