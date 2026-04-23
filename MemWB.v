module MemWB(
    input               clk, MemWrite, MemRead, m_ctlout, Zero,
    input       [1:0]   WB,
    input       [4:0]   WriteReg_in,
    input       [31:0]  ALU_Result,
    input       [31:0]  ReadData2,
    output      [31:0]  WriteData,
    output      [4:0]   WriteReg_out,
    output              RegWrite_out, MemtoReg_out, PCSrc
);

    wire        [31:0] Read_Data;
    wire        [31:0] ReadData_wb;
    wire        [31:0] ALU_wb;

    DataMem #(
        .ABS(8)
    ) dm (
        .clk(clk),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .Address(ALU_Result),
        .Write_Data(ReadData2),
        .Read_Data(Read_Data)
    );

    WBLatch memwb (
        .clk(clk),
        .WB(WB),
        .ReadData_in(Read_Data),
        .ALU_Result_in(ALU_Result),
        .WriteReg_in(WriteReg_in),
        .RegWrite(RegWrite_out),
        .MemtoReg(MemtoReg_out),
        .ReadData_out(ReadData_wb),
        .ALU_Result_out(ALU_wb),
        .WriteReg_out(WriteReg_out)
    );

    WBMux wbmux (
        .ALU_Result(ALU_wb),
        .MemData(ReadData_wb),
        .MemtoReg(MemtoReg_out),
        .WriteData(WriteData)
    );

    assign PCSrc = m_ctlout & Zero;

endmodule