; ModuleID = 'sha256.prelto.1.bc'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@k = internal constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 4
@gData = common global [192 x i8] zeroinitializer, align 1
@gDigest = common global [8 x i32] zeroinitializer, align 4
@main.msg = private unnamed_addr constant [64 x i8] c"the quick brown fox jumped over the lazy dog12345678901234567890", align 1

; Function Attrs: noinline nounwind
define i32 @pad(i8* %data, i8* %msg, i64 %msgLen) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %3 = alloca i64, align 8
  %i = alloca i32, align 4
  %numBlocks = alloca i32, align 4
  store i8* %data, i8** %1, align 4
  store i8* %msg, i8** %2, align 4
  store i64 %msgLen, i64* %3, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %17, %0
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = load i64* %3, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %4
  %10 = load i32* %i, align 4
  %11 = load i8** %2, align 4
  %12 = getelementptr inbounds i8* %11, i32 %10
  %13 = load i8* %12, align 1
  %14 = load i32* %i, align 4
  %15 = load i8** %1, align 4
  %16 = getelementptr inbounds i8* %15, i32 %14
  store i8 %13, i8* %16, align 1
  br label %17

; <label>:17                                      ; preds = %9
  %18 = load i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %4

; <label>:20                                      ; preds = %4
  %21 = load i32* %i, align 4
  %22 = load i8** %1, align 4
  %23 = getelementptr inbounds i8* %22, i32 %21
  store i8 -128, i8* %23, align 1
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %26

; <label>:26                                      ; preds = %34, %20
  %27 = load i32* %i, align 4
  %28 = srem i32 %27, 64
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %37

; <label>:30                                      ; preds = %26
  %31 = load i32* %i, align 4
  %32 = load i8** %1, align 4
  %33 = getelementptr inbounds i8* %32, i32 %31
  store i8 0, i8* %33, align 1
  br label %34

; <label>:34                                      ; preds = %30
  %35 = load i32* %i, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %i, align 4
  br label %26

; <label>:37                                      ; preds = %26
  %38 = load i64* %3, align 8
  %39 = mul i64 %38, 8
  store i64 %39, i64* %3, align 8
  %40 = load i64* %3, align 8
  %41 = lshr i64 %40, 24
  %42 = and i64 %41, 65535
  %43 = trunc i64 %42 to i8
  %44 = load i32* %i, align 4
  %45 = sub nsw i32 %44, 4
  %46 = load i8** %1, align 4
  %47 = getelementptr inbounds i8* %46, i32 %45
  store i8 %43, i8* %47, align 1
  %48 = load i64* %3, align 8
  %49 = lshr i64 %48, 16
  %50 = and i64 %49, 65535
  %51 = trunc i64 %50 to i8
  %52 = load i32* %i, align 4
  %53 = sub nsw i32 %52, 3
  %54 = load i8** %1, align 4
  %55 = getelementptr inbounds i8* %54, i32 %53
  store i8 %51, i8* %55, align 1
  %56 = load i64* %3, align 8
  %57 = lshr i64 %56, 8
  %58 = and i64 %57, 65535
  %59 = trunc i64 %58 to i8
  %60 = load i32* %i, align 4
  %61 = sub nsw i32 %60, 2
  %62 = load i8** %1, align 4
  %63 = getelementptr inbounds i8* %62, i32 %61
  store i8 %59, i8* %63, align 1
  %64 = load i64* %3, align 8
  %65 = and i64 %64, 65535
  %66 = trunc i64 %65 to i8
  %67 = load i32* %i, align 4
  %68 = sub nsw i32 %67, 1
  %69 = load i8** %1, align 4
  %70 = getelementptr inbounds i8* %69, i32 %68
  store i8 %66, i8* %70, align 1
  %71 = load i32* %i, align 4
  %72 = sub nsw i32 %71, 1
  store i32 %72, i32* %i, align 4
  %73 = load i32* %i, align 4
  %74 = sdiv i32 %73, 64
  store i32 %74, i32* %numBlocks, align 4
  %75 = load i32* %numBlocks, align 4
  ret i32 %75
}

; Function Attrs: noinline nounwind
define void @outerloop(i32* %digest, i8* %data, i32 %numBlocks) #0 {
  %1 = alloca i32*, align 4
  %2 = alloca i8*, align 4
  %3 = alloca i32, align 4
  %h0 = alloca i32, align 4
  %h1 = alloca i32, align 4
  %h2 = alloca i32, align 4
  %h3 = alloca i32, align 4
  %h4 = alloca i32, align 4
  %h5 = alloca i32, align 4
  %h6 = alloca i32, align 4
  %h7 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %h = alloca i32, align 4
  %Mi = alloca i8*, align 4
  %i = alloca i32, align 4
  %W = alloca [64 x i32], align 4
  %t = alloca i32, align 4
  %T1 = alloca i32, align 4
  %T2 = alloca i32, align 4
  store i32* %digest, i32** %1, align 4
  store i8* %data, i8** %2, align 4
  store i32 %numBlocks, i32* %3, align 4
  %4 = load i8** %2, align 4
  store i8* %4, i8** %Mi, align 4
  store i32 1779033703, i32* %h0, align 4
  store i32 -1150833019, i32* %h1, align 4
  store i32 1013904242, i32* %h2, align 4
  store i32 -1521486534, i32* %h3, align 4
  store i32 1359893119, i32* %h4, align 4
  store i32 -1694144372, i32* %h5, align 4
  store i32 528734635, i32* %h6, align 4
  store i32 1541459225, i32* %h7, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %251, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %3, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %254

; <label>:9                                       ; preds = %5
  store i32 0, i32* %t, align 4
  store i32 0, i32* %t, align 4
  br label %10

; <label>:10                                      ; preds = %49, %9
  %11 = load i32* %t, align 4
  %12 = icmp slt i32 %11, 16
  br i1 %12, label %13, label %52

; <label>:13                                      ; preds = %10
  %14 = load i32* %t, align 4
  %15 = mul nsw i32 4, %14
  %16 = load i8** %Mi, align 4
  %17 = getelementptr inbounds i8* %16, i32 %15
  %18 = load i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = shl i32 %19, 24
  %21 = load i32* %t, align 4
  %22 = mul nsw i32 4, %21
  %23 = add nsw i32 %22, 1
  %24 = load i8** %Mi, align 4
  %25 = getelementptr inbounds i8* %24, i32 %23
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = shl i32 %27, 16
  %29 = add nsw i32 %20, %28
  %30 = load i32* %t, align 4
  %31 = mul nsw i32 4, %30
  %32 = add nsw i32 %31, 2
  %33 = load i8** %Mi, align 4
  %34 = getelementptr inbounds i8* %33, i32 %32
  %35 = load i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = shl i32 %36, 8
  %38 = add nsw i32 %29, %37
  %39 = load i32* %t, align 4
  %40 = mul nsw i32 4, %39
  %41 = add nsw i32 %40, 3
  %42 = load i8** %Mi, align 4
  %43 = getelementptr inbounds i8* %42, i32 %41
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = add nsw i32 %38, %45
  %47 = load i32* %t, align 4
  %48 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %47
  store i32 %46, i32* %48, align 4
  br label %49

; <label>:49                                      ; preds = %13
  %50 = load i32* %t, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %t, align 4
  br label %10

; <label>:52                                      ; preds = %10
  br label %53

; <label>:53                                      ; preds = %128, %52
  %54 = load i32* %t, align 4
  %55 = icmp slt i32 %54, 64
  br i1 %55, label %56, label %131

; <label>:56                                      ; preds = %53
  %57 = load i32* %t, align 4
  %58 = sub nsw i32 %57, 2
  %59 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %58
  %60 = load i32* %59, align 4
  %61 = lshr i32 %60, 17
  %62 = load i32* %t, align 4
  %63 = sub nsw i32 %62, 2
  %64 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %63
  %65 = load i32* %64, align 4
  %66 = shl i32 %65, 15
  %67 = or i32 %61, %66
  %68 = load i32* %t, align 4
  %69 = sub nsw i32 %68, 2
  %70 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %69
  %71 = load i32* %70, align 4
  %72 = lshr i32 %71, 19
  %73 = load i32* %t, align 4
  %74 = sub nsw i32 %73, 2
  %75 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %74
  %76 = load i32* %75, align 4
  %77 = shl i32 %76, 13
  %78 = or i32 %72, %77
  %79 = xor i32 %67, %78
  %80 = load i32* %t, align 4
  %81 = sub nsw i32 %80, 2
  %82 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %81
  %83 = load i32* %82, align 4
  %84 = lshr i32 %83, 10
  %85 = xor i32 %79, %84
  %86 = load i32* %t, align 4
  %87 = sub nsw i32 %86, 7
  %88 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %87
  %89 = load i32* %88, align 4
  %90 = add i32 %85, %89
  %91 = load i32* %t, align 4
  %92 = sub nsw i32 %91, 15
  %93 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %92
  %94 = load i32* %93, align 4
  %95 = lshr i32 %94, 7
  %96 = load i32* %t, align 4
  %97 = sub nsw i32 %96, 15
  %98 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %97
  %99 = load i32* %98, align 4
  %100 = shl i32 %99, 25
  %101 = or i32 %95, %100
  %102 = load i32* %t, align 4
  %103 = sub nsw i32 %102, 15
  %104 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %103
  %105 = load i32* %104, align 4
  %106 = lshr i32 %105, 18
  %107 = load i32* %t, align 4
  %108 = sub nsw i32 %107, 15
  %109 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %108
  %110 = load i32* %109, align 4
  %111 = shl i32 %110, 14
  %112 = or i32 %106, %111
  %113 = xor i32 %101, %112
  %114 = load i32* %t, align 4
  %115 = sub nsw i32 %114, 15
  %116 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %115
  %117 = load i32* %116, align 4
  %118 = lshr i32 %117, 3
  %119 = xor i32 %113, %118
  %120 = add i32 %90, %119
  %121 = load i32* %t, align 4
  %122 = sub nsw i32 %121, 16
  %123 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %122
  %124 = load i32* %123, align 4
  %125 = add i32 %120, %124
  %126 = load i32* %t, align 4
  %127 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %126
  store i32 %125, i32* %127, align 4
  br label %128

; <label>:128                                     ; preds = %56
  %129 = load i32* %t, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %t, align 4
  br label %53

; <label>:131                                     ; preds = %53
  %132 = load i32* %h0, align 4
  store i32 %132, i32* %a, align 4
  %133 = load i32* %h1, align 4
  store i32 %133, i32* %b, align 4
  %134 = load i32* %h2, align 4
  store i32 %134, i32* %c, align 4
  %135 = load i32* %h3, align 4
  store i32 %135, i32* %d, align 4
  %136 = load i32* %h4, align 4
  store i32 %136, i32* %e, align 4
  %137 = load i32* %h5, align 4
  store i32 %137, i32* %f, align 4
  %138 = load i32* %h6, align 4
  store i32 %138, i32* %g, align 4
  %139 = load i32* %h7, align 4
  store i32 %139, i32* %h, align 4
  store i32 0, i32* %t, align 4
  br label %140

; <label>:140                                     ; preds = %221, %131
  %141 = load i32* %t, align 4
  %142 = icmp slt i32 %141, 64
  br i1 %142, label %143, label %224

; <label>:143                                     ; preds = %140
  %144 = load i32* %h, align 4
  %145 = load i32* %e, align 4
  %146 = lshr i32 %145, 6
  %147 = load i32* %e, align 4
  %148 = shl i32 %147, 26
  %149 = or i32 %146, %148
  %150 = load i32* %e, align 4
  %151 = lshr i32 %150, 11
  %152 = load i32* %e, align 4
  %153 = shl i32 %152, 21
  %154 = or i32 %151, %153
  %155 = xor i32 %149, %154
  %156 = load i32* %e, align 4
  %157 = lshr i32 %156, 25
  %158 = load i32* %e, align 4
  %159 = shl i32 %158, 7
  %160 = or i32 %157, %159
  %161 = xor i32 %155, %160
  %162 = add i32 %144, %161
  %163 = load i32* %e, align 4
  %164 = load i32* %f, align 4
  %165 = and i32 %163, %164
  %166 = load i32* %e, align 4
  %167 = xor i32 %166, -1
  %168 = load i32* %g, align 4
  %169 = and i32 %167, %168
  %170 = xor i32 %165, %169
  %171 = add i32 %162, %170
  %172 = load i32* %t, align 4
  %173 = getelementptr inbounds [64 x i32]* @k, i32 0, i32 %172
  %174 = load i32* %173, align 4
  %175 = add i32 %171, %174
  %176 = load i32* %t, align 4
  %177 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %176
  %178 = load i32* %177, align 4
  %179 = add i32 %175, %178
  store i32 %179, i32* %T1, align 4
  %180 = load i32* %a, align 4
  %181 = lshr i32 %180, 2
  %182 = load i32* %a, align 4
  %183 = shl i32 %182, 30
  %184 = or i32 %181, %183
  %185 = load i32* %a, align 4
  %186 = lshr i32 %185, 13
  %187 = load i32* %a, align 4
  %188 = shl i32 %187, 19
  %189 = or i32 %186, %188
  %190 = xor i32 %184, %189
  %191 = load i32* %a, align 4
  %192 = lshr i32 %191, 22
  %193 = load i32* %a, align 4
  %194 = shl i32 %193, 10
  %195 = or i32 %192, %194
  %196 = xor i32 %190, %195
  %197 = load i32* %a, align 4
  %198 = load i32* %b, align 4
  %199 = and i32 %197, %198
  %200 = load i32* %a, align 4
  %201 = load i32* %c, align 4
  %202 = and i32 %200, %201
  %203 = xor i32 %199, %202
  %204 = load i32* %b, align 4
  %205 = load i32* %c, align 4
  %206 = and i32 %204, %205
  %207 = xor i32 %203, %206
  %208 = add i32 %196, %207
  store i32 %208, i32* %T2, align 4
  %209 = load i32* %g, align 4
  store i32 %209, i32* %h, align 4
  %210 = load i32* %f, align 4
  store i32 %210, i32* %g, align 4
  %211 = load i32* %e, align 4
  store i32 %211, i32* %f, align 4
  %212 = load i32* %d, align 4
  %213 = load i32* %T1, align 4
  %214 = add i32 %212, %213
  store i32 %214, i32* %e, align 4
  %215 = load i32* %c, align 4
  store i32 %215, i32* %d, align 4
  %216 = load i32* %b, align 4
  store i32 %216, i32* %c, align 4
  %217 = load i32* %a, align 4
  store i32 %217, i32* %b, align 4
  %218 = load i32* %T1, align 4
  %219 = load i32* %T2, align 4
  %220 = add i32 %218, %219
  store i32 %220, i32* %a, align 4
  br label %221

; <label>:221                                     ; preds = %143
  %222 = load i32* %t, align 4
  %223 = add nsw i32 %222, 1
  store i32 %223, i32* %t, align 4
  br label %140

; <label>:224                                     ; preds = %140
  %225 = load i32* %a, align 4
  %226 = load i32* %h0, align 4
  %227 = add i32 %225, %226
  store i32 %227, i32* %h0, align 4
  %228 = load i32* %b, align 4
  %229 = load i32* %h1, align 4
  %230 = add i32 %228, %229
  store i32 %230, i32* %h1, align 4
  %231 = load i32* %c, align 4
  %232 = load i32* %h2, align 4
  %233 = add i32 %231, %232
  store i32 %233, i32* %h2, align 4
  %234 = load i32* %d, align 4
  %235 = load i32* %h3, align 4
  %236 = add i32 %234, %235
  store i32 %236, i32* %h3, align 4
  %237 = load i32* %e, align 4
  %238 = load i32* %h4, align 4
  %239 = add i32 %237, %238
  store i32 %239, i32* %h4, align 4
  %240 = load i32* %f, align 4
  %241 = load i32* %h5, align 4
  %242 = add i32 %240, %241
  store i32 %242, i32* %h5, align 4
  %243 = load i32* %g, align 4
  %244 = load i32* %h6, align 4
  %245 = add i32 %243, %244
  store i32 %245, i32* %h6, align 4
  %246 = load i32* %h, align 4
  %247 = load i32* %h7, align 4
  %248 = add i32 %246, %247
  store i32 %248, i32* %h7, align 4
  %249 = load i8** %Mi, align 4
  %250 = getelementptr inbounds i8* %249, i32 64
  store i8* %250, i8** %Mi, align 4
  br label %251

; <label>:251                                     ; preds = %224
  %252 = load i32* %i, align 4
  %253 = add nsw i32 %252, 1
  store i32 %253, i32* %i, align 4
  br label %5

; <label>:254                                     ; preds = %5
  %255 = load i32* %h0, align 4
  %256 = load i32** %1, align 4
  %257 = getelementptr inbounds i32* %256, i32 0
  store i32 %255, i32* %257, align 4
  %258 = load i32* %h1, align 4
  %259 = load i32** %1, align 4
  %260 = getelementptr inbounds i32* %259, i32 1
  store i32 %258, i32* %260, align 4
  %261 = load i32* %h2, align 4
  %262 = load i32** %1, align 4
  %263 = getelementptr inbounds i32* %262, i32 2
  store i32 %261, i32* %263, align 4
  %264 = load i32* %h3, align 4
  %265 = load i32** %1, align 4
  %266 = getelementptr inbounds i32* %265, i32 3
  store i32 %264, i32* %266, align 4
  %267 = load i32* %h4, align 4
  %268 = load i32** %1, align 4
  %269 = getelementptr inbounds i32* %268, i32 4
  store i32 %267, i32* %269, align 4
  %270 = load i32* %h5, align 4
  %271 = load i32** %1, align 4
  %272 = getelementptr inbounds i32* %271, i32 5
  store i32 %270, i32* %272, align 4
  %273 = load i32* %h6, align 4
  %274 = load i32** %1, align 4
  %275 = getelementptr inbounds i32* %274, i32 6
  store i32 %273, i32* %275, align 4
  %276 = load i32* %h7, align 4
  %277 = load i32** %1, align 4
  %278 = getelementptr inbounds i32* %277, i32 7
  store i32 %276, i32* %278, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @SHA256(i8* %msg, i64 %msgLen) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i64, align 8
  %numBlocks = alloca i32, align 4
  store i8* %msg, i8** %1, align 4
  store i64 %msgLen, i64* %2, align 8
  %3 = load i8** %1, align 4
  %4 = load i64* %2, align 8
  %5 = call i32 @pad(i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i8* %3, i64 %4) #2
  store i32 %5, i32* %numBlocks, align 4
  %6 = load i32* %numBlocks, align 4
  call void @outerloop(i32* getelementptr inbounds ([8 x i32]* @gDigest, i32 0, i32 0), i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i32 %6) #2
  ret void
}

; Function Attrs: noinline nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %msg = alloca [64 x i8], align 1
  %msgLen = alloca i64, align 8
  store i32 0, i32* %1
  %2 = bitcast [64 x i8]* %msg to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %2, i8* getelementptr inbounds ([64 x i8]* @main.msg, i32 0, i32 0), i32 64, i32 1, i1 false)
  store i64 64, i64* %msgLen, align 8
  %3 = getelementptr inbounds [64 x i8]* %msg, i32 0, i32 0
  %4 = load i64* %msgLen, align 8
  call void @SHA256(i8* %3, i64 %4) #2
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #1

attributes #0 = { noinline nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nobuiltin }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
