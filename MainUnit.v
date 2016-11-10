module MainUnit(clk,res);

input clk;
input res;

wire [31:0] PC_Out;
wire [31:0] PC_In;
wire [31:0] Instruction;     //InstructionMemoryOut
wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [4:0]  WriteRegister;   //Mux1Out
wire [31:0] ALUresult;   
wire [31:0] Mux2Out;         //ReadData2 or SignExtendOut
wire [31:0] ReadData;        //DataMemOut         
wire [31:0] WriteData;       //Mux3Out  
wire [31:0] SignExtendOut;
wire [31:0] adder4Out;
wire [31:0] sumOut;
wire [3:0] ALUCtrl;

wire RegDst;
wire Branch;
wire MemRead;
wire MemToReg;
wire ALUOp1,ALUOp0;
wire MemWrite;
wire ALUSrc;
wire RegWrite;
wire Zero;

Control MainControl(Instruction[31:26],RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0);

reg32 PC(clk,res,1'b1,PC_In,PC_Out);

InstructionMemory IMem(clk,1'b0,PC_Out,32'b0,Instruction);

mux#(5) MUX1(Instruction[20:16],Instruction[15:11],RegDst,WriteRegister);

RegisterFile RegF(clk,Instruction[25:21],Instruction[20:16],WriteRegister,WriteData,ReadData1,ReadData2,RegWrite);

SignExtend SE(Instruction[15:0],SignExtendOut);

ALU_Control ALUctrl({ALUOp1,ALUOp0},Instruction[5:0],ALUCtrl);

mux #(32) MUX2(ReadData2,SignExtendOut,ALUSrc,Mux2Out);

ALU ALU_Oper(clk,ReadData1,Mux2Out,Zero,ALUresult,ALUCtrl);

DataMemory DMem(clk,ALUresult,ReadData,ReadData2,MemWrite,MemRead);

mux #(32) MUX3(ALUresult,ReadData,MemToReg,WriteData);

sum newPC(PC_Out,32'b1,adder4Out); //PC+1(in loc de PC+4)

sum newBranchPC(adder4Out,SignExtendOut,sumOut);

mux #(32) MUX4(adder4Out,sumOut,Branch & Zero,PC_In);


endmodule

