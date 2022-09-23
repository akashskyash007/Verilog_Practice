module ring_counter(init, clk, count);
	input init, clk;
	output reg[7:0] count;
	
	always @(posedge clk)
		if (init)
			count <= 8'b10000000;
		else
			begin
				count <= count >> 1;
				count[7] <= count[0];
			end
endmodule
