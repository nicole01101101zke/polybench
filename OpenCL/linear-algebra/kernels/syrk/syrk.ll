; ModuleID = '../linear-algebra/kernels/syrk/syrk.cl'
source_filename = "../linear-algebra/kernels/syrk/syrk.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @syrk_kernel(float* nocapture readonly %0, float* nocapture %1, float %2, float %3, i32 %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, %5
  %12 = icmp slt i32 %8, %5
  %13 = and i1 %12, %11
  br i1 %13, label %14, label %69

14:                                               ; preds = %6
  %15 = mul nsw i32 %10, %5
  %16 = add nsw i32 %15, %8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %1, i64 %17
  %19 = load float, float* %18, align 4, !tbaa !8
  %20 = fmul float %19, %3
  store float %20, float* %18, align 4, !tbaa !8
  %21 = icmp sgt i32 %4, 0
  br i1 %21, label %22, label %69

22:                                               ; preds = %14
  %23 = mul nsw i32 %10, %4
  %24 = mul nsw i32 %8, %4
  %25 = sext i32 %24 to i64
  %26 = sext i32 %23 to i64
  %27 = zext i32 %4 to i64
  %28 = and i64 %27, 1
  %29 = icmp eq i32 %4, 1
  br i1 %29, label %56, label %30

30:                                               ; preds = %22
  %31 = sub nsw i64 %27, %28
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi float [ %20, %30 ], [ %52, %32 ]
  %34 = phi i64 [ 0, %30 ], [ %53, %32 ]
  %35 = phi i64 [ %31, %30 ], [ %54, %32 ]
  %36 = add nsw i64 %34, %26
  %37 = getelementptr inbounds float, float* %0, i64 %36
  %38 = load float, float* %37, align 4, !tbaa !8
  %39 = fmul float %38, %2
  %40 = add nsw i64 %34, %25
  %41 = getelementptr inbounds float, float* %0, i64 %40
  %42 = load float, float* %41, align 4, !tbaa !8
  %43 = tail call float @llvm.fmuladd.f32(float %39, float %42, float %33)
  store float %43, float* %18, align 4, !tbaa !8
  %44 = or i64 %34, 1
  %45 = add nsw i64 %44, %26
  %46 = getelementptr inbounds float, float* %0, i64 %45
  %47 = load float, float* %46, align 4, !tbaa !8
  %48 = fmul float %47, %2
  %49 = add nsw i64 %44, %25
  %50 = getelementptr inbounds float, float* %0, i64 %49
  %51 = load float, float* %50, align 4, !tbaa !8
  %52 = tail call float @llvm.fmuladd.f32(float %48, float %51, float %43)
  store float %52, float* %18, align 4, !tbaa !8
  %53 = add nuw nsw i64 %34, 2
  %54 = add i64 %35, -2
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %56, label %32

56:                                               ; preds = %32, %22
  %57 = phi float [ %20, %22 ], [ %52, %32 ]
  %58 = phi i64 [ 0, %22 ], [ %53, %32 ]
  %59 = icmp eq i64 %28, 0
  br i1 %59, label %69, label %60

60:                                               ; preds = %56
  %61 = add nsw i64 %58, %26
  %62 = getelementptr inbounds float, float* %0, i64 %61
  %63 = load float, float* %62, align 4, !tbaa !8
  %64 = fmul float %63, %2
  %65 = add nsw i64 %58, %25
  %66 = getelementptr inbounds float, float* %0, i64 %65
  %67 = load float, float* %66, align 4, !tbaa !8
  %68 = tail call float @llvm.fmuladd.f32(float %64, float %67, float %57)
  store float %68, float* %18, align 4, !tbaa !8
  br label %69

69:                                               ; preds = %60, %56, %14, %6
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

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
!3 = !{i32 1, i32 1, i32 0, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE", !"DATA_TYPE", !"int", !"int"}
!6 = !{!"float*", !"float*", !"float", !"float", !"int", !"int"}
!7 = !{!"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
