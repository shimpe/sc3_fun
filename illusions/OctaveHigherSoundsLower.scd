s.boot;

(
SynthDef("sinus", {

	arg freq = 660, amp = 0.1, dur = 0.25;
	var envgen = EnvGen.ar(Env.perc, doneAction:2);
	Out.ar([0,1], amp*SinOsc.ar(freq)*envgen);
}).add();
)

s = Synth("sinus");

(
var octave = 12;
Pbind(
	\instrument, "sinus",
	\amp, 0.02,
	\midinote, Pseq([
		[0,13,26,39,52,65,78,91,104] + (0*octave),
		[0,13,26,39,52,65,78,91,104] + (1*octave),
		[0,13,26,39,52,65,78,91,104] + (2*octave),
		[0,13,26,39,52,65,78,91,104] + (3*octave),
		[0,13,26,39,52,65,78,91,104] + (4*octave),
	]
               )).play()
)

