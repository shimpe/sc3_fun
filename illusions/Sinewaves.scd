s.boot;

// 440 Hz
{ 0.5*SinOsc.ar(440).dup; }.play();

// 880 Hz
{ 0.5*SinOsc.ar(880).dup; }.play();

// 523.25 Hz
{ 0.5*SinOsc.ar(523.25).dup; }.play();

// 444 Hz
{ 0.5*SinOsc.ar(444).dup; }.play();

// 440 + 523.25
{ 0.125*SinOsc.ar(440).dup; }.play();
{ 0.125*SinOsc.ar(523.25).dup; }.play();
{ 0.125*(SinOsc.ar(440) + SinOsc.ar(523.25)).dup }.play();

// 440 + 444
{ 0.125*SinOsc.ar(440).dup; }.play();
{ 0.125*SinOsc.ar(444).dup; }.play();
{ 0.125*(SinOsc.ar(440) + SinOsc.ar(444)).dup }.play();

// // 440 + 444 + 446
{ 0.125*(SinOsc.ar(440) + SinOsc.ar(444)+ SinOsc.ar(446)).dup }.play();

// 440 + 480Hz
{ 0.125*SinOsc.ar(440).dup; }.play();
{ 0.125*SinOsc.ar(480).dup; }.play();
{ 0.125*(SinOsc.ar(440) + SinOsc.ar(480)).dup }.play();

