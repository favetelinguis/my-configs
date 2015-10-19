# Specify compiler to use
CC = gcc

# Compiler flags
# -g adds debugging info
# -W
# -Wall turn on most but not all compiler warnings
CFLAGS = -g -W -Wall

# The build target
TARGET = cstring

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	$(RM) $(TARGET)
