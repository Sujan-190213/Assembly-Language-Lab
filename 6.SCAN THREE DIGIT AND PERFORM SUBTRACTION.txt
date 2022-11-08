;INPUT >> 7-2-3 = 2

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "ENTER NUMBER 1 : $"
    MSG2 DB "ENTER NUMBER 2 : $"
    MSG3 DB "ENTER NUMBER 3 : $"
    
    NO1 DB 0
    NO2 DB 0
    NO3 DB 0
    
    SUBT DB 0
    
    
.CODE
    MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX             ;INITIALIZE DATA SEGMENT
    
    
    
    
    
    
    ;PRINT FIRST MESSEGE
    
    MOV DX,OFFSET MSG1
    MOV AH,9              ;FOR PRINTING STRING AH = 9
    INT 21H
    
    
    ;TAKE FIRST INPUT
    
    MOV AH,1
    INT 21H                ;INPUT IN AL (ASCII) NOT AH
    
    SUB AL,48              ;ASCII TO DECIMAL
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
    MOV AH,9              ;FOR PRINTING STRING AH = 9
    INT 21H
         
     
    ;TAKE SECOND INPUT
    
    MOV AH,1
    INT 21H                ;INPUT IN AL (ASCII) NOT AH
    
    SUB AL,48              ;ASCII TO DECIMAL
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
    MOV AH,9              ;FOR PRINTING STRING AH = 9
    INT 21H
         
     
    ;TAKE THIRD INPUT
    
    MOV AH,1
    INT 21H                ;INPUT IN AL (ASCII) NOT AH
    
    SUB AL,48              ;ASCII TO DECIMAL
    MOV NO3,AL
    
    
    ;PRINT NEWLINE
    
    MOV DL,10              
    MOV AH,2
    INT 21H
    
    ;CARRIAGE RETURN 
    
    MOV DL,13
    MOV AH,2
    INT 21H    
       
    
    
    
    
    ;SUBTRACTION  (PART 1)
    
    MOV DL,NO1
    SUB DL,NO2 
    
    
    ;FIRST SUB
    
    MOV SUBT,DL  
    
    
    ;MOVE SUBT TO AL
    
    MOV AL,SUBT
    
    ;SECOND SUB
    
    SUB AL,NO3
     
    
    
                     
    ;DISPLAY RESULT

    MOV DL,AL
    ADD DL,48     ;CONVERTED INTO ASCII
    
    MOV AH,2
    INT 21H  
     

        
    MOV AX,4C00H
    INT 21H            ;DOS
        
    MAIN ENDP
    
END MAIN    