module top(
    clk,
    reset,
    start,
    waitrequest,
    finish,
    return_val
);

input clk, reset,start,waitrequest;
output finish;
output return_val;

reg [31:0] return_val;
reg finish;
reg [3:0]ctr;

//memory with padded data
reg [31:0] ram[0:1023];


always @ (posedge clk )
    if(reset) begin
        return_val<= 0;
        ctr <= 0;
        finish <=0;
    end else if (ctr>=10) begin
        return_val <= 32;
        finish <= 1;
    end else begin
        ctr <= ctr +1;
    end

endmodule
