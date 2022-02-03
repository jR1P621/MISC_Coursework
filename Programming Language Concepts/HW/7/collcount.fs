\ collcount.fs
\ Jon Rippe
\ CSCE 331 - Spring 2021
\ HW 7


\ n is pos integer & c is number of iterations of the
\ Collatz function required to take n to 1
: collcount { n -- c }

    0 { c }

    begin
    n 1 <> while
        n 2 mod 0 = if
            n 2 / to n
        else
            n 3 * 1 + to n
        endif
        c 1 + to c
    repeat

    c
;