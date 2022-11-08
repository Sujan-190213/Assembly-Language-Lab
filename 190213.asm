.MODEL SMALL
.STACK 100H
.DATA 

  BIRTH DB 4 
  FIRST DB 0
  SECOND DB 0
  SUM DB 0 
  
  REM1 DB 0 
  REM2 DB 0
  
  EXTRA1 DB 0
  EXTRA2 DB 0
  
.CODE
    MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
        
     
     
     
            MOV AH,1
            INT 21H
            
            MOV BL,AL
            SUB BL,48            ;FIRST DIGIT
            MOV FIRST,BL
             
             
            MOV AH,1
            INT 21H
            
            MOV CL,AL            ;SECOND DIGIT
            SUB CL,48
            MOV SECOND,CL  
            
            
            
            
            ;MULTIPLICATION  
            
            MOV AL,SECOND
            MOV CL,BIRTH
            
            MUL CL           ;AL = AL * CL
                           
            MOV EXTRA1,AL  
            
            
            MOV AL,FIRST
            MOV CL,BIRTH
            
            MUL CL            ;AL = AH * CL
            
            MOV EXTRA2,AL
            
            ;NEWLINE
            
            MOV DL,10
            MOV AH,2
            INT 21H
            
            ;CARRIAGE RETURN 
            
            MOV DL,13
            MOV AH,2
            INT 21H
            
            ;SUMMATION 
            
            MOV AL,EXTRA1
            ADD AL,EXTRA2       ;SUMMATION IN AL
            
            
            MOV AH,0
            MOV BL,10
            
            
            DIV BL      ;AL = RESULT & AH = REMAINDER  
            
            MOV REM1,AL
            MOV REM2,AH
            
           ; ADD AL,REM
            
            ;DISPLAY
            
            MOV DL,REM1 
            ADD DL,48
            
            MOV AH,2
            INT 21H 
            
            MOV DL,REM2
            ADD DL,48
            
            MOV AH,2
            INT 21H 
          
            
       
       MOV AX,4C00H
      INT 21H    
        
    MAIN ENDP
    
END MAIN    