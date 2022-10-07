//Define 16 bit comparator
module comparator16(eqz, data_in);
	input[15:0] data_in;
	output eqz;

	assign eqz = (data_in == 0);
endmodule
