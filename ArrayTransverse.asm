.MODEL SMALL
.STACK 100H
.DATA
ARRAY DB '1','2','3','4'
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA BX,ARRAY
    MOV CX,04H
    
    MOV AH,02H
    L1:
       MOV DL,[BX]
       INT 21H
       INC BX
       LOOP L1 
     
    MAIN ENDP
END MAIN