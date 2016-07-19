//test rom
module tb_rom();
wire [31:0]data;
reg [5:0]addr;
reg read;

constRom rom_inst(
    .addr(addr),
    .read(read),
    .data(data));

reg clk;

initial 
    clk=0;
always @(clk)
    clk <= #10 ~clk;

initial begin
addr <= 0;
read <= 1;
$display("%h",data);
@(negedge clk);
addr <= 1;
$display("%h",data);
@(negedge clk);
addr <= 2;
$display("%h",data);
@(negedge clk);
addr <= 3;
$display("%h",data);
$finish;
end


endmodule
