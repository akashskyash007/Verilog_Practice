module practice_1(X, Y, F);
	input X, Y;
	output reg F;
	always @(X or Y) begin
		F <= #2 X&Y;
	end
endmodule
