# Variables
JAVAC = javac
JAVA = java
SRC_DIR = src
BIN_DIR = bin
LIB_DIR = lib
TEST_DIR = test
MAIN_CLASS = App
SRC_FILES = $(SRC_DIR)/$(MAIN_CLASS).java
TEST_FILES = $(TEST_DIR)/*.java
JUNIT_JAR = $(LIB_DIR)/junit-jupiter-api-5.11.0.jar:$(LIB_DIR)/junit-platform-console-standalone-1.11.0.jar:$(LIB_DIR)/junit-platform-launcher-1.11.0.jar

# Default target: build the project
all: $(BIN_DIR)/$(MAIN_CLASS).class

# Compile Java source file to the bin directory
$(BIN_DIR)/$(MAIN_CLASS).class: $(SRC_FILES)
	@mkdir -p $(BIN_DIR)
	$(JAVAC) -d $(BIN_DIR) $(SRC_FILES)

# Compile tests
test-compile:
	@mkdir -p $(BIN_DIR)
	$(JAVAC) -cp $(BIN_DIR):$(JUNIT_JAR) -d $(BIN_DIR) $(TEST_FILES)

# Run the application
run: all
	$(JAVA) -cp $(BIN_DIR) $(MAIN_CLASS)

# Run JUnit tests
test: test-compile
	$(JAVA) -cp $(BIN_DIR):$(JUNIT_JAR) org.junit.platform.console.ConsoleLauncher --class-path $(BIN_DIR) --scan-classpath $(BIN_DIR)

# Clean: remove all compiled files
clean:
	rm -rf $(BIN_DIR)/*.class
