function [peaks, mags, count] = peakfinding(in, Fs, nSamples, tol)
%{
    Author: Matthew T. Dunlap
    Algorithm: peakfinding
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
    
    Description: Finds all peaks above tol of the magnitude of a frequency
        response for positive frequencies.
    Notes: This algorithm is utter s**t. It needs massively overhauled both
        in clarity and in execution.
    See Also: N/A
%}
    peakis = zeros(100, 1);
    n = length(in);
    count = 0;
    next = in(2);
    curr = in(1);
    if(tol < curr)
        if(next < curr)
            count = count + 1;
            peakis(count) = 1;
        end
    end
    for i = 2:(n - 1)
        prev = in(i - 1);
        next = in(i + 1);
        curr = in(i);
        if(tol < curr)
            if((prev < curr) && (next < curr))
                count = count + 1;
                peakis(count) = i;
            end
        end
    end
    prev = in(n - 1);
    curr = in(n);
    if(tol < curr)
        if(prev < curr)
            count = count + 1;
            peakis(count) = n;
        end
    end
    peaks = zeros(count, 1);
    mags = zeros(count, 1);
    for i = 1:count
        peaks(i) = ((peakis(i) - 1) .* (Fs / nSamples));
        mags(i) = in(peakis(i));
    end
end