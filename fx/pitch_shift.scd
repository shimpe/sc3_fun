s.boot;
(
// pitch shift
play({
    PitchShift.ar(
		        AudioIn.ar([1,2]),    // stereo audio input
		        0.1,             // grain size
		        MouseX.kr(0,2),    // mouse x controls pitch shift ratio
		        0,                 // pitch dispersion
		        0.004            // time dispersion
	    )
})
)

(
// pitch shift input - USE HEADPHONES to prevent feedback.
// pitch-shift with DALEK voice
play({
	DiodeRingMod.ar(SinOsc.ar(30),
    PitchShift.ar(
		        AudioIn.ar([1,2]),    // stereo audio input
		        0.1,             // grain size
		        MouseX.kr(0,2),    // mouse x controls pitch shift ratio
		        0,                 // pitch dispersion
		        0.004            // time dispersion
	    ))
})
)


(
play ({
	var input, correction, corrected_freq, freq, hasFreq, corrected;

	// can be anything (e.g. SoundIn)
	input = SoundIn.ar(2);

	// grab the frequency of the input signal
	#freq, hasFreq = Tartini.kr(input);

	// map our input signal's frequency to our scale using DegreeToKey
	corrected_freq = round(freq.cpsmidi, 1).midicps;
    correction = freq - corrected_freq;
	correction.postln;

	// use PitchShift to autotune the original signal (adjust windowSize to make it snap quicker, put a Lag on pitchRatio to make it glide, etc.)
	PitchShift.ar(input, 0.1, corrected_freq/freq, 0, 0.004);
})
)
