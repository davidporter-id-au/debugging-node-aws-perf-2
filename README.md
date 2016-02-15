### Debugging Dynamo performance behaviour

part 2 - I have no idea what I'm doing

[Brendan Gregg](http://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html), [Netflix](http://techblog.netflix.com/2014/11/nodejs-in-flames.html) et al
have used flame graphs to significant effect in finding out what's going on with their node applications. 

In trying to get some idea of what's going on with this performance problem, I thought it'd be a good candidate to get setup. The task was run on an ec2
and lifted more or less verbatim from [Trevor Norris' Gist](https://gist.github.com/trevnorris/9616784)
