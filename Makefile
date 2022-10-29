SCRIPTS=./scripts
INCLUDE=./include
SOURCES=./src
BINARIES=./build
LIBRARIES=./lib
TEST=./test
COMPILER=g++
COMPILER_FLAGS=-Wall -Werror -o2 -I $(INCLUDE) -L $(LIBRARIES)
ARCHIVER=ar

all: format check build_lib build_test run_test make_report cleanup

format:
	$(SCRIPTS)/format.sh

check:
	$(SCRIPTS)/check.sh

build_lib:
	$(COMPILER) $(COMPILER_FLAGS) -c $(SOURCES)/lib_server.cpp -o $(BINARIES)/lib_server.o
	$(ARCHIVER) -crv $(LIBRARIES)/libserver.a $(BINARIES)/lib_server.o

build_test:
	$(COMPILER) $(COMPILER_FLAGS) -c $(SOURCES)/lib_server.cpp -o $(BINARIES)/lib_server.o -coverage -lpthread -lgcov
	$(COMPILER) $(COMPILER_FLAGS) -c $(TEST)/main.cpp -o $(BINARIES)/main.o -lgtest -lpthread
	$(COMPILER) $(COMPILER_FLAGS) $(BINARIES)/main.o $(BINARIES)/lib_server.o -o $(TEST)/Test -lgtest -lpthread -coverage -lgcov

run_test:
	valgrind $(TEST)/Test

make_report:
	mv $(BINARIES)/*.gcda $(TEST)/
	mv $(BINARIES)/*.gcno $(TEST)/
	lcov -t $(TEST)/Test -o $(TEST)/coverage_report.info -c -d $(TEST)
	genhtml -o $(TEST)/coverage_report $(TEST)/coverage_report.info

cleanup:
	rm -r $(BINARIES)/* $(TEST)/*.gcda $(TEST)/*.gcno $(TEST)/coverage_report.info

