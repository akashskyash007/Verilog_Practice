module mux16to1_tb;
	reg[15:0] inp;
	reg[3:0] sel;
	wire out;
	
	mux16to1 mymux(.inp(inp), .sel(sel), .out(out));
	
	initial begin
		$dumpfile("mux16.vcd");
		$dumpvars(0, mux16to1_tb);
		$monitor($time, ": Input = %16h, Select = %4h, Output = %b", inp, sel, out);
		#5 inp = 16'h3f0a; sel = 4'h0;
		#5 sel = 4'h1;
		#5 sel = 4'h6;
		#5 sel = 4'hc;
		#5 $finish;
	end
endmodule
