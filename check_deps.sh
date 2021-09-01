#!/bin/bash

set -e

echo -n "."
brew list folly > /dev/null
echo -n "."
brew list bison > /dev/null
echo -n "."
brew list boost > /dev/null
echo -n "."
brew list cmake > /dev/null
echo -n "."
brew list flex > /dev/null
echo -n "."
brew list openssl > /dev/null
echo -n "."

brew list zlib > /dev/null
echo -n "."
brew list fmt > /dev/null
echo -n "."
brew list gflags > /dev/null
echo -n "."

brew list glog > /dev/null
echo -n "."
brew list fizz > /dev/null
echo -n "."
brew list folly > /dev/null
echo -n "."
brew list wangle > /dev/null
echo -n "."
brew list zstd > /dev/null
echo -n "."

echo -n "ALL GOOD"