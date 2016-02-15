### Debugging Dynamo performance behaviour

part 2 - I have no idea what I'm doing

[Brendan Gregg](http://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html), [Netflix](http://techblog.netflix.com/2014/11/nodejs-in-flames.html) et al
have used flame graphs to significant effect in finding out what's going on with their node applications. 

In trying to get some idea of what's going on with this performance problem, I thought it'd be a good candidate to get setup. The task was run on an ec2
and lifted more or less verbatim from [Trevor Norris' Gist](https://gist.github.com/trevnorris/9616784)

#### Results: 

Preface: I ran the test with the initial require/bootstrapping going on. My *next* test will be to do this for an already running and 
loaded process to avoid `require` calls polluting the results. Consider this **very WIP**.

For baseline hello-world stuff see [the baseline](https://github.com/davidporter-id-au/debugging-node-aws-perf-2/blob/master/base-sample.svg)
The dynamo get, as used in the previous latency test, is [here](https://github.com/davidporter-id-au/debugging-node-aws-perf-2/blob/master/node-flame.svg)

So I don't really have enough context to fully interpret the data, but the big stacks are... not a good thing...?!??

![Here's an example](https://cdn.rawgit.com/davidporter-id-au/debugging-node-aws-perf-2/master/node-flame.svg)
