clc %%clears command window
clear %%clears all memory used

[y, Fs] = audioread('Closer.mp3'); %%read in audio file. 
%%[y, Fs] = audioread('songname.extension') (y is audio data,
%%Fs sampling frequency) May need to normalize audio: y = normalize(y, 1)

tlength = .3; %%length of signal to view !!DO NOT SET BELOW .25!!
tstart = .23; %%start time of the signal
nsamples = ceil(tlength * Fs); %%number of samples used

[tvector, ivector] = itimevector(tstart, tlength, Fs); %%computes parallel 
%%time and index vectors: very useful for plotting.

[mag, phase, w] = fftfix(y(1:nsamples), Fs); %%fft of signal of t length.
%%adjusts signal to be symmetric about zero, rather than periodic about Fs.

[peaks, mags, npeaks] = peakfinding(mag, Fs, nsamples, .2); %%finds peaks of mag
%%of frequency response, with a given tolerance.
%%[peakvector, numpeaks] = peakFinding(mag, Fs, samples, tolerance)

note = freq2freq(peaks); %%converts peakfrequencies to actual note frequencies
%%(I wonder if this is basically "auto-tune")

%%computes plot vectors for frequencies of interest.
M = ceil(1.05 * max(peaks));
N = length(mag);
Nhalf = floor(N/2);
W = (0:Fs/N:M - 1);
lenW = length(W);

f = sumofsines(note, mags); %%composes a sumofsines signal given a frequency
%%vector. Has optional 2nd argument that takes the amplitudes of those
%%frequencies into consideration. Still trying to figure out how to
%%implement this in this simulation.

%figures
figure(1) %original signal in
plot(tvector, y(ivector))
figure(2) %frequency response of key frequency range
plot(W, mag(Nhalf:Nhalf + lenW - 1))
figure(3) %recreation of original signal
plot(tvector, normalize(f(tvector), 1))

%sounds
%sound(normalize(f(x), .25), Fs) %%to protect your ears: do not play at above 25% volume (normalize(f(x), .25)

sound(y, Fs) %%plays audio signal
%%to stop sound: type 'clear sound' in the command window
%%
%%Test to see if this can predict a single note
clc
clear

Fs = 44100;
T = 1/Fs;

signaltime = .1;
tvector = 0:T:signaltime - T;

y = note2freq('An3');

f = sumofsines(y);

dft = fft(f(tvector));

mag = abs(dft);

mag = normalize(mag, 1);

n = length(mag);

w = (0:(n - 1))*(Fs/n);

[peak, peaki] = max(mag);

freq = (peaki - 1) * (Fs / n);

note = freq2freq(freq);

g = sumofsines(note);

h =@(t) f(t) - g(t);

figure(1)
plot(tvector, f(tvector))

figure(2)
plot(w, mag)

figure(3)
plot(tvector, g(tvector))

figure(4)
plot(tvector, h(tvector))

sound(normalize(f(tvector), .25), Fs)
%%
clc %%clears command window
clear %%clears all memory used

[y, Fs] = audioread('Closer.mp3'); %%read in audio file. 
%%[y, Fs] = audioread('songname.extension') (y is audio data,
%%Fs sampling frequency) May need to normalize audio: y = normalize(y, 1)

tlength = .3; %%length of signal to view !!DO NOT SET BELOW .25!!
tstart = .23; %%start time of the signal

[tvector, ivector] = itimevector(tstart, tlength, Fs); %%computes parallel 
%%time and index vectors: very useful for plotting.

n = length(ivector);

minvol = 1e-4;

dB = zeros(n, 1);
for i = 1:n
    dB(i) = 20 * log(abs(y(i + ivector(1))) / minvol) / log(10);
end

figure(1)
plot(tvector, dB(1:n))