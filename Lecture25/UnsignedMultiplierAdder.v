//Defining 16 bit adder
module adder16(out, in1, in2);
	input[15:0] in1, in2;
	output reg[15:0] out;

	always @(*) begin
		out = in1 + in2;
	end
endmodule
