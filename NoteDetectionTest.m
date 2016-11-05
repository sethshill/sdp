%%Test to see if this can predict a set of handpicked notes.
clc
clear

Fs = 44100;
T = 1/Fs;

signaltime = 1;
tvector = 0:T:signaltime - T;
nsamples = signaltime * Fs;

y(1) = note2freq('Cn4');
y(2) = note2freq('En4');
y(3) = note2freq('Gn4');
y(4) = note2freq('Cn5');

amps(1) = .25;
amps(2) = .5;
amps(3) = .75;
amps(4) = 1;

f = sumofsines(y, amps);

[mag, phase, w] = fftfix(f(tvector), Fs);

[peak, mags, npeak] = peakfinding(mag, Fs, nsamples, .1);

note = freq2freq(peak);

w2 = 0:1/signaltime:note(1) + note(end);

l = length(w2);

g = sumofsines(note, mags);

h =@(t) normalize(f(t), 1) - normalize(g(t), 1);

figure(1)
plot(tvector, normalize(f(tvector), 1))

figure(2)
plot(w2, mag(1:l))

figure(3)
plot(tvector, normalize(g(tvector), 1))

figure(4)
plot(tvector, h(tvector))

%sound(normalize(f(tvector), .25), Fs)