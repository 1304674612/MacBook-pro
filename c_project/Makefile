CC=clang
CFLAGS=-Wall -Wextra -O2 -std=c17
TARGET=app
SRC=main.c

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: clean run
