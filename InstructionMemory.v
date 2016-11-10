module InstructionMemory(clk,wen,readAdress,instrIn,instrOut);

input clk;
input wen;
input [31:0] readAdress ;
input [31:0] instrIn ;
output [31:0] instrOut;

reg [31:0] IM [0:255];

initial begin
	$readmemh("instr.mem",IM,0);
end

always @(posedge clk)
begin
	if(wen)
		IM[readAdress]<=instrIn;
end

assign instrOut = wen ? instrIn : IM[readAdress];
endmodule