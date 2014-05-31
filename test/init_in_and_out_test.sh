. assert.sh

GVP=../bin/gvp

## gvp init should create a .godeps/ directory.
assert_raises "$GVP init"
assert_raises "[ -d .godeps ]"

## source gvp in should change the original GOPATH and associated Env variables.
ORIGINAL_GOPATH=$GOPATH
ORIGINAL_GOBIN=$GOBIN
ORIGINAL_PATH=$PATH

source $GVP in

assert "echo $GOPATH" "$PWD/.godeps:$PWD"
assert "echo $GOBIN"  "$PWD/.godeps/bin"
assert "echo $PATH"   "$PWD/.godeps/bin:$ORIGINAL_PATH"


### source gvp out should return env variables back to original values.
source $GVP out

assert "echo $GOPATH" "$ORIGINAL_GOPATH"
assert "echo $GOBIN"  "$ORIGINAL_GOBIN"
assert "echo $PATH"   "$ORIGINAL_PATH"

## Cleanup
rm -rf .godeps

assert_end examples
