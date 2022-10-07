module CONTROLLER(done, LdA, LdB, sel1, sel2, sel_in, start, lt, gt, eq, clk);
	input start, lt, gt, eq, clk;
	output reg done, LdA, LdB, sel1, sel2, sel_in;
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;
	reg[2:0] present_state, next_state;
	
	always @(posedge clk) begin
		present_state <= next_state;
	end
	
	always @(present_state, start, lt, gt, eq) begin
		case (present_state)
			S0: begin
				#2 if (start) begin
					next_state = S1;
					LdA = 1;
				end
			end
			S1: begin
				#2 next_state = S2;
				LdA = 0; LdB = 1;
			end
			S2: begin
				#2 if (lt) begin
					next_state = S3;
					sel1 = 1; sel2 = 0; sel_in = 1;
				end
				else if (gt) begin
					next_state = S4;
					sel1 = 0; sel2 = 1; LdA = 1; LdB = 0;
				end
				else begin
					next_state = S5;
					done = 1; LdA = 0; LdB = 0;
				end
			end
			S3: begin
				#2 if (gt) begin
					next_state = S4;
					sel1 = 0; sel2 = 1; LdA = 1; LdB = 0;
				end
				else if (eq) begin
					next_state = S5;
					done = 1; LdA = 0; LdB = 0;
				end
			end
			S4: begin
				#2 if (lt) begin
					next_state = S3;
					sel1 = 1; sel2 = 0; LdA = 0; LdB = 1;
				end
				else if (eq) begin
					next_state = S5;
					done = 1; LdA = 0; LdB = 0;
				end
			end
			S5: begin
				next_state = S5;
			end
			default: begin
				next_state = S0;
				sel1 = 0; sel2 = 0; sel_in = 0; LdA = 0; LdB = 0; done = 0;
			end
		endcase
	end
endmodule
