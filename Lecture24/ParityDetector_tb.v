module Parity_Detector_tb;
	reg in_seq, clk;
	wire out_seq;

	ParityDetector dut(clk, in_seq, out_seq);

	initial clk = 1'b0;
	always #5 clk = ~clk;
	initial begin
		$dumpfile("ParityDetector.vcd");
		$dumpvars(0, Parity_Detector_tb);
		$monitor($time, ": in_seq = %b, out_seq = %b", in_seq, out_seq);
		#2 in_seq = 0; #10 in_seq = 1; #10 in_seq = 1; #10 in_seq = 0;
		#10 in_seq = 1; #10 in_seq = 1; #10 in_seq = 1; #10 in_seq = 1;
		#10 in_seq = 0; #10 in_seq = 0; #10 in_seq = 0; #10 in_seq = 1;
		#10 $finish;
	end
endmodule
