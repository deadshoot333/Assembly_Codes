.MODEL SMALL
.STACK 100H
.DATA
.CODE

DEC_INPUT PROC
    XOR BX,BX
    MOV AH,01H
    INT 21H
    WHILE:
        CMP AL,0DH
        JE BREAK1
        
        PUSH AX
        MOV AX,10
        MUL BX
        MOV BX,AX
        
        POP AX
        AND AX,000FH
        ADD BX,AX
        
        MOV AH,01H
        INT 21H 
    JMP WHILE
    BREAK1:
        RET
DEC_INPUT ENDP

DEC_OUTPUT PROC
    MOV CX,0
    MOV BX,10
    
    DIVISION:
        XOR DX,DX
        DIV BX
        PUSH DX
        INC CX
        CMP AX,0
        JE PRINT
    JMP DIVISION    
    PRINT:
        POP DX
        ADD DX,30H
        MOV AH,02H
        INT 21H
        LOOP PRINT        
    RET
DEC_OUTPUT ENDP      


MAIN PROC
    CALL DEC_INPUT
    MOV AH,02H
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV CX,BX
    XOR AX,AX
    PRINT_SERIES:
         PUSH CX
         PUSH AX
         CALL DEC_OUTPUT
         
         MOV DX,32
         MOV AH,02H
         INT 21H
         
         POP AX
         INC AX
         INC AX
         POP CX
         LOOP PRINT_SERIES
         
         
        
        
    MAIN ENDP 
END MAIN