function Note = freq2note(freq)
%{
    Author: Matthew T. Dunlap
    Algorithm: freq2note
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

    Description: Takes a frequency and converts it into a string 'note'
        using A440 as a reference.
    Notes: This algorithm is very useful.
    See Also: N/A
%}
    f0 = 440;
    a = 2^(1/12);
    n = round(log(freq / f0) / log(a));
    octave = ceil((n - 2) / 12) + 4;
    noteVal = round(mod(n, 12));
    switch noteVal
        case 1
            sign = 'f';
            noteVal = noteVal + 1;
        case 4
            sign = 'f';
            noteVal = noteVal + 1;
        case 6
            sign = 'f';
            noteVal = noteVal + 1;
        case 9
            sign = 'f';
            noteVal = noteVal + 1;
        case 11
            sign = 'f';
            noteVal = noteVal + 1;
        otherwise
            sign = 'n';
    end
    noteVal = mod(noteVal, 12);
    switch noteVal
        case 0
            note = 'A';
        case 2
            note = 'B';
        case 3
            note = 'C';
        case 5
            note = 'D';
        case 7
            note = 'E';
        case 8
            note = 'F';
        case 10
            note = 'G';
    end
    Note = strcat(note, sign, num2str(octave));
end