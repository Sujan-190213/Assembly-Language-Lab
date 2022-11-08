; Triangle

.model small
.stack 100h
.code
main proc
    mov bh,5
    mov bl,0
    MOV ah,2
    
loop_1:
    cmp bh,0
    je END_1
    MOV bl,0
    
LOOP_2:
    CMP bl,bh
    JAE END_2 ;Jump if above or equal
    MOV dl,'*'
    INT 21H
    INC bl
    JMP LOOP_2
    
END_2:
    MOV dl,10
    INT 21H
    MOV dl,13
    INT 21H
    DEC bh
    JMP LOOP_1
    
END_1:
    MOV ah,4CH
    INT 21H
MAIN ENDP
END MAIN