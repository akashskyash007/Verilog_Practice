module SerialAdder(clk, rst, in_seq1, in_seq2, out_seq);
	input clk, rst, in_seq1, in_seq2;
	output reg out_seq;
	parameter ZERO = 0, ONE = 1;
	reg curr_carry, next_carry;

	always @(posedge clk or posedge rst) begin
		if (rst)
			curr_carry <= 0;
		else
			curr_carry <= next_carry;
	end

	always @(curr_carry or in_seq1 or in_seq2) begin
		case (curr_carry)
			ZERO: begin
				next_carry = (in_seq1 & in_seq2)?1:0;
				out_seq = (in_seq1 ^ in_seq2)?1:0;
			end
			ONE: begin
				next_carry = (in_seq1 | in_seq2)?1:0;
				out_seq = (in_seq1 ^ in_seq2)?0:1;
			end
			default: begin
				next_carry = 0;
				out_seq = 0;
			end
		endcase
	end
endmodule


