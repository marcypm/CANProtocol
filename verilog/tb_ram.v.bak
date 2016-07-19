//test bed for ram
module tb_ram();

reg clk;
reg [15:0] addr;
reg chipSel;
reg wriEn;
reg outEn;
wire [7:0]data;

ram #(8,9,512)
ram_inst(
    .clk(clk),
    .addr(addr),
    .chipSel(chipSel),
    .wriEn(wriEn),
    .outEn(outEn),
    .data(data)
);

//internals
reg [7:0] dataIn;
reg [7:0] dataOut;

//behavior
initial
    clk=0;
always @(clk)
    clk <= #10 ~clk;

assign data = (wriEn)? dataIn:8'bz;

initial begin
dataOut <= 8'bz;
addr <= 0;
chipSel <= 1;
wriEn <= 0;
outEn <= 1;
end

integer count;
initial 
    count =0;
always @(posedge clk) begin
    addr <= count;
    $display("%d",data);
    count = count +1;
end

endmodule
