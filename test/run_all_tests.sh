#!/usr/bin/env bash

# keep track of if all the tests passed or if one failed
status=0

# prefix all calls to echo with this string
pre=">>"

if [[ ! $(basename "$PWD") =~ test ]]; then
  echo "Please run these tests from inside the ./test directory"
  exit 1
fi

echo "$pre Now running all tests"
for test in *test.sh
do
  echo "$pre Current test: $test"
  "./$test"
  if [ ! $? -eq 0 ]; then
    status=$?
    echo "$pre Test failed: $test"
  fi
done
echo "$pre All Done"

if [ $status == 0 ]
then
  echo "$pre Build status: passing"
else
  echo "$pre Build status: failing"
  echo "Tests exited with code: $status"
fi

exit $status
