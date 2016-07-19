; ModuleID = 'sha256.1.bc'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@k = internal constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 4
@gData = internal global [192 x i8] zeroinitializer, align 1
@gDigest = internal global [8 x i32] zeroinitializer, align 4
@main.msg = private unnamed_addr constant [64 x i8] c"the quick brown fox jumped over the lazy dog12345678901234567890", align 1

; Function Attrs: noinline nounwind
define internal i32 @pad(i8* %data, i8* %msg, i64 %msgLen) #0 {
  br label %1

; <label>:1                                       ; preds = %7, %0
  %indvar1 = phi i64 [ %indvar.next2, %7 ], [ 0, %0 ]
  %2 = phi i32 [ 0, %0 ], [ %8, %7 ]
  %exitcond = icmp ne i64 %indvar1, %msgLen
  br i1 %exitcond, label %3, label %9

; <label>:3                                       ; preds = %1
  %4 = getelementptr inbounds i8* %msg, i32 %2
  %5 = load i8* %4, align 1
  %6 = getelementptr inbounds i8* %data, i32 %2
  store i8 %5, i8* %6, align 1
  br label %7

; <label>:7                                       ; preds = %3
  %8 = add nsw i32 %2, 1
  %indvar.next2 = add i64 %indvar1, 1
  br label %1

; <label>:9                                       ; preds = %1
  %10 = trunc i64 %msgLen to i32
  %11 = getelementptr inbounds i8* %data, i32 %10
  store i8 -128, i8* %11, align 1
  %12 = add i32 %10, 1
  br label %13

; <label>:13                                      ; preds = %17, %9
  %indvar = phi i32 [ %indvar.next, %17 ], [ 0, %9 ]
  %i.1.in = add i32 %10, %indvar
  %i.1 = add i32 %12, %indvar
  %scevgep = getelementptr i8* %data, i32 %i.1
  %14 = and i32 %i.1, 63
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %13
  store i8 0, i8* %scevgep, align 1
  br label %17

; <label>:17                                      ; preds = %16
  %indvar.next = add i32 %indvar, 1
  br label %13

; <label>:18                                      ; preds = %13
  %i.1.in.lcssa = phi i32 [ %i.1.in, %13 ]
  %19 = shl i64 %msgLen, 3
  %20 = lshr i64 %msgLen, 21
  %21 = trunc i64 %20 to i8
  %22 = add nsw i32 %i.1.in.lcssa, -3
  %23 = getelementptr inbounds i8* %data, i32 %22
  store i8 %21, i8* %23, align 1
  %24 = lshr i64 %msgLen, 13
  %25 = trunc i64 %24 to i8
  %26 = add nsw i32 %i.1.in.lcssa, -2
  %27 = getelementptr inbounds i8* %data, i32 %26
  store i8 %25, i8* %27, align 1
  %28 = lshr i64 %msgLen, 5
  %29 = trunc i64 %28 to i8
  %30 = add nsw i32 %i.1.in.lcssa, -1
  %31 = getelementptr inbounds i8* %data, i32 %30
  store i8 %29, i8* %31, align 1
  %32 = trunc i64 %19 to i8
  %33 = getelementptr inbounds i8* %data, i32 %i.1.in.lcssa
  store i8 %32, i8* %33, align 1
  %34 = sdiv i32 %i.1.in.lcssa, 64
  ret i32 %34
}

; Function Attrs: noinline nounwind
define internal void @outerloop(i32* %digest, i8* %data, i32 %numBlocks) #0 {
  %W = alloca [64 x i32], align 4
  %1 = icmp sgt i32 %numBlocks, 0
  %smax = select i1 %1, i32 %numBlocks, i32 0
  br label %2

; <label>:2                                       ; preds = %119, %0
  %h7.0 = phi i32 [ 1541459225, %0 ], [ %120, %119 ]
  %h6.0 = phi i32 [ 528734635, %0 ], [ %121, %119 ]
  %h5.0 = phi i32 [ -1694144372, %0 ], [ %122, %119 ]
  %h4.0 = phi i32 [ 1359893119, %0 ], [ %123, %119 ]
  %h3.0 = phi i32 [ -1521486534, %0 ], [ %124, %119 ]
  %h2.0 = phi i32 [ 1013904242, %0 ], [ %125, %119 ]
  %h1.0 = phi i32 [ -1150833019, %0 ], [ %126, %119 ]
  %h0.0 = phi i32 [ 1779033703, %0 ], [ %127, %119 ]
  %3 = phi i32 [ 0, %0 ], [ %128, %119 ]
  %4 = mul i32 %3, 64
  %5 = add i32 %4, 1
  %6 = add i32 %4, 2
  %7 = add i32 %4, 3
  %exitcond14 = icmp ne i32 %3, %smax
  br i1 %exitcond14, label %8, label %129

; <label>:8                                       ; preds = %2
  br label %9

; <label>:9                                       ; preds = %31, %8
  %10 = phi i32 [ 0, %8 ], [ %32, %31 ]
  %11 = mul i32 %10, 4
  %12 = add i32 %4, %11
  %scevgep4 = getelementptr i8* %data, i32 %12
  %13 = add i32 %5, %11
  %scevgep3 = getelementptr i8* %data, i32 %13
  %14 = add i32 %6, %11
  %scevgep2 = getelementptr i8* %data, i32 %14
  %15 = add i32 %7, %11
  %scevgep1 = getelementptr i8* %data, i32 %15
  %scevgep = getelementptr [64 x i32]* %W, i32 0, i32 %10
  %exitcond = icmp ne i32 %10, 16
  br i1 %exitcond, label %16, label %33

; <label>:16                                      ; preds = %9
  %17 = load i8* %scevgep4, align 1
  %18 = zext i8 %17 to i32
  %19 = shl nuw i32 %18, 24
  %20 = load i8* %scevgep3, align 1
  %21 = zext i8 %20 to i32
  %22 = shl nuw nsw i32 %21, 16
  %23 = or i32 %19, %22
  %24 = load i8* %scevgep2, align 1
  %25 = zext i8 %24 to i32
  %26 = shl nuw nsw i32 %25, 8
  %27 = or i32 %23, %26
  %28 = load i8* %scevgep1, align 1
  %29 = zext i8 %28 to i32
  %30 = or i32 %27, %29
  store i32 %30, i32* %scevgep, align 4
  br label %31

; <label>:31                                      ; preds = %16
  %32 = add nsw i32 %10, 1
  br label %9

; <label>:33                                      ; preds = %9
  br label %34

; <label>:34                                      ; preds = %72, %33
  %indvar = phi i32 [ %indvar.next, %72 ], [ 0, %33 ]
  %t.1 = add i32 %indvar, 16
  %scevgep6 = getelementptr [64 x i32]* %W, i32 0, i32 %t.1
  %scevgep7 = getelementptr [64 x i32]* %W, i32 0, i32 %indvar
  %35 = add i32 %indvar, 1
  %scevgep8 = getelementptr [64 x i32]* %W, i32 0, i32 %35
  %36 = add i32 %indvar, 9
  %scevgep9 = getelementptr [64 x i32]* %W, i32 0, i32 %36
  %37 = add i32 %indvar, 14
  %scevgep10 = getelementptr [64 x i32]* %W, i32 0, i32 %37
  %exitcond5 = icmp ne i32 %indvar, 48
  br i1 %exitcond5, label %38, label %73

; <label>:38                                      ; preds = %34
  %39 = load i32* %scevgep10, align 4
  %40 = lshr i32 %39, 17
  %41 = load i32* %scevgep10, align 4
  %42 = shl i32 %41, 15
  %43 = or i32 %40, %42
  %44 = load i32* %scevgep10, align 4
  %45 = lshr i32 %44, 19
  %46 = load i32* %scevgep10, align 4
  %47 = shl i32 %46, 13
  %48 = or i32 %45, %47
  %49 = xor i32 %43, %48
  %50 = load i32* %scevgep10, align 4
  %51 = lshr i32 %50, 10
  %52 = xor i32 %49, %51
  %53 = load i32* %scevgep9, align 4
  %54 = add i32 %52, %53
  %55 = load i32* %scevgep8, align 4
  %56 = lshr i32 %55, 7
  %57 = load i32* %scevgep8, align 4
  %58 = shl i32 %57, 25
  %59 = or i32 %56, %58
  %60 = load i32* %scevgep8, align 4
  %61 = lshr i32 %60, 18
  %62 = load i32* %scevgep8, align 4
  %63 = shl i32 %62, 14
  %64 = or i32 %61, %63
  %65 = xor i32 %59, %64
  %66 = load i32* %scevgep8, align 4
  %67 = lshr i32 %66, 3
  %68 = xor i32 %65, %67
  %69 = add i32 %54, %68
  %70 = load i32* %scevgep7, align 4
  %71 = add i32 %69, %70
  store i32 %71, i32* %scevgep6, align 4
  br label %72

; <label>:72                                      ; preds = %38
  %indvar.next = add i32 %indvar, 1
  br label %34

; <label>:73                                      ; preds = %34
  br label %74

; <label>:74                                      ; preds = %98, %73
  %h.0 = phi i32 [ %h7.0, %73 ], [ %g.0, %98 ]
  %g.0 = phi i32 [ %h6.0, %73 ], [ %f.0, %98 ]
  %f.0 = phi i32 [ %h5.0, %73 ], [ %e.0, %98 ]
  %e.0 = phi i32 [ %h4.0, %73 ], [ %116, %98 ]
  %d.0 = phi i32 [ %h3.0, %73 ], [ %c.0, %98 ]
  %c.0 = phi i32 [ %h2.0, %73 ], [ %b.0, %98 ]
  %b.0 = phi i32 [ %h1.0, %73 ], [ %a.0, %98 ]
  %a.0 = phi i32 [ %h0.0, %73 ], [ %115, %98 ]
  %75 = phi i32 [ 0, %73 ], [ %117, %98 ]
  %scevgep12 = getelementptr [64 x i32]* %W, i32 0, i32 %75
  %scevgep13 = getelementptr [64 x i32]* @k, i32 0, i32 %75
  %exitcond11 = icmp ne i32 %75, 64
  br i1 %exitcond11, label %76, label %118

; <label>:76                                      ; preds = %74
  %77 = lshr i32 %e.0, 6
  %78 = shl i32 %e.0, 26
  %79 = or i32 %77, %78
  %80 = lshr i32 %e.0, 11
  %81 = shl i32 %e.0, 21
  %82 = or i32 %80, %81
  %83 = xor i32 %79, %82
  %84 = lshr i32 %e.0, 25
  %85 = shl i32 %e.0, 7
  %86 = or i32 %84, %85
  %87 = xor i32 %83, %86
  %88 = add i32 %h.0, %87
  %89 = and i32 %e.0, %f.0
  %90 = xor i32 %e.0, -1
  %91 = and i32 %g.0, %90
  %92 = xor i32 %89, %91
  %93 = add i32 %88, %92
  %94 = load i32* %scevgep13, align 4
  %95 = add i32 %93, %94
  %96 = load i32* %scevgep12, align 4
  %97 = add i32 %95, %96
  br label %98

; <label>:98                                      ; preds = %76
  %99 = lshr i32 %a.0, 2
  %100 = shl i32 %a.0, 30
  %101 = or i32 %99, %100
  %102 = lshr i32 %a.0, 13
  %103 = shl i32 %a.0, 19
  %104 = or i32 %102, %103
  %105 = xor i32 %101, %104
  %106 = lshr i32 %a.0, 22
  %107 = shl i32 %a.0, 10
  %108 = or i32 %106, %107
  %109 = xor i32 %105, %108
  %110 = xor i32 %b.0, %c.0
  %111 = and i32 %a.0, %110
  %112 = and i32 %b.0, %c.0
  %113 = xor i32 %111, %112
  %114 = add i32 %109, %113
  %115 = add i32 %97, %114
  %116 = add i32 %d.0, %97
  %117 = add nsw i32 %75, 1
  br label %74

; <label>:118                                     ; preds = %74
  %a.0.lcssa = phi i32 [ %a.0, %74 ]
  %b.0.lcssa = phi i32 [ %b.0, %74 ]
  %c.0.lcssa = phi i32 [ %c.0, %74 ]
  %d.0.lcssa = phi i32 [ %d.0, %74 ]
  %e.0.lcssa = phi i32 [ %e.0, %74 ]
  %f.0.lcssa = phi i32 [ %f.0, %74 ]
  %g.0.lcssa = phi i32 [ %g.0, %74 ]
  %h.0.lcssa = phi i32 [ %h.0, %74 ]
  br label %119

; <label>:119                                     ; preds = %118
  %120 = add i32 %h.0.lcssa, %h7.0
  %121 = add i32 %g.0.lcssa, %h6.0
  %122 = add i32 %f.0.lcssa, %h5.0
  %123 = add i32 %e.0.lcssa, %h4.0
  %124 = add i32 %d.0.lcssa, %h3.0
  %125 = add i32 %c.0.lcssa, %h2.0
  %126 = add i32 %b.0.lcssa, %h1.0
  %127 = add i32 %a.0.lcssa, %h0.0
  %128 = add nsw i32 %3, 1
  br label %2

; <label>:129                                     ; preds = %2
  %h0.0.lcssa = phi i32 [ %h0.0, %2 ]
  %h1.0.lcssa = phi i32 [ %h1.0, %2 ]
  %h2.0.lcssa = phi i32 [ %h2.0, %2 ]
  %h3.0.lcssa = phi i32 [ %h3.0, %2 ]
  %h4.0.lcssa = phi i32 [ %h4.0, %2 ]
  %h5.0.lcssa = phi i32 [ %h5.0, %2 ]
  %h6.0.lcssa = phi i32 [ %h6.0, %2 ]
  %h7.0.lcssa = phi i32 [ %h7.0, %2 ]
  store i32 %h0.0.lcssa, i32* %digest, align 4
  %130 = getelementptr inbounds i32* %digest, i32 1
  store i32 %h1.0.lcssa, i32* %130, align 4
  %131 = getelementptr inbounds i32* %digest, i32 2
  store i32 %h2.0.lcssa, i32* %131, align 4
  %132 = getelementptr inbounds i32* %digest, i32 3
  store i32 %h3.0.lcssa, i32* %132, align 4
  %133 = getelementptr inbounds i32* %digest, i32 4
  store i32 %h4.0.lcssa, i32* %133, align 4
  %134 = getelementptr inbounds i32* %digest, i32 5
  store i32 %h5.0.lcssa, i32* %134, align 4
  %135 = getelementptr inbounds i32* %digest, i32 6
  store i32 %h6.0.lcssa, i32* %135, align 4
  %136 = getelementptr inbounds i32* %digest, i32 7
  store i32 %h7.0.lcssa, i32* %136, align 4
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
