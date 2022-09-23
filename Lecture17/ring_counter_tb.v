module ring_counter_tb;
	reg init, clk;
	wire[7:0] count;
	
	//Instantiate the Ring Counter
	ring_counter my_counter(init, clk, count);
	
	//Put init to 1 at the start for initialization
	initial begin
		init = 1;
		#10 init = 0;
	end
	
	//Generate the Clock Signal
	initial begin
		clk = 0;
		forever
			#5 clk = ~clk;
	end
	
	//Monitor the Count Value and Specify When To Finish
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0, ring_counter_tb);
		$monitor($time, " : init = %b, count = %8b", init, count);
		#90 $finish;
	end
endmodule
