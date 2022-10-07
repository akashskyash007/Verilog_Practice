//Main Module for Data Path
module multiplier_data_path(eqz, data_in, clk, ldA, ldB, decB, ldP, clrP);
	input[15:0] data_in;
	input clk, ldA, ldB, decB, ldP, clrP;
	output eqz;
	wire[15:0] X, Y, Z, Bus, Bout;

	assign Bus = data_in;

	//Module Instantiations
	pipo1 A(X, Bus, ldA, clk);
	downcounter B(Bout, Bus, ldB, decB, clk);
	pipo2 P(Y, Z, ldP, clrP, clk);
	adder16 ADD(Z, X, Y);
	comparator16 COMP(eqz, Bout);
endmodule
