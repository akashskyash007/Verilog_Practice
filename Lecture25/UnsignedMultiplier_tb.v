//Test Bench for 16 bit Unsigned Multiplier
module multiplier_test_bench;
	reg[15:0] data_in;
	reg start, clk;
	wire done;

	multiplier_data_path dp(eqz, data_in, clk, ldA, ldB, decB, ldP, clrP);
	multiplier_controller controller(done, ldA, ldB, decB, ldP, clrP, clk, start, eqz);

	initial begin
		clk = 1'b0;
		#3 start = 1'b1;
		#1000 $finish;
	end

	always #5 clk = ~clk;

	initial begin
		$dumpfile("UnsignedMultiplier.vcd");
		$dumpvars(0, multiplier_test_bench);
		$monitor($time, " A = %d, B = %d, Product = %d, done = %b, eqz = %b, Present State = %d", dp.X, dp.Bout, dp.Y, done, controller.eqz, controller.present_state);
		#13 data_in = 18;
		#10 data_in = 7;
	end
endmodule
