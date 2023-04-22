CC = g++
CFLAGS = -c -Wall -Iinclude
SOURCES = main.cc helloworld.cc
OBJECTS = $(SOURCES:.cc=.o)
EXECUTABLE = helloworld

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cc.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf $(OBJECTS) $(EXECUTABLE)