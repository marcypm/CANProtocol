//single port ram design
module ram(
    clk,
    addr,
    chipSel,
    wriEn,
    outEn,
    data
);

//constants
parameter DATA_WIDTH=8;
parameter ADDR_WIDTH=10;
parameter RAM_DEPTH=1<<ADDR_WIDTH;
parameter MSGLEN=5;

//inputs
input clk;
input [ADDR_WIDTH-1:0] addr;
input chipSel;  
input wriEn;
input outEn;

//outputs
inout [DATA_WIDTH-1:0] data;

//internal variables
reg [DATA_WIDTH-1:0] data_out;
reg [DATA_WIDTH-1:0] mem[0:RAM_DEPTH-1];
reg [ADDR_WIDTH-1:0] k;
//behavior
assign data = (outEn)? data_out: 8'hzz;

//initialize ram
initial begin
	 $display("Initializing RAM");
    for (k=0;k<5;k=k+1) begin
        mem[k]=k;
$display("Initializing Depth");
    end

    for (;k<RAM_DEPTH;k=k+1) begin
$display("Initializing Depth  %d", k);
        mem[k]=0;
    end

$display("END");
    data_out <= 8'hzz;
end 

//mem write
always @(posedge clk)
begin: MEM_WRITE
    if(chipSel && wriEn) begin
        mem[addr] = data;
    end
end

//mem Read
always @(posedge clk)
begin: MEM_READ
    if(chipSel && outEn && !wriEn) begin
        data_out = mem[addr];
    end
end

endmodule
