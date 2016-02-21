s.boot;

(
{
	var amp = 0.02;
	var n = 2;
	var sep = 3;
	var f = Array.new(n);

	(1..n).do({ |item|
		//item.postln;
		f.add((300 + (item*sep)));
	});

	amp*SinOsc.ar(f).dup;

}.play()
)