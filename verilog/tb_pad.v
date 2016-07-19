//testbench for padding block
module tb_pad();

reg clk;
reg rst;
wire [9:0] addr;
wire [7:0] data;
reg [7:0] dataLen;
reg start;
wire finish;

pad pad_inst(
    .clk(clk),
    .rst(rst),
    .memAddrLine(addr),
    .memDataLine(data),
    .dataLen(dataLen),
    .start(start),
    .finish(finish)
);

reg chipSel;
reg wriEn;
reg outEn;

ram #(8,10,512,30)
ram_inst(
    .clk(clk),
    .addr(addr),
    .chipSel(chipSel),
    .wriEn(wriEn),
    .outEn(outEn),
    .data(data)
);

initial
    clk=0;
always @(clk)
    clk <= #10 ~clk;

initial begin
    dataLen <= 8'd30;
    start <= 0;
    rst <= 1;
    chipSel <=1;
    wriEn <= 0;
    outEn <=0;
@(negedge clk);
    rst <= 0;
    start <= 1;
    wriEn <= 1;
end

endmodule
