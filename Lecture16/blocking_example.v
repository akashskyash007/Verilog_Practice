module blocking_example;
	reg X, Y, Z;
	reg[31:0] A, B;
	integer sum;
	
	initial begin
		X = 1'b0; Y = 1'b0; Z = 1'b1;
		sum = 1;
		A = 32'b0; 
		B = 32'habababab;
		#5 A[5] = 1'b1;
		#10 B[31:29] = {X, Y, Z};
		sum = sum + 5;
	end
endmodule
