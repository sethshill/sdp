function outfreqs = freq2freq(infreqs)
%{
    Author: Matthew T. Dunlap
    Algorithm: freq2freq
    Date Written: 11/3/16
    Last Revised: 11/3/16
    Version: 1.0.0

    Dependencies: freq2note, note2freq, unique.

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Required Inputs: 1
        infreqs (vector): input frequencies.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Optional Inputs: 0
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Outputs: 1
        outfreqs (vector): 'auto-tuned' version of infreqs.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Description: Takes a frequency vector and 'auto-tunes' the notes,
        removing all duplicates in the process.
    Notes: This algorithm is very useful. It uses freq2note, note2freq, and
        MATLAB's unique. Need to implement a custom 'unique' function.
    See Also: freq2note, note2freq, unique.
%}
    n = length(infreqs);
    notes = cell(n, 1);
    for i = 1:n
        notes{i} = freq2note(infreqs(i));
    end
    unotes = unique(notes);
    l = length(unotes);
    outfreqs = zeros(l, 1);
    for i = 1:l
        outfreqs(i) = note2freq(unotes{i});
    end
    outfreqs = sort(outfreqs);
end