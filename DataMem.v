`timescale 1ns / 1ps

module DataMem #(
    parameter ABS = 4
)(
    input               clk, MemWrite, MemRead,
    input       [31:0]  Address, Write_Data,
    output  reg [31:0]  Read_Data
);

            reg [31:0]  Memory [0:(1<<ABS)-1];
    
    always @(posedge clk) begin
        
        if (MemRead) Read_Data <= Memory[Address[ABS-1:0]];
        if (MemWrite) Memory[Address[ABS-1:0]] <= Write_Data;
                
    end

endmodule

