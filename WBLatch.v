module WBLatch(
    input               clk,
    input       [1:0]   WB,
    input       [31:0]  ReadData_in,
    input       [31:0]  ALU_Result_in,
    input       [4:0]   WriteReg_in,

    output  reg         RegWrite,
    output  reg         MemtoReg,
    output  reg [31:0]  ReadData_out,
    output  reg [31:0]  ALU_Result_out,
    output  reg [4:0]   WriteReg_out
);

    always @(posedge clk) begin
        ReadData_out   <= ReadData_in;
        ALU_Result_out <= ALU_Result_in;
        WriteReg_out   <= WriteReg_in;
        MemtoReg       <= WB[0];
        RegWrite       <= WB[1];
    end

endmodule