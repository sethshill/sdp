function Freq = note2freq(note)
%{
    Author: Matthew T. Dunlap
    Algorithm: note2freq
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

    Description: Takes a string 'note' and converts it to the actual
        frequency of the note using A440 as a reference.
    Notes: This algorithm is very useful.
    See Also: N/A
%}
    a = 2^(1/12);
    f0 = 440;
    note(1) = upper(note(1));
    sign = lower(note(2));
    octave = ceil(abs(str2double(note(3))));
    diff = 0;
    switch note(1)
        case 'A'
            diff = 0;
        case 'B'
            diff = 2;
        case 'C'
            diff = -9;
        case 'D'
            diff = -7;
        case 'E'
            diff = -5;
        case 'F'
            diff = -4;
        case 'G'
            diff = -2;
    end
    switch sign
        case 'f'
            diff = diff - 1;
        case 's'
            diff = diff + 1;
    end
    n = (12 * (octave - 4)) + diff;
    Freq = f0 * a^n;
end