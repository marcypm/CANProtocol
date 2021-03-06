//testbench for the sha256 module
module tb_sha256();

reg clk;
reg rst;
wire [9:0] addr;
wire [7:0] data;
reg [7:0] datareg;
reg [7:0] dataLen;
reg padStart;
wire padFinish;

pad pad_inst(
    .clk(clk),
    .rst(rst),
    .memAddrLine(addr),
    .memDataLine(data),
    .dataLen(dataLen),
    .start(padStart),
    .finish(padFinish)
);

reg chipSel;
reg wriEn;
reg outEn;
assign dataReg = data;

ram #(8,10,512,30)
ram_inst(
    .clk(clk),
    .addr(addr),
    .chipSel(chipSel),
    .wriEn(wriEn),
    .outEn(outEn),
    .data(data)
);

reg [9:0]addrToBlock;
reg [9:0]addrToDigest;
reg shaStart;
wire shaFinish;
wire sampleSHA;
wire rp, wp, writeData;

sha256 #(10,8,32,64)
sha256_inst(
    .clk(clk),
    .rst(rst),
    .addrToBlock(addrToBlock),
    .addrToDigest(addrToDigest),
    .addr(addr),
    .data(data),
    .readPhase(rp),
    .writePhase(wp),
    .start(shaStart),
    .finish(shaFinish), 
    .writeData(writeData)
);

reg resetFifo, wr, rd;
wire full, empty;
reg [7:0] inputbits;
wire [7:0] outputbits;

fifo buffer(
.clock (clk),
.reset (resetFifo),
.wr (wr),
.rd (rd),
.din(data),
.empty(empty),
.full(full),
.dout(outputbits)
);

initial
    clk=0;
always @(clk)
    clk <= #10 ~clk;

always @(posedge clk) 
    $display("DATA:  %h", data);

always @(posedge data)
    $display("NEW DATA===>:  %h", data);


initial begin
    dataLen <= 8'd30;
    padStart <= 0;
    shaStart <=0;
    rst <= 1;
    chipSel <=1;
    wriEn <= 0;
    outEn <=0;
    addrToBlock<=0;
    addrToDigest<= 10'd64;

    resetFifo <= 1;
    wr <= 0;
    rd <= 0; //reset is on for buffer and in DO nothing state

@(negedge clk);
    rst <= 0;
    padStart <= 1;
    wriEn <= 1;
end

always @(posedge padFinish) begin
    shaStart<=1;
    $display("DATA decimal:  %d", data);
end

always @(posedge writeData) begin
    resetFifo <= 0;    
    wr <= 1;
    rd <= 0;
end

always @(posedge rp) begin
    if(!rst) begin
        outEn <= 1;
        wriEn <= 0;
    end
end
always @(posedge wp) begin
    if(!rst) begin
        outEn <= 0;
        wriEn <= 1;

	//resetFifo <= 0; //toggle buffer reset off
 	//wr <= 1;//buffer in write mode
       // rd <= 0;
    end
end
 
always @(posedge shaFinish) begin //need to add the data to a line to feed to CANBus crc_out
    wr <= 0;
    rd <= 0; // buffer in do nothing mode
    $display("At t=%t clk=%b ", $time,clk);
    $display("Cycles: %d", ($time-50)/20);
    $display("DATA:  %d", data);
    #800
    wr <= 0;
    rd <= 1; //buffer in read mode
    #1000
    $stop;
end

endmodule
