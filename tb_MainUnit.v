module tb_MainUnit;

reg clk;
reg res;

MainUnit MainUnit_DUT(clk,res);

always #5 clk=~clk;
initial begin
	#5 clk = 0; res = 1;
	#15 res = 0;
	#1500 $finish;
end
endmodule
