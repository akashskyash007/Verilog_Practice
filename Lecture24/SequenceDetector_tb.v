module SequenceDetector_tb;
	reg clk, rst, in_seq;
	wire out_seq;
	SequenceDetector dut(clk, rst, in_seq, out_seq);

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		#13 rst = 1'b0;
	end
	
	always #5 clk = ~clk;

	initial begin
		$dumpfile("SequenceDetector.vcd");
		$dumpvars(0, SequenceDetector_tb);
		#12 in_seq = 0; #10 in_seq = 0; #10 in_seq = 1; #10 in_seq = 1;
		#10 in_seq = 0; #10 in_seq = 1; #10 in_seq = 1; #10 in_seq = 0;
		#10 in_seq = 0; #10 in_seq = 1; #10 in_seq = 1; #10 in_seq = 0;
		#10 $finish;
	end
endmodule
