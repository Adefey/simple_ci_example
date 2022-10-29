#!/usr/bin/env bash

CODE_FILES="./src/*.cpp ./include/*.hpp ./test/*.cpp"

set -e pipefail

cppcheck --enable=all --suppress=missingIncludeSystem --suppress=unusedFunction $CODE_FILES
clang-tidy $CODE_FILES -extra-arg=-std=c++2a -- -I./include
cpplint --extensions=cpp,hpp --filter=-whitespace/indent,-whitespace/comments $CODE_FILES
