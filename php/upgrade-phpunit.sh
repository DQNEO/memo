#!/bin/bash
#
# replace PHPUnit_Framework_TestCase with namespaced version

find tests -type f -iname '*Test.php' | xargs -n 1 gsed -i '7a\use PHPUnit\\Framework\\TestCase;'
find tests -type f -iname '*Test.php' | xargs -n 1 gsed -i -e 's/\\PHPUnit_Framework_TestCase/TestCase/g'
