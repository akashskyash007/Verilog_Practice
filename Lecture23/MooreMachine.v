module MooreMachine(clk, out);
	input clk;
	output reg[0:2] out;
	parameter S0 = 0, S1 = 1, S2 = 2;
	parameter RED = 3'b100, GREEN = 3'b010, YELLOW = 3'b001;
	reg[0:2] state;

	always @(posedge clk) begin
		case (state)
			S0: begin
				state <= S1;
				out <= RED;
			end
			S1: begin
				state <= S2;
				out <= GREEN;
			end
			S2: begin
				state <= S0;
				out <= YELLOW;
			end
			default: begin
				state <= S1;
				out <= RED;
			end
		endcase
	end
endmodule
