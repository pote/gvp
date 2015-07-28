#!/usr/bin/env bash
. assert.sh

gvp=../bin/gvp

## gvp init should create a .godeps/ directory.
assert_raises "$GVP init"
assert_raises "[ -d .godeps ]"
## Cleanup
rm -rf .godeps

## source gvp in should change the original GOPATH and associated Env variables
## as well as creating a .godeps directory
original_GOPATH=$GOPATH
original_GOBIN=$GOBIN
original_PATH=$PATH

. "$gvp"

assert_raises "[ -d .godeps ]"
assert "echo $GOPATH" "$PWD/.godeps:$PWD:$original_GOPATH"
assert "echo $GOBIN"  "$PWD/.godeps/bin"
assert "echo $PATH"   "$PWD/.godeps/bin:$original_PATH"

## Cleanup
rm -rf .godeps

assert_end examples
