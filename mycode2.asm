.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
       ;INPUT
       
       MOV AH,1
       INT 21H
       MOV BL,AL 
       
       MOV AH,1
       INT 21H
       MOV BH,AL 
       
       MOV AH,1
       INT 21H
       MOV CL,AL
       
       MOV AH,1
       INT 21H
       MOV CH,AL
       
       ;NEWLINE
       
       MOV AH,2
       MOV DL,10
       INT 21H
       
       ;CARRIAGE RETURN
       
       MOV AH,2
       MOV DL,13
       INT 21H
       
       ;OUTPUT
       
       MOV AH,2
       MOV DL,BL
       INT 21H
       
       MOV AH,2
       MOV DL,BH
       INT 21H
        
       
       MOV AH,2
       MOV DL,CL 
       INT 21H
             
       MOV AH,2
       MOV DL,CH
       INT 21H
        
        
       
MOV AH,4CH
INT 21H
    
MAIN ENDP

END MAIN