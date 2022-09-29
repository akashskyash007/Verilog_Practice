module MooreMachine_optimized(clk, out);
	input clk;
	output reg[0:2] out;
	parameter S0 = 0, S1 = 1, S2 = 2;
	parameter RED = 3'b100, GREEN = 3'b010, YELLOW = 3'b001;
	reg[0:1] state;

	always@(posedge clk) begin
		case (state)
			S0: state <= S1;
			S1: state <= S2;
			S2: state <= S0;
			default: state <= S0;
		endcase
	end
	always@(state) begin
		case (state)
			S0: out = RED;
			S1: out = GREEN;
			S2: out = YELLOW;
			default: out = RED;
		endcase
	end
endmodule
