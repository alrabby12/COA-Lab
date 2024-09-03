


;Enter a latter A/a USE AND & OR Operation


.MODEL SMALL
.STACK 100H
.DATA   

    PROMPT DB 'ENTER A LETTER: $'
    RESULT_CAP_TO_SMALL DB 'IN SMALL IT IS: $'
    RESULT_SMALL_TO_CAP DB 'IN CAPITAL IT IS: $'
    INVALID_INPUT DB 'INVALID INPUT! PLEASE ENTER A LETTER.$'
    LETTER DB ?
    NEWLINE DB 13, 10, '$'
 
.CODE
MAIN PROC

 
    MOV AX, @DATA
    MOV DS, AX
 

    LEA DX, PROMPT
    MOV AH, 09H
    INT 21H
 

    MOV AH, 01H
    INT 21H
    MOV LETTER, AL
 

    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
 
    MOV AL, LETTER
    CMP AL, 'A'
    JL CHECK_LOWERCASE  
    CMP AL, 'Z'
    JG CHECK_LOWERCASE
 

    OR AL, 00100000B  
    MOV LETTER, AL
 
  
    LEA DX, RESULT_CAP_TO_SMALL
    MOV AH, 09H
    INT 21H
 

    MOV DL, LETTER
    MOV AH, 02H
    INT 21H
 

    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
 
    JMP END_PROGRAM
 
CHECK_LOWERCASE:
 
    CMP AL, 'a'
    JL INVALID_INPUT_MSG 
    CMP AL, 'z'
    JG INVALID_INPUT_MSG
 
 
    AND AL, 11011111B   
    MOV LETTER, AL
 
 
    LEA DX, RESULT_SMALL_TO_CAP
    MOV AH, 09H
    INT 21H
 
   
    MOV DL, LETTER
    MOV AH, 02H
    INT 21H
 
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
 
    JMP END_PROGRAM
                     
INVALID_INPUT_MSG:  

    LEA DX, INVALID_INPUT
    MOV AH, 09H
    INT 21H
 
 
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
 
END_PROGRAM: 

    MOV AH, 4CH
    INT 21H
 
MAIN ENDP
 
END MAIN