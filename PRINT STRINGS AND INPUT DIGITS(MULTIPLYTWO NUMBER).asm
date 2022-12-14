.MODEL SMALL
.STACK 100H
.DATA 

    MSG1 DB "ENTER NUMBER 1 : $"
    MSG2 DB "ENTER NUMBER 2 : $" 
    MSG3 DB "MULTIPLICATION IS : $" 
    
    NO1 DB 0
    NO2 DB 0
    MULT DB 0
    REM DB 0
    
    
.CODE
    MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX          ;INITIALIZATION
    
;PRINT FIRST MESSEGE 

    MOV DX,OFFSET MSG1
    MOV AH,9
    INT 21H    
    
;INPUT NO1
     
    MOV AH,1
    INT 21H
    SUB AL,48      ;CONVERTED INTO DECIMAL 
    MOV NO1,AL
    
;PRINT NEWLINE

    MOV DL,10
    MOV AH,2
    INT 21H 
    
;CARRIAGE RETURN

    MOV DL,13
    MOV AH,2
    INT 21H    

;PRINT SECOND MESSEGE 

    MOV DX,OFFSET MSG2
    MOV AH,9
    INT 21H  
    
;INPUT NO2           
 
    MOV AH,1
    INT 21H
    SUB AL,48      ;CONVERTED INTO DECIMAL 
    MOV NO2,AL
    
;PRINT NEWLINE

    MOV DL,10
    MOV AH,2
    INT 21H 
    
;CARRIAGE RETURN

    MOV DL,13
    MOV AH,2
    INT 21H  
    
;PRINT THIRD MESSEGE
    
    MOV DX,OFFSET MSG3
    MOV AH,9
    INT 21H
            
;MULTIPLICATION

    MOV AL,NO1
    MOV CL,NO2 
    
    MUL CL
    
;MULT
    MOV MULT,AL
    
;CLEAR AH
    MOV AH,0
    
;MOVING MULT TO AL
   
    MOV AL,MULT
    
;TAKE BL = 10

    MOV BL,10        
                        
;DIV BL = AL/BL 

    DIV BL         ;NOW AL = ANS & AH = REMAINDER
 
;MOVE AH TO REMANDER 
   
   MOV REM,AH
   
;DISPLAY RESULTL

    MOV DL,AL
    ADD DL,48     ;CONVERTED INTO ASCII
    
    MOV AH,2
    INT 21H       
    
;DISPLAY REMAINDER

    MOV DL,REM
    ADD DL,48     ;CONVERTED INTO ASCII
    
    MOV AH,2
    INT 21H       
 
            
    MOV AX,4C00H
    INT 21H                ;DOS
        
    MAIN ENDP
    
END MAIN    