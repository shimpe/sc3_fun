s.boot;

(
SynthDef("sinus", {
	arg freq = 660, amp = 0.1, dur = 0.25;

	var env = Env.new([0,dur,0], [dur-(dur/10.0),(dur/10.0)], curve:'step', doneAction:2);
	Out.ar([0,1], amp*SinOsc.ar(freq)*EnvGen.kr(env));
}).add();
)

s = Synth("sinus", [freq:1300, dur:0.1, amp:0.1]);

(
SynthDef("noise", {
	arg amp = 0.3, dur = 0.25;

	var env = Env.new([0,dur,0], [dur,0], curve:'step', doneAction:2);
	Out.ar([0,1], amp*WhiteNoise.ar()*EnvGen.kr(env));
}).add();
)

n = Synth("noise", [dur:0.1, amp:0.1]);

// pulsed beep
(
var dur1 = 0.1;
var dur2 = 0.1;
var steps = 20;

var amp1 = Pseq([0.1], steps);
var amp2 = Pseq([0.0], steps);

p = Pbind(
    // the name of the SynthDef to use for each note
	\instrument, Pseq([\sinus, \noise], inf),
	// FREQUENCY
	\freq, Pseq([1300],inf),
	// DURATION
	\dur, Pseq([dur1, dur2], inf),
	// AMPLITUDE
	\amp, Ppatlace([amp1,amp2], inf).trace,
).play;
)


// pulsed noise
(
var dur1 = 0.1;
var dur2 = 0.1;
var steps = 20;

var amp1 = Pseq([0.0], steps);
var amp2 = Pseq([0.1], steps);

p = Pbind(
    // the name of the SynthDef to use for each note
	\instrument, Pseq([\sinus, \noise], inf),
	// FREQUENCY
	\freq, Pseq([1300],inf),
	// DURATION
	\dur, Pseq([dur1, dur2], inf),
	// AMPLITUDE
	\amp, Ppatlace([amp1,amp2], inf).trace,
).play;
)


// illusion
(
var dur1 = 0.1;
var dur2 = 0.1;
var steps = 50;

var amp1 = Pseq([0.05], steps);
var amp2 = Pchain(Pseries(0.1, 1.0/steps, steps));

p = Pbind(
    // the name of the SynthDef to use for each note
	\instrument, Pseq([\sinus, \noise], inf),
	// FREQUENCY
	\freq, Pseq([1300],inf),
	// DURATION
	\dur, Pseq([dur1, dur2], inf),
	// AMPLITUDE
	\amp, Ppatlace([amp1,amp2], inf).trace,
).play;
)
