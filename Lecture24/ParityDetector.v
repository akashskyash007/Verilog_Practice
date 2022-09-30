module ParityDetector(clk, in_seq, out_seq);
	input clk, in_seq;
	output reg out_seq;
	reg state;
	parameter EVEN = 0, ODD= 1;

	always @(posedge clk)
		case (state)
			EVEN: state <= in_seq?ODD:EVEN;
			ODD: state <= in_seq?EVEN:ODD;
			default: state <= EVEN;
		endcase
		always @(state) begin
			case(state)
				EVEN: out_seq = 0;
				ODD: out_seq = 1;
			endcase
		end
endmodule
