(
o = ServerOptions.new;
o.numWireBufs = 1000000;
s.boot;
)

(
{
	var amp = 0.002;
	var df = 0.075;
	var n = 10;
	var harm = 10;
	var f = Array.new((n+1)*harm);

	(0..n).do({ |item|
		//item.postln;
		(1..harm).do({ |jtem |
			//jtem.postln;
			f.add( (55+(item*df))*jtem );
		});
	});

	amp*SinOsc.ar(f).dup;

}.play()
)

// unexpected pipe organ
//{ var amp = 0.003; amp*SinOsc.ar([55,55*2,55*4,55*8,55*16,55*32,55*64,55*128,55*256,55*512]).dup }.play();