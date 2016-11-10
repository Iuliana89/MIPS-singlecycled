module tb_InstructionMemory;
reg clk;
reg [31:0] readAdress ;
reg [31:0] instrIn ;
wire [31:0] instrOut;
reg wen;
InstructionMemory InstrMem_DUT(clk,wen,readAdress,instrIn,instrOut);

always #5 clk=~clk;

initial begin
	clk=0;
	readAdress=0;
	
	#10 readAdress=1; wen=1;
	#10 readAdress=7; wen=0;
	#10 readAdress=15;

	#50 $finish;
end
endmodule