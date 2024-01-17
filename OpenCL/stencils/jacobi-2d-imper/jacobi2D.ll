; ModuleID = '../stencils/jacobi-2d-imper/jacobi2D.cl'
source_filename = "../stencils/jacobi-2d-imper/jacobi2D.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @runJacobi2D_kernel1(float* nocapture readonly %0, float* nocapture %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 1) #2
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #2
  %7 = trunc i64 %6 to i32
  %8 = icmp sgt i32 %5, 0
  br i1 %8, label %9, label %48

9:                                                ; preds = %3
  %10 = add nsw i32 %2, -1
  %11 = icmp sgt i32 %10, %5
  %12 = icmp sgt i32 %7, 0
  %13 = and i1 %11, %12
  %14 = icmp sgt i32 %10, %7
  %15 = and i1 %14, %13
  br i1 %15, label %16, label %48

16:                                               ; preds = %9
  %17 = mul nsw i32 %5, %2
  %18 = add i32 %17, %7
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %0, i64 %19
  %21 = load float, float* %20, align 4, !tbaa !8
  %22 = add i32 %18, -1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float* %0, i64 %23
  %25 = load float, float* %24, align 4, !tbaa !8
  %26 = fadd float %21, %25
  %27 = add i32 %18, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float* %0, i64 %28
  %30 = load float, float* %29, align 4, !tbaa !8
  %31 = fadd float %26, %30
  %32 = add nuw nsw i32 %5, 1
  %33 = mul nsw i32 %32, %2
  %34 = add nsw i32 %33, %7
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float* %0, i64 %35
  %37 = load float, float* %36, align 4, !tbaa !8
  %38 = fadd float %31, %37
  %39 = add nsw i32 %5, -1
  %40 = mul nsw i32 %39, %2
  %41 = add nsw i32 %40, %7
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float* %0, i64 %42
  %44 = load float, float* %43, align 4, !tbaa !8
  %45 = fadd float %38, %44
  %46 = fmul float %45, 0x3FC99999A0000000
  %47 = getelementptr inbounds float, float* %1, i64 %19
  store float %46, float* %47, align 4, !tbaa !8
  br label %48

48:                                               ; preds = %16, %9, %3
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @runJacobi2D_kernel2(float* nocapture %0, float* nocapture readonly %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 1) #2
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #2
  %7 = trunc i64 %6 to i32
  %8 = icmp sgt i32 %5, 0
  br i1 %8, label %9, label %25

9:                                                ; preds = %3
  %10 = add nsw i32 %2, -1
  %11 = icmp sgt i32 %10, %5
  %12 = icmp sgt i32 %7, 0
  %13 = and i1 %11, %12
  %14 = icmp sgt i32 %10, %7
  %15 = and i1 %14, %13
  br i1 %15, label %16, label %25

16:                                               ; preds = %9
  %17 = mul nsw i32 %5, %2
  %18 = add nsw i32 %17, %7
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %1, i64 %19
  %21 = bitcast float* %20 to i32*
  %22 = load i32, i32* %21, align 4, !tbaa !8
  %23 = getelementptr inbounds float, float* %0, i64 %19
  %24 = bitcast float* %23 to i32*
  store i32 %22, i32* %24, align 4, !tbaa !8
  br label %25

25:                                               ; preds = %16, %9, %3
  ret void
}

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 0}
!4 = !{!"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"int"}
!6 = !{!"float*", !"float*", !"int"}
!7 = !{!"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
