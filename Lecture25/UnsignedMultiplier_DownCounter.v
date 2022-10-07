//Defining DownCounter
module downcounter(out, in, load, dec, clk);
	input[15:0] in;
	input load, dec, clk;
	output reg[15:0] out;

	always @(posedge clk) begin
		if (dec)
			out <= out - 1;
		else if (load)
			out <= in;
	end
endmodule
