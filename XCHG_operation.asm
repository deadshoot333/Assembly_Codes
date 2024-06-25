.MODEL SMALL
.STACK 100H
.DATA
M1 DW 'BEFOR SWAPPING: $'
M2 DW 'AFTER SWAPPING: $'
A DB 48
B DB 56
.CODE

MAIN PROC
       MOV AX,@DATA
       MOV DS,AX
       
       MOV AH,09H
       LEA DX,M1  ;PRINT M1 MESSAGE
       INT 21H
       
       MOV AH,02H
       MOV DL,20H  ;PRINT SPACE
       INT 21H
       
       MOV AH,02H
       MOV DL,A    ;PRINT A VALUE
       INT 21H
       
       MOV AH,02H
       MOV DL,20H  ;PRINT SPACE
       INT 21H
       
       MOV AH,02H
       MOV DL,B   ;PRINT B VALUE
       INT 21H
       
       MOV AH,02H
       MOV DL,0AH ;
       INT 21H
                     ;NEWLINE AND CRET
       MOV AH,02H
       MOV DL,0DH ;
       INT 21H
       
       MOV BL,B  ;XCHG VARIABLE1,VARIABLE2 IS ILLEGAL SO IT IS STORED IN REGISTER
       
       XCHG A,BL
       
       MOV AH,09H
       LEA DX,M2
       INT 21H
       
       MOV AH,02H
       MOV DL,A
       INT 21H
       
       MOV AH,02H
       MOV DL,20H
       INT 21H
       
       MOV AH,02H
       MOV DL,BL
       INT 21H
       
       MAIN ENDP
END MAIN