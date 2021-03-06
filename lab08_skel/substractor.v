`include "defines.vh"
module subtractor(
        output  [7: 0]  D,
        input   [3: 0]  A,
        input   [3: 0]  B
    );
	
    wire [3:0] not_B;
    wire [3:0] neg_B;

	// TODO: implement a subtractor
	assign not_B = ~B;
	adder ad1(neg_B, not_B, 1);
	adder ad2(D, A, neg_B);
endmodule
