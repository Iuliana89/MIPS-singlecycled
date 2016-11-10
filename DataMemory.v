module DataMemory(clk,adress,rdata,wdata,MemWrite,MemRead);

input clk;
input MemWrite,MemRead;
input [31:0] wdata;
input [31:0] adress;
output [31:0] rdata;

reg [31:0] DM [0:255];

initial begin
	$readmemh("data.mem",DM);
end

always@(posedge clk)
begin
	if(MemWrite)
		DM[adress]=wdata;
end

assign rdata=DM[adress];

endmodule
