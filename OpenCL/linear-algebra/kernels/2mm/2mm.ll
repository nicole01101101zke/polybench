; ModuleID = '../linear-algebra/kernels/2mm/2mm.cl'
source_filename = "../linear-algebra/kernels/2mm/2mm.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @mm2_kernel1(float* nocapture %0, float* nocapture readonly %1, float* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7, float %8) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %10 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %11 = trunc i64 %10 to i32
  %12 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %13 = trunc i64 %12 to i32
  %14 = icmp slt i32 %13, %3
  %15 = icmp slt i32 %11, %4
  %16 = and i1 %15, %14
  br i1 %16, label %17, label %74

17:                                               ; preds = %9
  %18 = mul nsw i32 %13, %4
  %19 = add nsw i32 %18, %11
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float* %0, i64 %20
  store float 0.000000e+00, float* %21, align 4, !tbaa !8
  %22 = icmp sgt i32 %5, 0
  br i1 %22, label %23, label %74

23:                                               ; preds = %17
  %24 = mul nsw i32 %13, %5
  %25 = sext i32 %4 to i64
  %26 = shl i64 %10, 32
  %27 = ashr exact i64 %26, 32
  %28 = sext i32 %24 to i64
  %29 = zext i32 %5 to i64
  %30 = and i64 %29, 1
  %31 = icmp eq i32 %5, 1
  br i1 %31, label %60, label %32

32:                                               ; preds = %23
  %33 = sub nsw i64 %29, %30
  br label %34

34:                                               ; preds = %34, %32
  %35 = phi float [ 0.000000e+00, %32 ], [ %56, %34 ]
  %36 = phi i64 [ 0, %32 ], [ %57, %34 ]
  %37 = phi i64 [ %33, %32 ], [ %58, %34 ]
  %38 = add nsw i64 %36, %28
  %39 = getelementptr inbounds float, float* %1, i64 %38
  %40 = load float, float* %39, align 4, !tbaa !8
  %41 = fmul float %40, %7
  %42 = mul nsw i64 %36, %25
  %43 = add nsw i64 %42, %27
  %44 = getelementptr inbounds float, float* %2, i64 %43
  %45 = load float, float* %44, align 4, !tbaa !8
  %46 = tail call float @llvm.fmuladd.f32(float %41, float %45, float %35)
  store float %46, float* %21, align 4, !tbaa !8
  %47 = or i64 %36, 1
  %48 = add nsw i64 %47, %28
  %49 = getelementptr inbounds float, float* %1, i64 %48
  %50 = load float, float* %49, align 4, !tbaa !8
  %51 = fmul float %50, %7
  %52 = mul nsw i64 %47, %25
  %53 = add nsw i64 %52, %27
  %54 = getelementptr inbounds float, float* %2, i64 %53
  %55 = load float, float* %54, align 4, !tbaa !8
  %56 = tail call float @llvm.fmuladd.f32(float %51, float %55, float %46)
  store float %56, float* %21, align 4, !tbaa !8
  %57 = add nuw nsw i64 %36, 2
  %58 = add i64 %37, -2
  %59 = icmp eq i64 %58, 0
  br i1 %59, label %60, label %34

60:                                               ; preds = %34, %23
  %61 = phi float [ 0.000000e+00, %23 ], [ %56, %34 ]
  %62 = phi i64 [ 0, %23 ], [ %57, %34 ]
  %63 = icmp eq i64 %30, 0
  br i1 %63, label %74, label %64

64:                                               ; preds = %60
  %65 = add nsw i64 %62, %28
  %66 = getelementptr inbounds float, float* %1, i64 %65
  %67 = load float, float* %66, align 4, !tbaa !8
  %68 = fmul float %67, %7
  %69 = mul nsw i64 %62, %25
  %70 = add nsw i64 %69, %27
  %71 = getelementptr inbounds float, float* %2, i64 %70
  %72 = load float, float* %71, align 4, !tbaa !8
  %73 = tail call float @llvm.fmuladd.f32(float %68, float %72, float %61)
  store float %73, float* %21, align 4, !tbaa !8
  br label %74

74:                                               ; preds = %64, %60, %17, %9
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @mm2_kernel2(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7, float %8) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %10 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %11 = trunc i64 %10 to i32
  %12 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %13 = trunc i64 %12 to i32
  %14 = icmp slt i32 %13, %3
  %15 = icmp slt i32 %11, %6
  %16 = and i1 %15, %14
  br i1 %16, label %17, label %73

17:                                               ; preds = %9
  %18 = mul nsw i32 %13, %6
  %19 = add nsw i32 %18, %11
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float* %2, i64 %20
  %22 = load float, float* %21, align 4, !tbaa !8
  %23 = fmul float %22, %8
  store float %23, float* %21, align 4, !tbaa !8
  %24 = icmp sgt i32 %4, 0
  br i1 %24, label %25, label %73

25:                                               ; preds = %17
  %26 = mul nsw i32 %13, %4
  %27 = sext i32 %6 to i64
  %28 = shl i64 %10, 32
  %29 = ashr exact i64 %28, 32
  %30 = sext i32 %26 to i64
  %31 = zext i32 %4 to i64
  %32 = and i64 %31, 1
  %33 = icmp eq i32 %4, 1
  br i1 %33, label %60, label %34

34:                                               ; preds = %25
  %35 = sub nsw i64 %31, %32
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi float [ %23, %34 ], [ %56, %36 ]
  %38 = phi i64 [ 0, %34 ], [ %57, %36 ]
  %39 = phi i64 [ %35, %34 ], [ %58, %36 ]
  %40 = add nsw i64 %38, %30
  %41 = getelementptr inbounds float, float* %0, i64 %40
  %42 = load float, float* %41, align 4, !tbaa !8
  %43 = mul nsw i64 %38, %27
  %44 = add nsw i64 %43, %29
  %45 = getelementptr inbounds float, float* %1, i64 %44
  %46 = load float, float* %45, align 4, !tbaa !8
  %47 = tail call float @llvm.fmuladd.f32(float %42, float %46, float %37)
  store float %47, float* %21, align 4, !tbaa !8
  %48 = or i64 %38, 1
  %49 = add nsw i64 %48, %30
  %50 = getelementptr inbounds float, float* %0, i64 %49
  %51 = load float, float* %50, align 4, !tbaa !8
  %52 = mul nsw i64 %48, %27
  %53 = add nsw i64 %52, %29
  %54 = getelementptr inbounds float, float* %1, i64 %53
  %55 = load float, float* %54, align 4, !tbaa !8
  %56 = tail call float @llvm.fmuladd.f32(float %51, float %55, float %47)
  store float %56, float* %21, align 4, !tbaa !8
  %57 = add nuw nsw i64 %38, 2
  %58 = add i64 %39, -2
  %59 = icmp eq i64 %58, 0
  br i1 %59, label %60, label %36

60:                                               ; preds = %36, %25
  %61 = phi float [ %23, %25 ], [ %56, %36 ]
  %62 = phi i64 [ 0, %25 ], [ %57, %36 ]
  %63 = icmp eq i64 %32, 0
  br i1 %63, label %73, label %64

64:                                               ; preds = %60
  %65 = add nsw i64 %62, %30
  %66 = getelementptr inbounds float, float* %0, i64 %65
  %67 = load float, float* %66, align 4, !tbaa !8
  %68 = mul nsw i64 %62, %27
  %69 = add nsw i64 %68, %29
  %70 = getelementptr inbounds float, float* %1, i64 %69
  %71 = load float, float* %70, align 4, !tbaa !8
  %72 = tail call float @llvm.fmuladd.f32(float %67, float %71, float %61)
  store float %72, float* %21, align 4, !tbaa !8
  br label %73

73:                                               ; preds = %64, %60, %17, %9
  ret void
}

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
!3 = !{i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int", !"int", !"int", !"DATA_TYPE", !"DATA_TYPE"}
!6 = !{!"float*", !"float*", !"float*", !"int", !"int", !"int", !"int", !"float", !"float"}
!7 = !{!"", !"", !"", !"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
