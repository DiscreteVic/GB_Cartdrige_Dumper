// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			    :| 31/03/2022:| Pulse generator
// ============================================================================

module PulseGenerator(input clk, input in, output out);

    wire setA, resetA, qA, nqA;
    wire setB, resetB, qB, nqB;
	
    FlipFlopSR ffSRA(.Set(setA), .Reset(resetA), .Qout(qA), .nQout(nqA));
    FlipFlopSR ffSRB(.Set(setB), .Reset(resetB), .Qout(qB), .nQout(nqB));

    assign setB = qA;
    assign resetB = !in;

    assign setA = (clk && in && nqB);
    assign resetA = !clk;

    assign out = qA;

endmodule