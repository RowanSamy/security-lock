include 'emu8086.inc'  
org 100h    ;determines the begining of my program
.DATA
   id_num: DW 1000,2000,3000,4000,5000,6000,7000,8000,9000,10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000
   password: DW 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0,1,2,3,4
   
.CODE
   MAIN PROC
      MOV BX,@DATA   ;getting the offset of the array
      MOV DS,BX      ;putting the offset in the data segment
      
      ;MOV CX,40
      ;MOV SI,0 
                           
    ID:                        ;ID and pass loops to only check the data is stored correctly in memory but can be removed
      ;MOV AX,id_num[SI] 
      ;CALL PRINT_NUM_UNS  
      ;PRINT '   '
      ;ADD SI,2          
      ;SUB CX,2
      ;CMP CX,0
      ;JNZ ID
      
      ;MOV SI,0
      ;MOV CX,40
      
    PASS:
      ;MOV AX,password[SI] 
      ;CALL PRINT_NUM_UNS  
      ;PRINT '   '
      ;ADD SI,2          ;because each number takes 2 bytes
      ;SUB CX,2
      ;CMP CX,0
      ;JNZ PASS
      
    INPUT:
     ; printn
      PRINT "Enter the Identification number:"
      CALL SCAN_NUM                            ;entered number is stored in CX
      
      MOV SI,0
      MOV BX,40
      
    COMPARE:
      CMP id_num[SI],CX   ;id_num is the starting address in my memory
      JE  CHECK_PASS 
      ADD SI,2
      SUB BX,2
      CMP BX,0
      JNZ COMPARE
      JMP  RE-ENTER       ;looped and didn't find a matching ID

      
    CHECK_PASS:
      printn
      PRINT "Enter the password:"
      CALL SCAN_NUM
      CMP password[SI],CX
      JNE NOT_FOUND
      printn
      PRINT "1 : ACCESS ALLOWED"
      JMP  END

      
    NOT_FOUND: 
      printn
      PRINT "0 : ACCESS DENIED"  
      printn
      JMP  INPUT                   ;allows the user another trial
      
    RE-ENTER:                      ;in case user entered wrong ID
      printn
      PRINT "Wrong Identification number-please re-enter:"
      CALL SCAN_NUM  
      MOV SI,0
      MOV BX,40
      JMP COMPARE
    
    END:
     MAIN ENDP
   
DEFINE_PRINT_NUM_UNS 
DEFINE_SCAN_NUM
END MAIN