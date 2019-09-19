; Some great fib algo's in assembly: http://cubbi.com/fibonacci/asm.html

; Explanation taken from https://stackoverflow.com/a/12866391/1449624
; You can do it with just a few registers, let's identify them:

;     Rn (the number of the requested fibonacci number)
;     Rf1 (used to calculate fibonacci numbers)
;     Rf2 (also used to calculate fibonacci numbers)
;     Rx (the register to hold the return value. can overlap with any other register)

; Rn is passed as the argument to the function. Rf1 shall start at 0, and Rf2 shall start at 1.

; Here's what we do to get the answer, split up by routines:

; Begin

;     Initialize Rf1 to 0.
;     Initialize Rf2 to 1.
;     Continue to Loop.

; Loop

;     Subtract 2 from Rn.
;     If Rn is less than 0, jump to Finish.
;     Add Rf2 to Rf1, storing the result in Rf1.
;     Add Rf1 to Rf2, storing the result in Rf2.
;     Jump to Loop.

; Finish

;     If Rn AND 1 is false (implying that Rn is even) jump to FinishEven.
;     Store Rf1 as the return value.
;     Return.

; FinishEven

;     Store Rf2 as the return value.
;     Return.

; Tracing through for Rn = 5:

;     Rf1 = 0
;     Rf2 = 1
;     Rn = Rn - 2 // Rn = 3
;     Test Rn < 0 // false
;     Rf1 = Rf1 + Rf2 // Rf1 = 0 + 1 = 1
;     Rf2 = Rf1 + Rf2 // Rf2 = 1 + 1 = 2
;     Unconditional Jump to Loop
;     Rn = Rn - 2 // Rn = 1
;     Test Rn < 0 // false
;     Rf1 = Rf1 + Rf2 // Rf1 = 1 + 2 = 3
;     Rf2 = Rf1 + Rf2 // Rf2 = 3 + 2 = 5
;     Unconditional Jump to Loop
;     Rn = Rn - 2 // Rn = -1
;     Test Rn < 0 // true
;     Jump to Finish
;     Test Rn & 1 // true
;     Rx = Rf2 // 5
