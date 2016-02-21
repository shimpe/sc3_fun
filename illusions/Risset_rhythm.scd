// Written by Dan Stowell, September 2006
s.boot;

b = Buffer.read(s,"22274__nikolat__78bpm-madcrew.wav"); // Provide a simple breakbeat loop
(
var ampTable = Signal.hanningWindow(1024,100).squared;
var ampBuf = Buffer.loadCollection(s, ampTable);


SynthDef("accelerando_inf1", { arg out=0,bufnum=0;

	var pos, posses, pitches, amps, sons;

	// "pos" is a kind of master pitch control, linear varying between one and zero
	pos = Phasor.ar(1, 0.007 / SampleRate.ir, 0, 1);

	posses = (pos + ((0..4)/5)).wrap(0.0, 1.0); // Evenly spaced circularly within 0 to 1

 	pitches = (0.2 * 2.0.pow(posses * 5));

	amps = BufRd.kr(1, ampBuf.bufnum, posses * BufFrames.ir(ampBuf.bufnum));

	sons = (PlayBuf.ar(1, bufnum, pitches.poll(100), loop:1) * amps * 10);

	Out.ar(out,
		Pan2.ar(sons.mean.softclip)
	)
}).play(s,[\out, 0, \bufnum, b.bufnum]);
)

