# Variables
CC= gcc
CFLAGS=-Wall -O2
SRC_DIR=src
BUILD_DIR=build
INCL_DIR=include
RAYLIB_INCL_DIR=raylib/include
RAYLIB_LIB_DIR=raylib/lib

# Find source files
SRCS=$(wildcard $(SRC_DIR)/*.c)
# Convert to object paths
OBJS=$(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Include and library path flags
INCLUDE_FLAGS=-I$(INCL_DIR) -I$(RAYLIB_INCL_DIR)
LIBRARY_PATH_FLAGS=-L$(RAYLIB_LIB_DIR)

# Libraries to link
# Use -lraylib (for libraylib.a or raylib.dll import lib) plus necessary Win32 libs
LIBS=-lraylib -lopengl32 -lgdi32 -lwinmm

# Default target
all: sim

# Link executable
sim: $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDE_FLAGS) $(LIBRARY_PATH_FLAGS) -o $@ $^ $(LIBS)

# Compile each .c to .o
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDE_FLAGS) -c $< -o $@

# Ensure build directory exists
$(BUILD_DIR):
	mkdir $(BUILD_DIR)

clean:
	@del /Q /F $(BUILD_DIR)\*.o*