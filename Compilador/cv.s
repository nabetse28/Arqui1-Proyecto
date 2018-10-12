      MOV R0, #40000 
      MOV R1,#0 	 
      MOV R2,#1
LOOP: CMP R1, #10
      BEQ LOOP2 		 
      STR R2, [R0], #1            
      ADD R1,R1,#1
      B LOOP 		 
LOOP2: MOV R0, #40000
       MOV R1,#0
LOOP3: CMP R1, #10 		
       BEQ DONE 		 
       LDR R3, [R0,#1]            
       ADD R1,R1,#1
       B LOOP3
DONE: B DONE