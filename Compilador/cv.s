<<<<<<< HEAD
      MOV R0, #200
      MUL R0,R0,#200
      SUB R1,R15,R15 	 
      add R2,R1,#1
=======
      MOV R0, #40000 
      MOV R1,#0 	 
      MOV R2,#1
>>>>>>> dfdba57908b97b96622a4e6564238ea08eee88e9
LOOP: CMP R1, #10
      BEQ LOOP2 		 
      STR R2, [R0], #1            
      ADD R1,R1,#1
      B LOOP 		 
<<<<<<< HEAD
LOOP2: MOV R0, #200
       MUL R0,R0,#200
       SUB R1,R15,R15
=======
LOOP2: MOV R0, #40000
       MOV R1,#0
>>>>>>> dfdba57908b97b96622a4e6564238ea08eee88e9
LOOP3: CMP R1, #10 		
       BEQ DONE 		 
       LDR R3, [R0,#1]            
       ADD R1,R1,#1
       B LOOP3
DONE: B DONE