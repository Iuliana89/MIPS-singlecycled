module tb_DataMemory;


reg clk;
reg MemWrite,MemRead;
reg [31:0] wdata;
reg [31:0] adress;
wire [31:0] rdata;
DataMemory DataMemory_DUT(clk,adress,rdata,wdata,MemWrite,MemRead);
reg [31:0] DM [0:255];


always #5 clk=~clk;

initial begin
	clk=0;
	adress=0;
	
	#10 adress=1;wdata=32'b00000000000000000000000000001000; MemWrite=1;
	#10 adress=7;wdata=32'b00000000000000000000000000001001; MemWrite=1;
	#10 adress=15;

	#50 $finish;
end
endmodule