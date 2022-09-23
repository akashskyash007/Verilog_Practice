module mux16to1(inp, sel, out);
	input[15:0] inp;
	input[3:0] sel;
	output out;
	assign out = inp[sel]; 
endmodule
