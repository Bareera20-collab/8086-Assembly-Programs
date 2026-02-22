.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "ENTER FIRST DIGIT: $"
    MSG2 DB 10,13,"ENTER SECOND DIGIT: $"
    MSG3 DB 10,13,"SUM IS: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display first message
    MOV AH, 9
    LEA DX, MSG1
    INT 21H

    ; Read first digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV BL, AL

    ; Display second message
    MOV AH, 9
    LEA DX, MSG2
    INT 21H

    ; Read second digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV CL, AL

    ; Add digits
    ADD BL, CL
    ADD BL, 30H

    ; Display result message
    MOV AH, 9
    LEA DX, MSG3
    INT 21H

    ; Display result
    MOV AH, 2
    MOV DL, BL
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN