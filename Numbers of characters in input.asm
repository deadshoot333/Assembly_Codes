.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    XOR BL,BL
    MOV AH,01H
    INT 21H
    WHILE:    
        CMP AL,0DH
        JE ENDW
        INC BL 
        INT 21H
        JMP WHILE
    ENDW:
        MOV AH,02H
        MOV DL,10
        INT 21H
        MOV AH,02H
        MOV DL,0DH
        INT 21H
        ADD BL,'0'
        MOV DL,BL
        MOV AH,02H
        INT 21H
            
        
MAIN ENDP
END MAIN
