module WBMux(
    input  [31:0] ALU_Result,
    input  [31:0] MemData,
    input         MemtoReg,
    output [31:0] WriteData
);

    assign WriteData = (MemtoReg) ? MemData : ALU_Result;

endmodule 