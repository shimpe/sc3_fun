s.boot;

(
{
	var amp = 0.2;
	var n = 2;
	var sep = 3;
	var f = Array.new(n);

	(1..n).do({ |item|
		//item.postln;
		f.add((440 + (item*sep)));
	});

	amp*SinOsc.ar(f).dup;

}.play()
)


(
{
	var amp = 0.05;
	var n = 20;
	var sep = 0.2;
	var f = Array.new(n);

	(1..n).do({ |item|
		//item.postln;
		f.add((440 + sep*sin(item)));
	});

	amp*SinOsc.ar(f).dup;

}.play()
)