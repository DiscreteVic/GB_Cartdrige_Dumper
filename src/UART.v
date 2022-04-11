// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V0.1 :| viCppDev			    :| 24/03/2022:| UART only transmit module
// ============================================================================

module UART (input clk, output tx, input [7:0]txData, output portAvailable, input send, output pulse);

	reg [7:0]step;
	reg pAvailable;
	reg txStream;
	reg [7:0]intData;
	reg sendByte;
	//wire pulse;
	
	PulseGenerator pGen(.clk(!clk), .in(send), .out(pulse));


	assign portAvailable = pAvailable;
	assign tx = txStream;

	initial step = 8'HFF; //INITIAL STATUS IS IDLE




	always @(posedge(clk)) begin

		if(pulse == 1'b1 && step == 8'HFF) begin
			step = 8'H00; 
			intData <= txData;
		end

		case (step)
			8'H00: // START BIT
				begin
					pAvailable <= 0;
					txStream <= 0; 
					step <= step + 1;
				end
			8'H09:  // STOP BIT
				begin
					txStream <= 1;
					step = 8'H0A; 
				end
			8'H0A:  // Free port
				begin
					step = 8'HFF; // TO IDLE
					pAvailable <= 1;
				end
			8'HFF: // IDLE
				begin
					txStream <= 1; 
				end
			default: // DATA 
				begin
					txStream <= intData[step-1];
					step <= step + 1;
				end

		endcase
	end
endmodule