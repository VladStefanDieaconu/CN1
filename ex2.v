module ex2(
    output  reg AN0,
    output  reg AN1,
    output  reg AN2,
    output  reg AN3,
    output  reg CA,
    output  reg CB,
    output  reg CC,
    output  reg CD,
    output  reg CE,
    output  reg CF,
    output  reg CG,
    output  reg DP,
    input       reset,
    input       clk
    );

    localparam STATE_0 = 0;
    localparam STATE_1 = 1;
    localparam STATE_2 = 2;
    localparam STATE_3 = 3;

    reg [1:0]   currentState;
    reg [1:0]   nextState;

    reg [31:0]  delay;

	task zero;
	input [2:0]cifra;
	  output  reg AN0,
       AN1,
      AN2,
       AN3,
       CA,
       CB,
       CC,
       CD,
       CE,
       CF,
       CG,
       DP;
	 begin
	 case(cifra) 
	0: begin
		AN0 = 0;
		AN1 = 1;
		AN2 = 1;
		AN3 = 1;
		end
	1: begin
		AN0 = 1;
		AN1 = 0;
		AN2 = 1;
		AN3 = 1;
		end
	2: begin
		AN0 = 1;
		AN1 = 1;
		AN2 = 0;
		AN3 = 1;
		end
	3: begin
		AN0 = 1;
		AN1 = 1;
		AN2 = 1;
		AN3 = 0;
		end
		endcase

	
		CA = 0;
		CB = 0;
		CC = 0;
		CD = 0;
		CE = 0;
		CF = 0;
		CG = 1;
		DP = 1;
	 end
	 endtask
	 
	 task unu;
	input [2:0]cifra;
	  output  reg AN0,
       AN1,
       AN2,
       AN3,
       CA,
       CB,
       CC,
       CD,
       CE,
       CF,
       CG,
       DP;
	 begin
	 case(cifra) 
	0: begin
		AN0 = 0;
		AN1 = 1;
		AN2 = 1;
		AN3 = 1;
		end
	1: begin
		AN0 = 1;
		AN1 = 0;
		AN2 = 1;
		AN3 = 1;
		end
	2: begin
		AN0 = 1;
		AN1 = 1;
		AN2 = 0;
		AN3 = 1;
		end
	3: begin
		AN0 = 1;
		AN1 = 1;
		AN2 = 1;
		AN3 = 0;
		end
		endcase
		
	
		CA = 1;
		CB = 0;
		CC = 0;
		CD = 1;
		CE = 1;
		CF = 1;
		CG = 1;
		DP = 1;
	 end
	 endtask
	 
	 task doi;
	input [2:0]cifra;
	  output  reg AN0,
       AN1,
       AN2,
       AN3,
       CA,
       CB,
       CC,
       CD,
       CE,
       CF,
       CG,
       DP;
	 begin
	 case(cifra) 
	0: begin
		AN0 = 0;
		AN1 = 1;
		AN2 = 1;
		AN3 = 1;
		end
	1: begin
		AN0 = 1;
		AN1 = 0;
		AN2 = 1;
		AN3 = 1;
		end
	2: begin
		AN0 = 1;
		AN1 = 1;
		AN2 = 0;
		AN3 = 1;
		end
	3: begin
		AN0 = 1;
		AN1 = 1;
		AN2 = 1;
		AN3 = 0;
		end
		endcase
		
	
		CA = 0;
		CB = 0;
		CC = 1;
		CD = 0;
		CE = 0;
		CF = 1;
		CG = 0;
		DP = 1;
	 end
	 endtask
	 
	 task trei;
	input [2:0]cifra;
	  output  reg AN0,
       AN1,
       AN2,
       AN3,
       CA,
       CB,
       CC,
       CD,
      CE,
       CF,
       CG,
       DP;
	 begin
	 case(cifra) 
	0: begin
		AN0 = 0;
		AN1 = 1;
		AN2 = 1;
		AN3 = 1;
		end
	1: begin
		AN0 = 1;
		AN1 = 0;
		AN2 = 1;
		AN3 = 1;
		end
	2: begin
		AN0 = 1;
		AN1 = 1;
		AN2 = 0;
		AN3 = 1;
		end
	3: begin
		AN0 = 1;
		AN1 = 1;
		AN2 = 1;
		AN3 = 0;
		end
		endcase
		
	
		CA = 0;
		CB = 0;
		CC = 0;
		CD = 0;
		CE = 1;
		CF = 1;
		CG = 0;
		DP = 1;
	 end
	 endtask
	
    always @(posedge clk) begin
        if (reset) begin
            currentState <= STATE_0;
            delay <= 0;
        end else begin
            // TODO: Intarzierea schimbarii de stare.
				delay <= delay+1;
				if (delay > 100000) begin
					currentState <= nextState;
					delay <= 0;
				end
        end
    end

    always @(*) begin
        case (currentState)
            // TODO
			STATE_0: begin
			zero(3, AN0, AN1, AN2,AN3, CA,CB,CC, CD, CE,CF,CG,DP);
			nextState <= STATE_1;
			end
			
			STATE_1: begin
			unu(2, AN0, AN1, AN2,AN3, CA,CB,CC, CD, CE,CF,CG,DP);
			nextState <= STATE_2;

			end
			
			STATE_2: begin
			doi(1, AN0, AN1, AN2,AN3, CA,CB,CC, CD, CE,CF,CG,DP);
			nextState <= STATE_3;

			end
			
			STATE_3: begin
			trei(0, AN0, AN1, AN2,AN3, CA,CB,CC, CD, CE,CF,CG,DP);
			nextState <= STATE_0;

			end
        endcase
    end
endmodule
