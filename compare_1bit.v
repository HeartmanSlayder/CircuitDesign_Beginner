module compare_1bit(a, b, signal, a_greater_b, a_equal_b);
	input 	a, b, signal;
	output 	a_greater_b, a_equal_b;
	
	assign	a_greater_b = signal & (a & ~b);
	assign	a_equal_b	= signal & (a ~^ b);
	
endmodule 