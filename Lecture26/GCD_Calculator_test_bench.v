module TEST_BENCH;
	reg[15:0] data_in;
	reg start, clk;
	wire done;
	DATAPATH DP(lt, gt, eq, data_in, LdA, LdB, sel1, sel2, sel_in, clk);
	CONTROLLER CNT(done, LdA, LdB, sel1, sel2, sel_in, start, lt, gt, eq, clk);
	
	initial begin
		clk = 1'b0;
		#3 start = 1'b1;
		#1000 $finish;
	end
	
	always #5 clk = ~clk;
	
	initial begin
		$dumpfile("GCD_Calculator.vcd");
		$dumpvars(0, TEST_BENCH);
		$monitor($time, " A = %d, B = %d, done = %b", DP.Aout, DP.Bout, done);
		#12 data_in = 39;
		#10 data_in = 143;
	end
endmodule
