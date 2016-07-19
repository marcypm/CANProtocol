//constants rom
module constRom(
    addr,
    read,
    data
);

//---------INPUTS
input read;
input [5:0]addr;
output [31:0]data;

//INTERNALS
reg [31:0] mem [0:63];

initial begin
    $readmemh("memory.list",mem);
end

assign data = (read)?mem[addr]:32'bz;

endmodule
