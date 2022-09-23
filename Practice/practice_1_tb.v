module practice_1_tb;
	reg X, Y;
	wire F;
	practice_1 inst(X, Y, F);
	initial begin
		$dumpfile("practice_1.vcd");
		$dumpvars(0, practice_1_tb);
		$monitor("X = %b, Y = %b, F = %b", X, Y, F);
		X = 1'b0; Y = 1'b0; 
		#10 X = 1'b0; Y = 1'b1; 
		#10 X = 1'b1; Y = 1'b0; 
		#10 X = 1'b1; Y = 1'b1;  
		#10 $finish;
	end
endmodule
