; ModuleID = '../linear-algebra/kernels/gesummv/gesummv.cl'
source_filename = "../linear-algebra/kernels/gesummv/gesummv.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @gesummv_kernel(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture readonly %2, float* nocapture %3, float* nocapture %4, float %5, float %6, i32 %7) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %9 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, %7
  br i1 %11, label %12, label %49

12:                                               ; preds = %8
  %13 = icmp sgt i32 %7, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %12
  %15 = shl i64 %9, 32
  %16 = ashr exact i64 %15, 32
  br label %41

17:                                               ; preds = %12
  %18 = mul nsw i32 %10, %7
  %19 = shl i64 %9, 32
  %20 = ashr exact i64 %19, 32
  %21 = getelementptr inbounds float, float* %4, i64 %20
  %22 = getelementptr inbounds float, float* %3, i64 %20
  %23 = sext i32 %18 to i64
  %24 = zext i32 %7 to i64
  br label %25

25:                                               ; preds = %25, %17
  %26 = phi i64 [ 0, %17 ], [ %39, %25 ]
  %27 = add nsw i64 %26, %23
  %28 = getelementptr inbounds float, float* %0, i64 %27
  %29 = load float, float* %28, align 4, !tbaa !8
  %30 = getelementptr inbounds float, float* %2, i64 %26
  %31 = load float, float* %30, align 4, !tbaa !8
  %32 = load float, float* %21, align 4, !tbaa !8
  %33 = tail call float @llvm.fmuladd.f32(float %29, float %31, float %32)
  store float %33, float* %21, align 4, !tbaa !8
  %34 = getelementptr inbounds float, float* %1, i64 %27
  %35 = load float, float* %34, align 4, !tbaa !8
  %36 = load float, float* %30, align 4, !tbaa !8
  %37 = load float, float* %22, align 4, !tbaa !8
  %38 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %37)
  store float %38, float* %22, align 4, !tbaa !8
  %39 = add nuw nsw i64 %26, 1
  %40 = icmp eq i64 %39, %24
  br i1 %40, label %41, label %25

41:                                               ; preds = %25, %14
  %42 = phi i64 [ %16, %14 ], [ %20, %25 ]
  %43 = getelementptr inbounds float, float* %4, i64 %42
  %44 = load float, float* %43, align 4, !tbaa !8
  %45 = getelementptr inbounds float, float* %3, i64 %42
  %46 = load float, float* %45, align 4, !tbaa !8
  %47 = fmul float %46, %6
  %48 = tail call float @llvm.fmuladd.f32(float %5, float %44, float %47)
  store float %48, float* %45, align 4, !tbaa !8
  br label %49

49:                                               ; preds = %41, %8
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
!3 = !{i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE", !"DATA_TYPE", !"int"}
!6 = !{!"float*", !"float*", !"float*", !"float*", !"float*", !"float", !"float", !"int"}
!7 = !{!"", !"", !"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
