extern void __legup_label(char* label);
/*
 * Author: Shabbir
 * Desc:   The implementation of the sha256 algorithm
 */


#include "stdint.h"
#include <stdio.h>

// CONSTANTS
#define MAXBLOCKS 3
#define BLOCKSIZE 64 //64 Bytes in 512 bits
#define DIGESTSIZE 8 // 8 words = 256 bits

typedef uint8_t BYTE;
typedef uint32_t WORD;
typedef uint64_t LONG;

static const WORD k[64] = {
        0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
        0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
        0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
        0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
        0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
        0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
        0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
        0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
};

//HELPER FUNCTIONS
/* macros taken from https://github.com/B-Con/crypto-algorithms/blob/master/sha256.c */
#define ROTLEFT(a,b) (((a) << (b)) | ((a) >> (32-(b))))
#define ROTRIGHT(a,b) (((a) >> (b)) | ((a) << (32-(b))))

#define CH(x,y,z) (((x) & (y)) ^ (~(x) & (z)))
#define MAJ(x,y,z) (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
#define EP0(x) (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22))
#define EP1(x) (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25))
#define SIG0(x) (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) >> 3))
#define SIG1(x) (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) >> 10))
/* end of macros */

int pad (BYTE* data, BYTE* msg, LONG msgLen){

    //put msg in buffer
    int i=0;
    for(;i<msgLen;i++){
        data[i] = msg[i];
    }

    //append pad
    data[i] = 0x80;
    i++;
    
    //add extrapad
   for(;i%BLOCKSIZE!=0;i++){
        	data[i]=0x00;
    	}

    //convert to from bytes to bits
    msgLen *= 8;
    //append size
    data[i-4] = (msgLen>>24) & 0xFFFF;
    data[i-3] = (msgLen>>16) & 0xFFFF;
    data[i-2] = (msgLen>>8) & 0xFFFF;
    data[i-1] = msgLen & 0xFFFF;

    i=i-1;   
 
    int numBlocks = i/BLOCKSIZE;
    return numBlocks;
}

void outerloop(WORD* digest, BYTE* data, int numBlocks){

    //init variables
    WORD h0,h1,h2,h3,h4,h5,h6,h7;
    WORD a,b,c,d,e,f,g,h;
    BYTE* Mi = data;

    h0 = 0x6a09e667;
    h1 = 0xbb67ae85;
    h2 = 0x3c6ef372;
    h3 = 0xa54ff53a;
    h4 = 0x510e527f;
    h5 = 0x9b05688c;
    h6 = 0x1f83d9ab;
    h7 = 0x5be0cd19;

   for(int i=0;i<numBlocks;i++){
  
        //generate W vector
        WORD W[64];
        int t=0;

        for(t=0;t<16;t++){
            W[t] = (Mi[4*t]<<24) + (Mi[4*t+1]<<16) + (Mi[4*t+2]<<8) + Mi[4*t+3];
            //printf("%04x\n",W[t]);
        }
        for(;t<64;t++){
            W[t] = SIG1(W[t-2])+W[t-7]+SIG0(W[t-15])+W[t-16] & 0xFFFFFFFF; 
            //printf("%04x\n",W[t]);
        }
    
        //init temp vars
        a = h0;
        b = h1;
        c = h2;
        d = h3;
        e = h4;
        f = h5;
        g = h6;
        h = h7;

        WORD T1,T2;
	
	#pragma omp parallel num_threads (64) private (t)
        for(t=0; t<64; t++){
            T1 = h+  EP1(e) + CH(e,f,g) + k[t] + W[t];
            T2 = EP0(a) + MAJ(a,b,c);
            h=g;
            g=f;
            f=e;
            e=d+T1;
            d=c;
            c=b;
            b=a;
            a= T1+T2;
        }

        h0 = a+h0;
        h1 = b+h1;
        h2 = c+h2;
        h3 = d+h3;
        h4 = e+h4;
        h5 = f+h5;
        h6 = g+h6;
        h7 = h+h7;

        //update block size
        Mi = Mi+BLOCKSIZE;
    }

    //update digest;
    digest[0] = h0;
    digest[1] = h1;
    digest[2] = h2;
    digest[3] = h3;
    digest[4] = h4;
    digest[5] = h5;
    digest[6] = h6;
    digest[7] = h7;

}

BYTE gData[MAXBLOCKS*BLOCKSIZE];
WORD gDigest[DIGESTSIZE];

//HASHING FUNCTION
void SHA256(BYTE* msg, LONG msgLen){

    //Pad the msg
    int numBlocks = pad(gData,msg,msgLen);
    
    //printf("padded to %d blocks\n", numBlocks);
    outerloop(gDigest,gData,numBlocks);

}


int main()
{
    BYTE msg[64] = "the quick brown fox jumped over the lazy dog12345678901234567890";
    LONG msgLen = 64;


    SHA256(msg,msgLen);

/*    
    printf("\n");
    for(int i=0; i<DIGESTSIZE;i++){
        printf("%04x\n",gDigest[i]);
    }
    printf("\n");
*/
    /*
    for(int i=0; i<MAXBLOCKS*BLOCKSIZE;i++){
        printf("%02x", gData[i]);
    }
    printf("\n");
    */

    return 0;
}
