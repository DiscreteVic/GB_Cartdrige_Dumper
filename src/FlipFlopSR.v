// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			    :| 31/03/2022:| SR Flip Flop asynchronous
// ============================================================================

module FlipFlopSR(input Set, input Reset, output Qout, output nQout);

    assign nQout =!(Qout && !Reset);
    assign Qout =!(nQout && !Set);

endmodule