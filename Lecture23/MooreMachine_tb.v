module MooreMachine_tb;
	reg clk;
	wire[0:2] out;

	MooreMachine_optimized dut(clk, out);

	initial clk = 1'b0;

	always clk = #5 ~clk;

	initial begin
		$dumpfile("MooreMachine.vcd");
		$dumpvars(0, MooreMachine_tb);
		$monitor($time, " RGY = %b", out);
		#100 $finish;
	end
endmodule
