function [normMag, phase, w] = fftfix(in, Fs)
%{
    Author: Matthew T. Dunlap
    Algorithm: fftfix
    Date Written: 11/3/16
    Last Revised: 11/3/16
    Version: 1.0.0

    Dependencies: N/A

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Required Inputs: 2
        in (vector): input signal vector in the time-domain.
        Fs (single): sampling frequency of the input signal.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Optional Inputs: 0
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Outputs: 3
        normMag (vector): normalized magnitude response of the input signal.
        phase (vector): phase response of the input signal, mainly unused.
        w (vector): frequency vector, mainly used for plotting.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Description: Takes the fft of a signal, in, with sampling frequency Fs.
        Produces normalized magnitude response, phase response, and a
        vector of frequency values.
    Notes: This algorithm needs overhauled. Additionally, the re-arrangment
        of the fft may be disadvantageous.
    See Also: N/A
%}
    dft = fft(in);
    n = length(dft);
    nhalf = ceil((n / 2)) - 1;
    normMagDft = normalize(abs(dft), 1);
    phaseDft = unwrap(angle(dft));
    normMag = zeros(nhalf, 1);
    phase = zeros(nhalf, 1);
    for i = 1:nhalf
        normMag(i) = normMagDft(i);
        phase(i) = phaseDft(i);
    end
    
    if(mod(n, 2) == 1)
        w = (0:(nhalf))*(Fs/n);
    else
        w = (0:(nhalf - 1))*(Fs/n);
    end
end