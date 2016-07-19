; ModuleID = 'sha256.postlto.bc'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@k = internal constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 4
@gData = internal global [192 x i8] zeroinitializer, align 1
@gDigest = internal global [8 x i32] zeroinitializer, align 4
@main.msg = private unnamed_addr constant [64 x i8] c"the quick brown fox jumped over the lazy dog12345678901234567890", align 1

; Function Attrs: noinline nounwind
define internal i32 @pad(i8* %data, i8* %msg, i64 %msgLen) #0 {
  br label %1

; <label>:1                                       ; preds = %8, %0
  %i.0 = phi i32 [ 0, %0 ], [ %9, %8 ]
  %2 = sext i32 %i.0 to i64
  %3 = icmp ult i64 %2, %msgLen
  br i1 %3, label %4, label %10

; <label>:4                                       ; preds = %1
  %5 = getelementptr inbounds i8* %msg, i32 %i.0
  %6 = load i8* %5, align 1
  %7 = getelementptr inbounds i8* %data, i32 %i.0
  store i8 %6, i8* %7, align 1
  br label %8

; <label>:8                                       ; preds = %4
  %9 = add nsw i32 %i.0, 1
  br label %1

; <label>:10                                      ; preds = %1
  %11 = getelementptr inbounds i8* %data, i32 %i.0
  store i8 -128, i8* %11, align 1
  br label %12

; <label>:12                                      ; preds = %17, %10
  %i.1.in = phi i32 [ %i.0, %10 ], [ %i.1, %17 ]
  %i.1 = add nsw i32 %i.1.in, 1
  %13 = and i32 %i.1, 63
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %12
  %16 = getelementptr inbounds i8* %data, i32 %i.1
  store i8 0, i8* %16, align 1
  br label %17

; <label>:17                                      ; preds = %15
  br label %12

; <label>:18                                      ; preds = %12
  %19 = shl i64 %msgLen, 3
  %20 = lshr i64 %msgLen, 21
  %21 = trunc i64 %20 to i8
  %22 = add nsw i32 %i.1.in, -3
  %23 = getelementptr inbounds i8* %data, i32 %22
  store i8 %21, i8* %23, align 1
  %24 = lshr i64 %msgLen, 13
  %25 = trunc i64 %24 to i8
  %26 = add nsw i32 %i.1.in, -2
  %27 = getelementptr inbounds i8* %data, i32 %26
  store i8 %25, i8* %27, align 1
  %28 = lshr i64 %msgLen, 5
  %29 = trunc i64 %28 to i8
  %30 = add nsw i32 %i.1.in, -1
  %31 = getelementptr inbounds i8* %data, i32 %30
  store i8 %29, i8* %31, align 1
  %32 = trunc i64 %19 to i8
  %33 = getelementptr inbounds i8* %data, i32 %i.1.in
  store i8 %32, i8* %33, align 1
  %34 = sdiv i32 %i.1.in, 64
  ret i32 %34
}

; Function Attrs: noinline nounwind
define internal void @outerloop(i32* %digest, i8* %data, i32 %numBlocks) #0 {
  %W = alloca [64 x i32], align 4
  br label %1

; <label>:1                                       ; preds = %147, %0
  %h7.0 = phi i32 [ 1541459225, %0 ], [ %149, %147 ]
  %h6.0 = phi i32 [ 528734635, %0 ], [ %150, %147 ]
  %h5.0 = phi i32 [ -1694144372, %0 ], [ %151, %147 ]
  %h4.0 = phi i32 [ 1359893119, %0 ], [ %152, %147 ]
  %h3.0 = phi i32 [ -1521486534, %0 ], [ %153, %147 ]
  %h2.0 = phi i32 [ 1013904242, %0 ], [ %154, %147 ]
  %h1.0 = phi i32 [ -1150833019, %0 ], [ %155, %147 ]
  %h0.0 = phi i32 [ 1779033703, %0 ], [ %156, %147 ]
  %Mi.0 = phi i8* [ %data, %0 ], [ %148, %147 ]
  %i.0 = phi i32 [ 0, %0 ], [ %157, %147 ]
  %2 = icmp slt i32 %i.0, %numBlocks
  br i1 %2, label %3, label %158

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %33, %3
  %t.0 = phi i32 [ 0, %3 ], [ %34, %33 ]
  %5 = icmp slt i32 %t.0, 16
  br i1 %5, label %6, label %35

; <label>:6                                       ; preds = %4
  %7 = shl nsw i32 %t.0, 2
  %8 = getelementptr inbounds i8* %Mi.0, i32 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = shl nuw i32 %10, 24
  %12 = shl nsw i32 %t.0, 2
  %13 = or i32 %12, 1
  %14 = getelementptr inbounds i8* %Mi.0, i32 %13
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = shl nuw nsw i32 %16, 16
  %18 = or i32 %11, %17
  %19 = shl nsw i32 %t.0, 2
  %20 = or i32 %19, 2
  %21 = getelementptr inbounds i8* %Mi.0, i32 %20
  %22 = load i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = shl nuw nsw i32 %23, 8
  %25 = or i32 %18, %24
  %26 = shl nsw i32 %t.0, 2
  %27 = or i32 %26, 3
  %28 = getelementptr inbounds i8* %Mi.0, i32 %27
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = or i32 %25, %30
  %32 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.0
  store i32 %31, i32* %32, align 4
  br label %33

; <label>:33                                      ; preds = %6
  %34 = add nsw i32 %t.0, 1
  br label %4

; <label>:35                                      ; preds = %4
  br label %36

; <label>:36                                      ; preds = %97, %35
  %t.1 = phi i32 [ %t.0, %35 ], [ %98, %97 ]
  %37 = icmp slt i32 %t.1, 64
  br i1 %37, label %38, label %99

; <label>:38                                      ; preds = %36
  %39 = add nsw i32 %t.1, -2
  %40 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %39
  %41 = load i32* %40, align 4
  %42 = lshr i32 %41, 17
  %43 = add nsw i32 %t.1, -2
  %44 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %43
  %45 = load i32* %44, align 4
  %46 = shl i32 %45, 15
  %47 = or i32 %42, %46
  %48 = add nsw i32 %t.1, -2
  %49 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %48
  %50 = load i32* %49, align 4
  %51 = lshr i32 %50, 19
  %52 = add nsw i32 %t.1, -2
  %53 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %52
  %54 = load i32* %53, align 4
  %55 = shl i32 %54, 13
  %56 = or i32 %51, %55
  %57 = xor i32 %47, %56
  %58 = add nsw i32 %t.1, -2
  %59 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %58
  %60 = load i32* %59, align 4
  %61 = lshr i32 %60, 10
  %62 = xor i32 %57, %61
  %63 = add nsw i32 %t.1, -7
  %64 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %63
  %65 = load i32* %64, align 4
  %66 = add i32 %62, %65
  %67 = add nsw i32 %t.1, -15
  %68 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %67
  %69 = load i32* %68, align 4
  %70 = lshr i32 %69, 7
  %71 = add nsw i32 %t.1, -15
  %72 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %71
  %73 = load i32* %72, align 4
  %74 = shl i32 %73, 25
  %75 = or i32 %70, %74
  %76 = add nsw i32 %t.1, -15
  %77 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %76
  %78 = load i32* %77, align 4
  %79 = lshr i32 %78, 18
  %80 = add nsw i32 %t.1, -15
  %81 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %80
  %82 = load i32* %81, align 4
  %83 = shl i32 %82, 14
  %84 = or i32 %79, %83
  %85 = xor i32 %75, %84
  %86 = add nsw i32 %t.1, -15
  %87 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %86
  %88 = load i32* %87, align 4
  %89 = lshr i32 %88, 3
  %90 = xor i32 %85, %89
  %91 = add i32 %66, %90
  %92 = add nsw i32 %t.1, -16
  %93 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %92
  %94 = load i32* %93, align 4
  %95 = add i32 %91, %94
  %96 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.1
  store i32 %95, i32* %96, align 4
  br label %97

; <label>:97                                      ; preds = %38
  %98 = add nsw i32 %t.1, 1
  br label %36

; <label>:99                                      ; preds = %36
  br label %100

; <label>:100                                     ; preds = %126, %99
  %h.0 = phi i32 [ %h7.0, %99 ], [ %g.0, %126 ]
  %g.0 = phi i32 [ %h6.0, %99 ], [ %f.0, %126 ]
  %f.0 = phi i32 [ %h5.0, %99 ], [ %e.0, %126 ]
  %e.0 = phi i32 [ %h4.0, %99 ], [ %144, %126 ]
  %d.0 = phi i32 [ %h3.0, %99 ], [ %c.0, %126 ]
  %c.0 = phi i32 [ %h2.0, %99 ], [ %b.0, %126 ]
  %b.0 = phi i32 [ %h1.0, %99 ], [ %a.0, %126 ]
  %a.0 = phi i32 [ %h0.0, %99 ], [ %143, %126 ]
  %t.2 = phi i32 [ 0, %99 ], [ %145, %126 ]
  %101 = icmp slt i32 %t.2, 64
  br i1 %101, label %102, label %146

; <label>:102                                     ; preds = %100
  %103 = lshr i32 %e.0, 6
  %104 = shl i32 %e.0, 26
  %105 = or i32 %103, %104
  %106 = lshr i32 %e.0, 11
  %107 = shl i32 %e.0, 21
  %108 = or i32 %106, %107
  %109 = xor i32 %105, %108
  %110 = lshr i32 %e.0, 25
  %111 = shl i32 %e.0, 7
  %112 = or i32 %110, %111
  %113 = xor i32 %109, %112
  %114 = add i32 %h.0, %113
  %115 = and i32 %e.0, %f.0
  %116 = xor i32 %e.0, -1
  %117 = and i32 %g.0, %116
  %118 = xor i32 %115, %117
  %119 = add i32 %114, %118
  %120 = getelementptr inbounds [64 x i32]* @k, i32 0, i32 %t.2
  %121 = load i32* %120, align 4
  %122 = add i32 %119, %121
  %123 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.2
  %124 = load i32* %123, align 4
  %125 = add i32 %122, %124
  br label %126

; <label>:126                                     ; preds = %102
  %127 = lshr i32 %a.0, 2
  %128 = shl i32 %a.0, 30
  %129 = or i32 %127, %128
  %130 = lshr i32 %a.0, 13
  %131 = shl i32 %a.0, 19
  %132 = or i32 %130, %131
  %133 = xor i32 %129, %132
  %134 = lshr i32 %a.0, 22
  %135 = shl i32 %a.0, 10
  %136 = or i32 %134, %135
  %137 = xor i32 %133, %136
  %138 = xor i32 %b.0, %c.0
  %139 = and i32 %a.0, %138
  %140 = and i32 %b.0, %c.0
  %141 = xor i32 %139, %140
  %142 = add i32 %137, %141
  %143 = add i32 %125, %142
  %144 = add i32 %d.0, %125
  %145 = add nsw i32 %t.2, 1
  br label %100

; <label>:146                                     ; preds = %100
  br label %147

; <label>:147                                     ; preds = %146
  %148 = getelementptr inbounds i8* %Mi.0, i32 64
  %149 = add i32 %h.0, %h7.0
  %150 = add i32 %g.0, %h6.0
  %151 = add i32 %f.0, %h5.0
  %152 = add i32 %e.0, %h4.0
  %153 = add i32 %d.0, %h3.0
  %154 = add i32 %c.0, %h2.0
  %155 = add i32 %b.0, %h1.0
  %156 = add i32 %a.0, %h0.0
  %157 = add nsw i32 %i.0, 1
  br label %1

; <label>:158                                     ; preds = %1
  store i32 %h0.0, i32* %digest, align 4
  %159 = getelementptr inbounds i32* %digest, i32 1
  store i32 %h1.0, i32* %159, align 4
  %160 = getelementptr inbounds i32* %digest, i32 2
  store i32 %h2.0, i32* %160, align 4
  %161 = getelementptr inbounds i32* %digest, i32 3
  store i32 %h3.0, i32* %161, align 4
  %162 = getelementptr inbounds i32* %digest, i32 4
  store i32 %h4.0, i32* %162, align 4
  %163 = getelementptr inbounds i32* %digest, i32 5
  store i32 %h5.0, i32* %163, align 4
  %164 = getelementptr inbounds i32* %digest, i32 6
  store i32 %h6.0, i32* %164, align 4
  %165 = getelementptr inbounds i32* %digest, i32 7
  store i32 %h7.0, i32* %165, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @SHA256(i8* %msg, i64 %msgLen) #0 {
  %1 = call i32 @pad(i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i8* %msg, i64 %msgLen) #2
  call void @outerloop(i32* getelementptr inbounds ([8 x i32]* @gDigest, i32 0, i32 0), i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i32 %1) #2
  ret void
}

; Function Attrs: noinline nounwind
define i32 @main() #0 {
  %msg = alloca [64 x i8], align 1
  %1 = getelementptr inbounds [64 x i8]* %msg, i32 0, i32 0
  call void @legup_memcpy_1(i8* %1, i8* getelementptr inbounds ([64 x i8]* @main.msg, i32 0, i32 0), i32 64)
  %2 = getelementptr inbounds [64 x i8]* %msg, i32 0, i32 0
  call void @SHA256(i8* %2, i64 64) #2
  ret i32 0
}

; Function Attrs: nounwind
define internal void @legup_memcpy_1(i8* %d, i8* %s, i32 %n) #1 {
  %1 = alloca i32, align 4
  %dt = alloca i8*, align 4
  %st = alloca i8*, align 4
  store i32 %n, i32* %1, align 4
  store i8* %d, i8** %dt, align 4
  store i8* %s, i8** %st, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %1, align 4
  %4 = add i32 %3, -1
  store i32 %4, i32* %1, align 4
  %5 = icmp eq i32 %3, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %2
  %7 = load i8** %st, align 4
  %8 = getelementptr inbounds i8* %7, i32 1
  store i8* %8, i8** %st, align 4
  %9 = load i8* %7, align 1
  %10 = load i8** %dt, align 4
  %11 = getelementptr inbounds i8* %10, i32 1
  store i8* %11, i8** %dt, align 4
  store i8 %9, i8* %10, align 1
  br label %2

; <label>:12                                      ; preds = %2
  ret void
}

attributes #0 = { noinline nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
