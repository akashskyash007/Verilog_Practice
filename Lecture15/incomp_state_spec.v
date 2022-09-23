module incomp_state_spec(curr_state, flag);
	input[0:1] curr_state;
	output reg[0:1] flag;
	
	always @(curr_state)
	begin
		flag = 1;
		case (curr_state)
			0, 1: flag = 2;
			3: flag = 0;
		endcase
	end
endmodule
