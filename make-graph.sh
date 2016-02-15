#!/bin/bash -e 

# Largely based on https://gist.github.com/trevnorris/9616784

if [[ $# -lt 1 ]]; then
	echo "usage $0 <nodeJS script to graph>"
	exit 1
fi

if [[ ! -f ~/sources/FlameGraph/stackcollapse-perf.pl ]]; then
	echo "Needs some setup and scripts. Ensure that you've read/executed https://gist.github.com/trevnorris/9616784"
	exit 1
fi

nodeScript=$1
sudo perf record -i -g -e cycles:u -- node --perf-basic-prof $nodeScript
sudo perf script \
	| egrep -v "( __libc_start| LazyCompile | v8::internal::| Builtin:| Stub:| LoadIC:|\[unknown\]| LoadPolymorphicIC:)" \
	| sed 's/ LazyCompile:[*~]\?/ /' \
	| ~/sources/FlameGraph/stackcollapse-perf.pl > out.perf-folded

~/sources/FlameGraph/flamegraph.pl out.perf-folded > node-flame.svg
