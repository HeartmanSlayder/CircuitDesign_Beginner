module compare_4bit (a, b, a_greater_b_out, a_equal_b_out);
	input 	[3:0] a,b;
	output 	a_greater_b_out, a_equal_b_out;
	
	wire		a_greater_b_0, a_greater_b_1, a_greater_b_2, a_greater_b_3;
	wire 		a_equal_b_1, a_equal_b_2, a_equal_b_3;
	
	compare_1bit U3(.a(a[3]), .b(b[3]), .signal(1), .a_greater_b(a_greater_b_3), .a_equal_b(a_equal_b_3));
	compare_1bit U2(.a(a[2]), .b(b[2]), .signal(a_equal_b_3), .a_greater_b(a_greater_b_2), .a_equal_b(a_equal_b_2));
	compare_1bit U1(.a(a[1]), .b(b[1]), .signal(a_equal_b_2), .a_greater_b(a_greater_b_1), .a_equal_b(a_equal_b_1));
	compare_1bit U0(.a(a[0]), .b(b[0]), .signal(a_equal_b_1), .a_greater_b(a_greater_b_0), .a_equal_b(a_equal_b_out));
	
	assign	a_greater_b_out = (a_greater_b_0 | a_greater_b_1 | a_greater_b_2 | a_greater_b_3) ^ a[3] ^ b[3];
	
endmodule 