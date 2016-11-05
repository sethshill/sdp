function [tvector, ivector] = itimevector(tstart, tlength, Fs)
%{
    Author: Matthew T. Dunlap
    Algorithm: itimevector
    Date Written: 11/3/16
    Last Revised: 11/3/16
    Version: 1.0.0

    Dependencies: N/A

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Required Inputs:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Optional Inputs:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Outputs:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Description: Creates a parallel vector of time values and index values.
    Notes: This algorithm is very useful when plotting in the time-domain.
    See Also: N/A
%}
    Ts = 1 / Fs;
    tvector = tstart:Ts:(tstart + tlength - Ts);
    
    istart = ceil(tstart * Fs);
    iend = istart + ceil(tlength * Fs) - 1;
    
    ivector = istart:iend;
end