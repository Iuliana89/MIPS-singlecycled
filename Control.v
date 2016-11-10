module Control(OpCode,RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0);

input [5:0] OpCode;
output RegDst;
output ALUSrc;
output MemToReg;
output RegWrite;
output MemRead;
output MemWrite;
output Branch;
output ALUOp1;
output ALUOp0;

reg RegDst;
reg ALUSrc;
reg MemToReg;
reg RegWrite;
reg MemRead;
reg MemWrite;
reg Branch;
reg ALUOp1;
reg ALUOp0;

always@(OpCode)
	casex(OpCode)
		6'b000000 : {RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0} =  9'b100100010;
		6'b100011 : {RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0} =  9'b011110000;
		6'b101011 : {RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0} =  9'b010001000; //9'bx1x001000;
		6'b000100 : {RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0} =  9'b100000101; //9'bx0x000101;
		default : $display("OpCode eronat!");
	endcase
endmodule