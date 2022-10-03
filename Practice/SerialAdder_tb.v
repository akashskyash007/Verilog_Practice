module SerialAdder_tb;
	reg clk, rst, in_seq1, in_seq2;
	wire out_seq;
	SerialAdder dut(clk, rst, in_seq1, in_seq2, out_seq);

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		#7 rst = 1'b0;
	end

	always #5 clk = ~clk;

	initial begin
		$dumpfile("SerialAdder.vcd");
		$dumpvars(0, SerialAdder_tb);
		#2 in_seq1 = 1'b0; in_seq2 = 1'b0;
		#10 in_seq1 = 1'b1; in_seq2 = 1'b0;
		#10 in_seq1 = 1'b0; in_seq2 = 1'b1;
		#10 in_seq1 = 1'b1; in_seq2 = 1'b1;
		#10 in_seq1 = 1'b0; in_seq2 = 1'b0;
		#10 in_seq1 = 1'b1; in_seq2 = 1'b1;
		#10 in_seq1 = 1'b1; in_seq2 = 1'b1;
		#10 in_seq1 = 1'b0; in_seq2 = 1'b1;
		#10 in_seq1 = 1'b1; in_seq2 = 1'b0;
		#10 in_seq1 = 1'b0; in_seq2 = 1'b0;
		#10 in_seq1 = 1'b0; in_seq2 = 1'b0;
		#10 $finish;
	end
endmodule
