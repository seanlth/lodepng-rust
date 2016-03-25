CFLAGS ?= -O3 -fPIC
OUT_DIR := $(shell echo $(OUT_DIR) | sed 's/ /_/g' )
LIB = $(OUT_DIR)/liblodepng.a
OBJ = $(OUT_DIR)/liblodepng.o
SRC = $(OUT_DIR)/lodepng.c
HEADER = $(OUT_DIR)/lodepng.h


$(LIB): $(OBJ)
	$(AR) $(ARFLAGS) $(shell echo $@ | sed 's/_/\\\ /g' )  $(shell echo $^ | sed 's/_/\\\ /g' )

$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c -o $(shell echo $@ | sed 's/_/\\\ /g' ) $(shell echo $^ | sed 's/_/\\\ /g' )

$(SRC): $(HEADER)

$(SRC):
	curl -L https://raw.githubusercontent.com/lvandeve/lodepng/master/lodepng.cpp -o $(shell echo $@ | sed 's/_/\\\ /g' )

$(HEADER):
	curl -L https://raw.githubusercontent.com/lvandeve/lodepng/master/lodepng.h -o $(shell echo $@ | sed 's/_/\\\ /g' )

doc: src/lib.rs
	rustdoc --html-before-content doc/_header.html -L target/debug/deps/ $(shell echo $^ | sed 's/_/\\\ /g' )

.PHONY: doc
