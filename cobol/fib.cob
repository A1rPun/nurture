IDENTIFICATION DIVISION.
PROGRAM-ID. fibonacci.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  n           PIC 9(9) COMP.
01  fib-result  PIC 9(9) COMP.

PROCEDURE DIVISION.
  DISPLAY "Enter Nth Fibonacci to calculate" END-DISPLAY
  ACCEPT n END-ACCEPT
  CALL "fib" USING CONTENT n RETURNING fib-result END-CALL
  DISPLAY fib-result END-DISPLAY
  .
END PROGRAM fibonacci.

IDENTIFICATION DIVISION.
PROGRAM-ID. fib RECURSIVE.
DATA DIVISION.
LOCAL-STORAGE SECTION.
01  res-1  PIC 9(9) COMP.
01  res-2  PIC 9(9) COMP.

LINKAGE SECTION.
01  n           PIC 9(9) COMP.
01  fib-result  PIC 9(9) COMP BASED.

PROCEDURE DIVISION USING n RETURNING fib-result.
  ALLOCATE fib-result
  EVALUATE n
    WHEN 0
      MOVE 0 TO fib-result
    WHEN 1
      MOVE 1 TO fib-result
    WHEN OTHER
      SUBTRACT 1 FROM n END-SUBTRACT
      CALL "fib" USING CONTENT n RETURNING res-1 END-CALL
      SUBTRACT 1 FROM n END-SUBTRACT
      CALL "fib" USING CONTENT n RETURNING res-2 END-CALL
      ADD res-1 TO res-2 GIVING fib-result END-ADD
  END-EVALUATE
  .
END PROGRAM fib.
