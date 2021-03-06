IDENTIFICATION DIVISION.
PROGRAM-ID. AOC-DAY-2.
AUTHOR. ANDREY KUZMINOV.

DATA DIVISION.
    WORKING-STORAGE SECTION.
        77 WS-READ PIC X(20).
        77 WS-DIRECTION PIC X(20).
        77 WS-VALUE PIC 9(4) VALUE 0000.
        77 WS-AIM PIC 9(4) VALUE 0000.
        77 WS-TEMP PIC 9(4) VALUE 0000.
        77 WS-DEPTH PIC 9(10) VALUE 0000000000.
        77 WS-FORWARD PIC 9(4) VALUE 0000.
        77 WS-RESULT-1 PIC 9(10) VALUE 0000000000.
        77 WS-RESULT-2 PIC 9(10) VALUE 0000000000.
        
PROCEDURE DIVISION.
001-MAIN.
    PERFORM 002-PROCESS-RECORD 1000 TIMES.
    MULTIPLY WS-FORWARD BY WS-AIM GIVING WS-RESULT-1.
    MULTIPLY WS-FORWARD BY WS-DEPTH GIVING WS-RESULT-2.
    DISPLAY WS-RESULT-1.
    DISPLAY WS-RESULT-2.
    STOP RUN.

002-PROCESS-RECORD.
    ACCEPT WS-READ.
    
    UNSTRING WS-READ DELIMITED BY SPACE
        INTO WS-DIRECTION, WS-VALUE
    END-UNSTRING.
    
    EVALUATE WS-DIRECTION
    
        WHEN "forward" 
            ADD WS-VALUE TO WS-FORWARD;
            MULTIPLY WS-VALUE BY WS-AIM GIVING WS-TEMP;
            ADD WS-TEMP TO WS-DEPTH
            
        WHEN "down" 
            ADD WS-VALUE TO WS-AIM
            
        WHEN "up" 
            SUBTRACT WS-VALUE FROM WS-AIM
            
    END-EVALUATE.
