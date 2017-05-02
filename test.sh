#!/bin/bash

. ./script/env

retval=0

for testsuite in base mysql sql
do
  pushd go/${testsuite} > /dev/null;
  $GOCMD test $*;
  [ $? -ne 0 ] && retval=1
  popd > /dev/null;
done

exit $retval
