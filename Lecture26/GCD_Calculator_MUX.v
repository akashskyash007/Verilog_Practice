module MUX21(out, in1, in2, sel);
	input[15:0] in1, in2;
	input sel;
	output reg[15:0] out;
	
	always @(*) begin
		if (sel)
			out = in2;
		else
			out = in1;
	end
endmodule
