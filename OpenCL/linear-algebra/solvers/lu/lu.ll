; ModuleID = '../linear-algebra/solvers/lu/lu.cl'
source_filename = "../linear-algebra/solvers/lu/lu.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @lu_kernel1(float* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %5 = add nsw i32 %1, 1
  %6 = trunc i64 %4 to i32
  %7 = add i32 %5, %6
  %8 = icmp slt i32 %7, %2
  br i1 %8, label %9, label %20

9:                                                ; preds = %3
  %10 = mul nsw i32 %2, %1
  %11 = add nsw i32 %7, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float* %0, i64 %12
  %14 = load float, float* %13, align 4, !tbaa !8
  %15 = add nsw i32 %10, %1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float* %0, i64 %16
  %18 = load float, float* %17, align 4, !tbaa !8
  %19 = fdiv float %14, %18, !fpmath !12
  store float %19, float* %13, align 4, !tbaa !8
  br label %20

20:                                               ; preds = %9, %3
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @lu_kernel2(float* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %5 = add nsw i32 %1, 1
  %6 = trunc i64 %4 to i32
  %7 = add i32 %5, %6
  %8 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %9 = trunc i64 %8 to i32
  %10 = add i32 %5, %9
  %11 = icmp slt i32 %10, %2
  %12 = icmp slt i32 %7, %2
  %13 = and i1 %12, %11
  br i1 %13, label %14, label %31

14:                                               ; preds = %3
  %15 = mul nsw i32 %10, %2
  %16 = add nsw i32 %15, %7
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %0, i64 %17
  %19 = load float, float* %18, align 4, !tbaa !8
  %20 = add nsw i32 %15, %1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %0, i64 %21
  %23 = load float, float* %22, align 4, !tbaa !8
  %24 = mul nsw i32 %2, %1
  %25 = add nsw i32 %7, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float* %0, i64 %26
  %28 = load float, float* %27, align 4, !tbaa !8
  %29 = fneg float %23
  %30 = tail call float @llvm.fmuladd.f32(float %29, float %28, float %19)
  store float %30, float* %18, align 4, !tbaa !8
  br label %31

31:                                               ; preds = %14, %3
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 0, i32 0}
!4 = !{!"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"int", !"int"}
!6 = !{!"float*", !"int", !"int"}
!7 = !{!"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{float 2.500000e+00}
