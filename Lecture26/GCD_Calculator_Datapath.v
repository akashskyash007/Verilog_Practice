module DATAPATH(lt, gt, eq, data_in, LdA, LdB, sel1, sel2, sel_in, clk);
	input[15:0] data_in;
	input LdA, LdB, sel1, sel2, sel_in, clk;
	output lt, gt, eq;
	wire[15:0] Bus, Aout, Bout, sub_in1, sub_in2, sub_out;
	
	PIPO A(Aout, Bus, LdA, clk);
	PIPO B(Bout, Bus, LdB, clk);
	MUX21 MUX1(sub_in1, Aout, Bout, sel1);
	MUX21 MUX2(sub_in2, Aout, Bout, sel2);
	MUX21 MUX_IN(Bus, data_in, sub_out, sel_in);
	SUBTRACTOR SUB(sub_out, sub_in1, sub_in2);
	COMPARATOR COMP(lt, gt, eq, Aout, Bout); 
endmodule
