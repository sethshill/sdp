function out = normalize(in, max)
%{
    Author: Matthew T. Dunlap 11/3/16
    Algorithm: normalize
    Date Written: 11/3/16
    Last Revised: 11/3/16
    Version: 1.0.0

    Dependencies: N/A

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Required Inputs: 2
        in:
        max:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Optional Inputs: 0
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Outputs: 1
        out:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Description: Normalizes a signal so that the absolute peak is of value
        max.
    Notes: Very useful for changing the volume of audio files.
        Additionally, allows you to adjust the range for a vector.
    See Also: N/A
%}
    peak = abs(in(1));
    n = length(in);
    for i = 1:n
        if(abs(in(i)) > peak)
            peak = abs(in(i));
        end
    end
    out = max * in ./ peak;
end