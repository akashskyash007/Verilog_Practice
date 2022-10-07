module PIPO(out, in, load, clk);
	input[15:0] in;
	input load, clk;
	output reg[15:0] out;
	
	always @(posedge clk) begin
		if (load)
			out <= in;
	end
endmodule
