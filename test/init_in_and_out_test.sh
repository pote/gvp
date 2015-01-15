. assert.sh

GVP=../bin/gvp

## gvp init should create a .godeps/ directory.
assert_raises "$GVP init"
assert_raises "[ -d .godeps ]"
## Cleanup
rm -rf .godeps

## source gvp in should change the original GOPATH and associated Env variables
## as well as creating a .godeps directory 
ORIGINAL_GOPATH=$GOPATH
ORIGINAL_GOBIN=$GOBIN
ORIGINAL_PATH=$PATH

source $GVP in

assert_raises "[ -d .godeps ]"
assert "echo $GOPATH" "$PWD/.godeps:$PWD:$ORIGINAL_GOPATH"
assert "echo $GOBIN"  "$PWD/.godeps/bin"
assert "echo $PATH"   "$PWD/.godeps/bin:$ORIGINAL_PATH"


## Cleanup
rm -rf .godeps

assert_end examples
