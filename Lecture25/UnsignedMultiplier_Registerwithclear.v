//Defining PIPO2 Register
module pipo2(data_out, data_in, load, clear, clk);
	input[15:0] data_in;
	input load, clk, clear;
	output reg[15:0] data_out;

	always @(posedge clk) begin
		if (clear)
			data_out <= 0;
		else if (load)
			data_out <= data_in;
	end
endmodule
