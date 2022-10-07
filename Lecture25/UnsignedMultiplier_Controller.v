//Module for Controller
module multiplier_controller(done, ldA, ldB, decB, ldP, clrP, clk, start, eqz);
	input clk, start, eqz;
	output reg done, ldA, ldB, decB, ldP, clrP;
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
	reg[0:2] present_state, next_state;

	always@(posedge clk) begin
		present_state <= next_state;
	end

	always @(present_state, eqz, start) begin
		case (present_state)
			S0: begin
				#2 if (start) begin
					next_state = S1;
					done = 0; ldA = 1; ldB = 0; decB = 0; ldP = 0; clrP = 0;
				end
			end
			S1: begin
				#2 next_state = S2;
				ldA = 0; ldB = 1; clrP = 1;
			end
			S2: begin
				#2 if (eqz) begin
					next_state = S4;
					done = 1; ldA = 0; ldB = 0; decB = 0; ldP = 0; clrP = 0;
				end
				else begin
					next_state = S3;
					ldB = 0; decB = 1; ldP = 1; clrP = 0;
				end
			end
			S3: begin
				#2 if (eqz) begin
					next_state = S4;
					done = 1; ldA = 0; ldB = 0; decB = 0; ldP = 0; clrP = 0;
				end
			end
			S4: begin
				#2 next_state = S4; done = 1;
			end
			default: begin
				#2 next_state = S0;
				done = 0; ldA = 0; ldB = 0; decB = 0; ldP = 0; clrP = 0;
			end
		endcase
	end
endmodule
