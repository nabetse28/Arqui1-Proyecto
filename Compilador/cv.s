      MOV R0, #200
      MUL R0,R0,#200
      SUB R1,R15,R15 	 
      add R2,R1,#1
LOOP: CMP R1, #10
      BEQ LOOP2 		 
      STR R2, [R0], #1            
      ADD R1,R1,#1
      B LOOP 		 
LOOP2: MOV R0, #200
       MUL R0,R0,#200
       SUB R1,R15,R15
LOOP3: CMP R1, #10 		
       BEQ DONE 		 
       LDR R3, [R0,#1]            
       ADD R1,R1,#1
       B LOOP3
DONE: B DONE