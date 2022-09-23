module incomplete_state_spec_tb;
	reg[0:1] curr_state;
	wire[0:1] flag;
	
	incomp_state_spec DUT(curr_state, flag);
	
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0, incomplete_state_spec_tb);
		$monitor($time, " curr_state = %2b, flag = %2b", curr_state, flag);
		curr_state = 0;
		#5 curr_state = 1;
		#5 curr_state = 2;
		#5 curr_state = 3;
		#5 $finish;
	end
endmodule
