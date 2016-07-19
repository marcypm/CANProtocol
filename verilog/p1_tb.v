`timescale 1ns/1ps
module main_tb
(
);

reg  clk;
reg  reset;
reg  start;
reg  waitrequest;
wire [31:0] return_val;
wire  finish;


top top_inst (
    .clk (clk),
    .reset (reset),
    .finish (finish),
    .return_val (return_val)
    );

initial
    clk=0;
always @(clk)
    clk <= #10 ~clk;

initial begin
reset <=1;
@(negedge clk);
@(negedge clk);
reset <= 0;
end

always @(finish) begin
    if (finish ==1) begin
        $display("At t=%t clk=%b finish=%b return_value=%d", $time,clk,finish, return_val);
        $display("Cycles: %d", ($time-50)/20);
        $finish;
    end
end

initial begin 
waitrequest <= 1;
@(negedge clk);
@(negedge clk);
waitrequest <=0;
end

endmodule
