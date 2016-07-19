//sha 256 module
module sha256(
    clk,
    rst,
    addrToBlock,
    addrToDigest,
    addr,
    data,
    readPhase,
    writePhase,
    start,
    finish
);
parameter ADDR_WIDTH=8;
parameter DATA_WIDTH=8;
parameter WORD_WIDTH=32;
parameter BLOK_WIDTH=64;

input clk, rst,start;
output finish,readPhase,writePhase;
reg finish, readPhase, writePhase;

input [ADDR_WIDTH-1:0]addrToBlock;
input [ADDR_WIDTH-1:0]addrToDigest;
inout [ADDR_WIDTH-1:0]addr;
inout [DATA_WIDTH-1:0]data;

//control variables
reg writeAddr;
reg writeData;
reg [ADDR_WIDTH-1:0]addrOut;
reg [DATA_WIDTH-1:0]dataOut;

assign addr = (writeAddr)? addrOut: 10'bz;
assign data = (writeData)? dataOut: 8'bz;

reg [WORD_WIDTH-1:0]digest[0:7];
reg [WORD_WIDTH-1:0]tdigest[0:7];
reg [WORD_WIDTH-1:0]T1;
reg [WORD_WIDTH-1:0]T2;
reg [WORD_WIDTH-1:0]W[0:BLOK_WIDTH-1];

//INTERNALS
reg [31:0] k [0:BLOK_WIDTH-1];
reg [31:0] temp;
reg [31:0] preComp; //wt kt precomputations in inner loop
reg [31:0] fifo [0:15];//fifo for pipelining data initilaizatoin
reg [31:0] WtPre[0:2]; //pipeline wt coputations

//program control
reg [DATA_WIDTH:0]t;
reg [DATA_WIDTH:0]tm;
reg [DATA_WIDTH:0]ctr;

//---------------------------functions-------------------//


//--------------------------behavior---------------------//
initial begin
    $readmemh("memory.list",k);
end

always @(posedge clk) begin: mainblock
    if(rst) begin
        digest[0] = 32'h6a09e667;
        digest[1] = 32'hbb67ae85;
        digest[2] = 32'h3c6ef372;
        digest[3] = 32'ha54ff53a;
        digest[4] = 32'h510e527f;
        digest[5] = 32'h9b05688c;
        digest[6] = 32'h1f83d9ab;
        digest[7] = 32'h5be0cd19;

        tdigest[0] = digest[0];
        tdigest[1] = digest[1];
        tdigest[2] = digest[2];
        tdigest[3] = digest[3];
        tdigest[4] = digest[4];
        tdigest[5] = digest[5];
        tdigest[6] = digest[6];
        tdigest[7] = digest[7];

        T1 = 0;
        T2 = 0;
        
        finish = 0;
        writeAddr =0;
        writeData =0;
        tm =0;
        temp =0;
        preComp =0;
        readPhase =0;
        writePhase=0;
        for(t=0;t<BLOK_WIDTH;t=t+1) begin
            W[t] = 0;
        end
        t =0;
        ctr =0;
    end else if (start && !finish) begin
        if(ctr<2) begin
            writeAddr = 1;
            readPhase = 1;
            addrOut = addrToBlock+t*4+tm;
            ctr=ctr+1;
        end else if(ctr<3) begin
            if(t<16) begin
                temp = data;
                temp = temp << (24-tm*8);
                W[t] = W[t] | temp;
                writeAddr = 1;
                addrOut = addrToBlock+t*4+tm;
                tm = tm+1;
                if(tm==4) begin
                    fifo[0] = W[t];
                    fifo[1] = fifo[0];
                    fifo[2] = fifo[1];
                    fifo[3] = fifo[2];
                    fifo[4] = fifo[3];
                    fifo[5] = fifo[4];
                    fifo[6] = fifo[5];
                    fifo[7] = fifo[6];
                    fifo[8] = fifo[7];
                    fifo[9] = fifo[8];
                    fifo[10] = fifo[9];
                    fifo[11] = fifo[10];
                    fifo[12] = fifo[11];
                    fifo[13] = fifo[12];
                    fifo[14] = fifo[13];
                    fifo[15] = fifo[14];
                    WtPre[0] = SIG1(fifo[1])+fifo[8];
                    WtPre[1] = SIG0(fifo[14])+WtPre[0];
                    WtPre[2] = fifo[15]+WtPre[1];
                    t=t+1;
                    tm= 0;
                end
            end else if( t<BLOK_WIDTH) begin
                fifo[0] = W[t];
                fifo[1] = fifo[0];
                fifo[2] = fifo[1];
                fifo[3] = fifo[2];
                fifo[4] = fifo[3];
                fifo[5] = fifo[4];
                fifo[6] = fifo[5];
                fifo[7] = fifo[6];
                fifo[8] = fifo[7];
                fifo[9] = fifo[8];
                fifo[10] = fifo[9];
                fifo[11] = fifo[10];
                fifo[12] = fifo[11];
                fifo[13] = fifo[12];
                fifo[14] = fifo[13];
                fifo[15] = fifo[14];
                WtPre[0] = SIG1(fifo[1])+fifo[8];
                WtPre[1] = SIG0(fifo[14])+WtPre[0];
                WtPre[2] = fifo[15]+WtPre[1];
                W[t] = fifo[15]+WtPre[1];
                t=t+1;
                writeAddr = 0;
            end else begin
                ctr = ctr+1;
            end
        end else if(ctr<4) begin
            //inner loop
            readPhase = 0;
            writePhase =1;
            ctr = ctr+1;
            t=0;
            preComp = k[t]+W[t]+tdigest[7];
        end else if(ctr<5 && t< BLOK_WIDTH) begin
            T1 = EP1(tdigest[4])+CH(tdigest[4],tdigest[5],tdigest[6])+preComp;
            T2 = EP0(tdigest[0]) + MAJ(tdigest[0],tdigest[1],tdigest[2]);
            tdigest[7]=tdigest[6];
            tdigest[6]=tdigest[5];
            tdigest[5]=tdigest[4];
            tdigest[4]=tdigest[3]+T1;
            tdigest[3]=tdigest[2];
            tdigest[2]=tdigest[1];
            tdigest[1]=tdigest[0];
            tdigest[0]=T1+T2;
            preComp = k[t+1]+W[t+1]+tdigest[6];
            t=t+1;
            T1 = EP1(tdigest[4])+CH(tdigest[4],tdigest[5],tdigest[6])+preComp;
            T2 = EP0(tdigest[0]) + MAJ(tdigest[0],tdigest[1],tdigest[2]);
            tdigest[7]=tdigest[6];
            tdigest[6]=tdigest[5];
            tdigest[5]=tdigest[4];
            tdigest[4]=tdigest[3]+T1;
            tdigest[3]=tdigest[2];
            tdigest[2]=tdigest[1];
            tdigest[1]=tdigest[0];
            tdigest[0]=T1+T2;
            preComp = k[t+1]+W[t+1]+tdigest[6];
            t=t+1;
        end else if(ctr<5) begin
            digest[0]=tdigest[0]+digest[0];
            digest[1]=tdigest[1]+digest[1];
            digest[2]=tdigest[2]+digest[2];
            digest[3]=tdigest[3]+digest[3];
            digest[4]=tdigest[4]+digest[4];
            digest[5]=tdigest[5]+digest[5];
            digest[6]=tdigest[6]+digest[6];
            digest[7]=tdigest[7]+digest[7];
            t=0;
            ctr = ctr+1;
        end else if(ctr<6)begin
            //write to memory
            if(t<8)begin
                writeAddr=1;
                writeData=1;
                addrOut= addrToDigest+t;
                dataOut =digest[t];
                t=t+1;
            end else begin
                writeAddr=0;
                writeData=0;
                finish=1;
                ctr = ctr +1;
            end
        end
    end
end

function ROTLEFT; 
    input a,b;
    begin
        ROTLEFT = (((a) << (b)) | ((a) >> (32-(b))));
    end
endfunction

function ROTRIGHT; 
    input a,b;
    begin
        ROTRIGHT = (((a) >> (b)) | ((a) << (32-(b))));
    end
endfunction

function CH; 
    input x,y,z;
    begin
        CH = (((x) & (y)) ^ (~(x) & (z)));
    end
endfunction

function MAJ; 
    input x,y,z;
    begin
         MAJ = (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)));
    end
endfunction

function EP0; 
    input x;
    begin
        EP0 = (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22));
    end
endfunction

function EP1; 
    input x;
    begin
        EP1 = (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25));
    end
endfunction
function SIG0; 
    input x;
    begin
        SIG0 = (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) >> 3));
    end
endfunction
function SIG1; 
    input x;
    begin
        SIG1 = (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) >> 10));
    end
endfunction
endmodule
