.MODEL SMALL
.STACK 100H


.DATA 

   NUM DB 2      
   COUNT DB 0
   I DB 2  
   REM DB 0






.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CL,1
    
LOOP1:

    
     MOV AL,NUM
     MOV NUM,AL
     
     MOV AH,0
     MOV BL,I
     DIV BL  
     MOV REM,AH
     
     CMP REM,0
     JE NOT_PRIME
      
    
     INC CL
     
    
  CMP CL,NUM
  JL LOOP1  
  
    
    
   MOV DL,89
   MOV AH,2
   INT 21H
   JMP EXIT
    
    
    
   NOT_PRIME:
   
   MOV DL,78
   MOV AH,2
   INT 21H
   JMP EXIT
   
 
 
 EXIT:
 
 MOV AX,4C00H
 INT 21H
 MAIN ENDP
END MAIN


