module Procesador_tb();

//Estas son las variables necesarias para instanciar el procesador, hay que cambiarlas por las del nuestro
logic clk,psclk,psdata;
logic reset;
logic [31:0] WriteData, DataAdr;
logic MemWrite;
logic V_SyncOut,H_SyncOut;
logic [7:0] RedOut,GreenOut,BlueOut;
logic blank,sync,VGA_clock;

//Este es el procesador instanciado, hay que cambiarlo por el nuestro
processor dut(clk, reset,psclk,psdata, WriteData, DataAdr, MemWrite,V_SyncOut,H_SyncOut,RedOut,GreenOut,BlueOut,blank,sync,VGA_clock);

//Esto define el clock inicial
initial begin
	reset <= 1; # 10; reset <= 0;
end
always
	begin
	clk <= 1; # 5; clk <= 0; # 5;
end

//Esto se utiliza para probar si se encuentran datos en la entrada de la memoria al procesador
//Puedes comentarlo inicialmente para ver el comportamiento general
always @(negedge clk) begin
	if(MemWrite) begin
		if(DataAdr === 100 & WriteData === 7) begin
			$display("Funka kcht !! XD");
			$stop;
		end else if (DataAdr !== 96) begin
		$display("Fallo Procesador :(");
		$stop;
		end
	end
end

endmodule