.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    MOV AH,01H
    INT 21H
    CMP AL,'0'
    JE ZERO  ;AL==0
    JG AL_IS_BIGGER  ;AL>0       
    JL AL_IS_SMALLER ;AL<0
ZERO:
    MOV AH,02H
    MOV DL,'0'
    INT 21H
    JMP EXIT
AL_IS_BIGGER:
    MOV AH,02H
    MOV DL,'1'
    INT 21H
    JMP EXIT
AL_IS_SMALLER:
    MOV AH,02H
    MOV DL,'N'
    INT 21H
    JMP EXIT
EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN