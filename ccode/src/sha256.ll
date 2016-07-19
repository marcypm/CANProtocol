; ModuleID = 'sha256.bc'
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
  %2 = phi i32 [ %8, %7 ], [ 0, %0 ]
  %exitcond = icmp eq i64 %indvar1, %msgLen
  br i1 %exitcond, label %9, label %3

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
  %14 = and i32 %i.1, 63
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %13
  %scevgep = getelementptr i8* %data, i32 %i.1
  store i8 0, i8* %scevgep, align 1
  br label %17

; <label>:17                                      ; preds = %16
  %indvar.next = add i32 %indvar, 1
  br label %13

; <label>:18                                      ; preds = %13
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
  %1 = icmp sgt i32 %numBlocks, 0
  %smax = select i1 %1, i32 %numBlocks, i32 0
  br label %2

; <label>:2                                       ; preds = %113, %0
  %h7.0 = phi i32 [ 1541459225, %0 ], [ %114, %113 ]
  %h6.0 = phi i32 [ 528734635, %0 ], [ %115, %113 ]
  %h5.0 = phi i32 [ -1694144372, %0 ], [ %116, %113 ]
  %h4.0 = phi i32 [ 1359893119, %0 ], [ %117, %113 ]
  %h3.0 = phi i32 [ -1521486534, %0 ], [ %118, %113 ]
  %h2.0 = phi i32 [ 1013904242, %0 ], [ %119, %113 ]
  %h1.0 = phi i32 [ -1150833019, %0 ], [ %120, %113 ]
  %h0.0 = phi i32 [ 1779033703, %0 ], [ %121, %113 ]
  %3 = phi i32 [ 0, %0 ], [ %122, %113 ]
  %4 = shl i32 %3, 6
  %5 = or i32 %4, 1
  %6 = or i32 %4, 2
  %7 = or i32 %4, 3
  %exitcond14 = icmp eq i32 %3, %smax
  br i1 %exitcond14, label %123, label %8

; <label>:8                                       ; preds = %2
  br label %9

; <label>:9                                       ; preds = %31, %8
  %10 = phi i32 [ 0, %8 ], [ %32, %31 ]
  %11 = shl i32 %10, 2
  %exitcond = icmp eq i32 %10, 16
  br i1 %exitcond, label %33, label %12

; <label>:12                                      ; preds = %9
  %scevgep = getelementptr [64 x i32]* %W, i32 0, i32 %10
  %13 = add i32 %7, %11
  %scevgep1 = getelementptr i8* %data, i32 %13
  %14 = add i32 %6, %11
  %scevgep2 = getelementptr i8* %data, i32 %14
  %15 = add i32 %5, %11
  %scevgep3 = getelementptr i8* %data, i32 %15
  %16 = add i32 %4, %11
  %scevgep4 = getelementptr i8* %data, i32 %16
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

; <label>:31                                      ; preds = %12
  %32 = add nsw i32 %10, 1
  br label %9

; <label>:33                                      ; preds = %9
  br label %34

; <label>:34                                      ; preds = %66, %33
  %indvar = phi i32 [ %indvar.next, %66 ], [ 0, %33 ]
  %35 = add i32 %indvar, 1
  %scevgep8 = getelementptr [64 x i32]* %W, i32 0, i32 %35
  %36 = add i32 %indvar, 14
  %scevgep10 = getelementptr [64 x i32]* %W, i32 0, i32 %36
  %exitcond5 = icmp eq i32 %indvar, 48
  br i1 %exitcond5, label %67, label %37

; <label>:37                                      ; preds = %34
  %38 = add i32 %indvar, 9
  %scevgep9 = getelementptr [64 x i32]* %W, i32 0, i32 %38
  %scevgep7 = getelementptr [64 x i32]* %W, i32 0, i32 %indvar
  %t.1 = add i32 %indvar, 16
  %scevgep6 = getelementptr [64 x i32]* %W, i32 0, i32 %t.1
  %39 = load i32* %scevgep10, align 4
  %40 = lshr i32 %39, 17
  %41 = shl i32 %39, 15
  %42 = or i32 %40, %41
  %43 = lshr i32 %39, 19
  %44 = shl i32 %39, 13
  %45 = or i32 %43, %44
  %46 = xor i32 %42, %45
  %47 = load i32* %scevgep10, align 4
  %48 = lshr i32 %47, 10
  %49 = xor i32 %46, %48
  %50 = load i32* %scevgep9, align 4
  %51 = add i32 %49, %50
  %52 = load i32* %scevgep8, align 4
  %53 = lshr i32 %52, 7
  %54 = shl i32 %52, 25
  %55 = or i32 %53, %54
  %56 = lshr i32 %52, 18
  %57 = shl i32 %52, 14
  %58 = or i32 %56, %57
  %59 = xor i32 %55, %58
  %60 = load i32* %scevgep8, align 4
  %61 = lshr i32 %60, 3
  %62 = xor i32 %59, %61
  %63 = add i32 %51, %62
  %64 = load i32* %scevgep7, align 4
  %65 = add i32 %63, %64
  store i32 %65, i32* %scevgep6, align 4
  br label %66

; <label>:66                                      ; preds = %37
  %indvar.next = add i32 %indvar, 1
  br label %34

; <label>:67                                      ; preds = %34
  br label %68

; <label>:68                                      ; preds = %92, %67
  %h.0 = phi i32 [ %h7.0, %67 ], [ %g.0, %92 ]
  %g.0 = phi i32 [ %h6.0, %67 ], [ %f.0, %92 ]
  %f.0 = phi i32 [ %h5.0, %67 ], [ %e.0, %92 ]
  %e.0 = phi i32 [ %h4.0, %67 ], [ %110, %92 ]
  %d.0 = phi i32 [ %h3.0, %67 ], [ %c.0, %92 ]
  %c.0 = phi i32 [ %h2.0, %67 ], [ %b.0, %92 ]
  %b.0 = phi i32 [ %h1.0, %67 ], [ %a.0, %92 ]
  %a.0 = phi i32 [ %h0.0, %67 ], [ %109, %92 ]
  %69 = phi i32 [ 0, %67 ], [ %111, %92 ]
  %exitcond11 = icmp eq i32 %69, 64
  br i1 %exitcond11, label %112, label %70

; <label>:70                                      ; preds = %68
  %scevgep13 = getelementptr [64 x i32]* @k, i32 0, i32 %69
  %scevgep12 = getelementptr [64 x i32]* %W, i32 0, i32 %69
  %71 = lshr i32 %e.0, 6
  %72 = shl i32 %e.0, 26
  %73 = or i32 %71, %72
  %74 = lshr i32 %e.0, 11
  %75 = shl i32 %e.0, 21
  %76 = or i32 %74, %75
  %77 = xor i32 %73, %76
  %78 = lshr i32 %e.0, 25
  %79 = shl i32 %e.0, 7
  %80 = or i32 %78, %79
  %81 = xor i32 %77, %80
  %82 = add i32 %h.0, %81
  %83 = and i32 %e.0, %f.0
  %84 = xor i32 %e.0, -1
  %85 = and i32 %g.0, %84
  %86 = xor i32 %83, %85
  %87 = add i32 %82, %86
  %88 = load i32* %scevgep13, align 4
  %89 = add i32 %87, %88
  %90 = load i32* %scevgep12, align 4
  %91 = add i32 %89, %90
  br label %92

; <label>:92                                      ; preds = %70
  %93 = lshr i32 %a.0, 2
  %94 = shl i32 %a.0, 30
  %95 = or i32 %93, %94
  %96 = lshr i32 %a.0, 13
  %97 = shl i32 %a.0, 19
  %98 = or i32 %96, %97
  %99 = xor i32 %95, %98
  %100 = lshr i32 %a.0, 22
  %101 = shl i32 %a.0, 10
  %102 = or i32 %100, %101
  %103 = xor i32 %99, %102
  %104 = xor i32 %b.0, %c.0
  %105 = and i32 %a.0, %104
  %106 = and i32 %b.0, %c.0
  %107 = xor i32 %105, %106
  %108 = add i32 %103, %107
  %109 = add i32 %91, %108
  %110 = add i32 %d.0, %91
  %111 = add nsw i32 %69, 1
  br label %68

; <label>:112                                     ; preds = %68
  br label %113

; <label>:113                                     ; preds = %112
  %114 = add i32 %h.0, %h7.0
  %115 = add i32 %g.0, %h6.0
  %116 = add i32 %f.0, %h5.0
  %117 = add i32 %e.0, %h4.0
  %118 = add i32 %d.0, %h3.0
  %119 = add i32 %c.0, %h2.0
  %120 = add i32 %b.0, %h1.0
  %121 = add i32 %a.0, %h0.0
  %122 = add nsw i32 %3, 1
  br label %2

; <label>:123                                     ; preds = %2
  store i32 %h0.0, i32* %digest, align 4
  %124 = getelementptr inbounds i32* %digest, i32 1
  store i32 %h1.0, i32* %124, align 4
  %125 = getelementptr inbounds i32* %digest, i32 2
  store i32 %h2.0, i32* %125, align 4
  %126 = getelementptr inbounds i32* %digest, i32 3
  store i32 %h3.0, i32* %126, align 4
  %127 = getelementptr inbounds i32* %digest, i32 4
  store i32 %h4.0, i32* %127, align 4
  %128 = getelementptr inbounds i32* %digest, i32 5
  store i32 %h5.0, i32* %128, align 4
  %129 = getelementptr inbounds i32* %digest, i32 6
  store i32 %h6.0, i32* %129, align 4
  %130 = getelementptr inbounds i32* %digest, i32 7
  store i32 %h7.0, i32* %130, align 4
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
