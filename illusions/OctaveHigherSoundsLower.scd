s.boot;

(
SynthDef("sinus", {
	arg freq = 660, amp = 0.1, dur = 0.25;

	var env = Env.new([0,dur,0], [dur-(dur/10.0),(dur/10.0)], curve:'step', doneAction:2);
	Out.ar([0,1], amp*SinOsc.ar(freq)*EnvGen.kr(env));
}).add();
)

s = Synth("sinus");


(
Pbind(
	\instrument, "sinus",
	\amp, 0.02,
	\midinote, [0,13,26,39,52,65,78,91,104]).play()
)

(
Pbind(
	\instrument, "sinus",
	\amp, 0.02,
	\midinote, [12,25,38,51,64,77,90,103,116]).play()
)
