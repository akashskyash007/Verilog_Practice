//Detecting Sequence: 101010 (Overlapping Allowed)
module SequenceDetector(clk, rst, in_seq, out_seq);
	input clk, rst, in_seq;
	output reg out_seq;
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;
	reg[0:2] PS, NS;

	always @(posedge clk or posedge rst) begin
		if (rst)
			PS <= S0;
		else
			PS <= NS;
	end

	always @(PS, in_seq) begin
		case (PS)
			S0: begin
				NS = in_seq?S1:S0;
				out_seq = 0;
			end
			S1: begin
				NS = in_seq?S1:S2;
				out_seq = 0;
			end
			S2: begin
				NS = in_seq?S3:S0;
				out_seq = 0;
			end
			S3: begin
				NS = in_seq?S1:S4;
				out_seq = 0;
			end
			S4: begin
				NS = in_seq?S5:S0;
				out_seq = 0;
			end
			S5: begin
				NS = in_seq?S1:S4;
				out_seq = in_seq?0:1;
			end
			default: begin
				NS = S0;
				out_seq = 0;
			end
		endcase
	end
endmodule
