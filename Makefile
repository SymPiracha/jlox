# Variables
JAVAC = javac
SRC_DIR = src
BIN_DIR = bin
MAIN_CLASS = App
SRC_FILES = $(SRC_DIR)/$(MAIN_CLASS).java

# Default target: build the project
all: $(BIN_DIR)/$(MAIN_CLASS).class

# Compile Java source file to the bin directory
$(BIN_DIR)/$(MAIN_CLASS).class: $(SRC_FILES)
	@mkdir -p $(BIN_DIR)  # Ensure the bin directory exists
	$(JAVAC) -d $(BIN_DIR) $(SRC_FILES)

# Run the application
run: all
	java -cp $(BIN_DIR) $(MAIN_CLASS)

# Clean: remove all compiled files
clean:
	rm -rf $(BIN_DIR)/*.class
