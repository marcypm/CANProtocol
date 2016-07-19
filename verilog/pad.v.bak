//padding module
module pad(
    clk,
    rst,
    memAddrLine,
    memDataLine,
    dataLen,
    start,
    finish
);
parameter DATA_WIDTH=8;
parameter ADDR_WIDTH=10;
parameter BLOCK_SIZE=64;//64 BYTES IN 512 BITS
//CONNETIONS
input clk,rst;
input [DATA_WIDTH-1:0] dataLen;
output [ADDR_WIDTH-1:0] memAddrLine;
inout [DATA_WIDTH-1:0]memDataLine;

input start;
output finish;
reg finish;

//--------INT
reg write;
reg [DATA_WIDTH-1:0] dataOut;
reg [DATA_WIDTH-1:0] ctr;
reg [ADDR_WIDTH-1:0] addrOut;

assign memDataLine = (write)? dataOut:8'bz;
assign memAddrLine = (write)? addrOut:10'bz;

always @(posedge clk) begin
    if(rst) begin
        finish<=0;
        addrOut<=0;
        ctr = 0;
        write =0;
    end else if(start && !finish) begin
        addrOut<=dataLen+ctr;
        write <= 1;
        if(dataLen+ctr >= BLOCK_SIZE) begin
            finish <= 1;
            write = 0;
        end else if(dataLen+ctr == BLOCK_SIZE-1) begin
            dataOut <= dataLen*8;
        end else if(ctr ==0) begin
            dataOut <= 8'h80;
        end else begin
            dataOut <= 8'h00;
        end
        ctr = ctr+1;
    end else begin
        write <=0;
    end
end

endmodule
