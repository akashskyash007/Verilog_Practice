//Detected Sequence: 0110 (Overlapping patterns are also detected)
module SequenceDetector(clk, rst, in_seq, out_seq);
	input clk, in_seq, rst;
	output reg out_seq;
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
	reg[0:1] NS, PS;
	
	initial begin
		$monitor($time, ": Next State = %b, Present State = %b", NS, PS);
	end
	
	always @(posedge clk or posedge rst) begin
		if (rst)
			PS <= S0;
		else
			PS <= NS;
	end
	
	always @(PS, in_seq) begin
		case (PS)
			S0: begin
				NS = in_seq?S0:S1;
				out_seq = 0;
			end
			S1: begin
				NS = in_seq?S2:S1;
				out_seq = 0;
			end
			S2: begin
				NS = in_seq?S3:S1;
				out_seq = 0;
			end
			S3: begin
				NS = in_seq?S0:S1;
				out_seq = in_seq?0:1;
			end
			default: begin
				NS = S0;
				out_seq = 0;
			end
		endcase
	end
endmodule
