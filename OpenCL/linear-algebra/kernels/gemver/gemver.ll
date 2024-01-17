; ModuleID = '../linear-algebra/kernels/gemver/gemver.cl'
source_filename = "../linear-algebra/kernels/gemver/gemver.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @gemver_kernel1(float* nocapture %0, float* nocapture readonly %1, float* nocapture readonly %2, float* nocapture readonly %3, float* nocapture readonly %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, %5
  %12 = icmp slt i32 %8, %5
  %13 = and i1 %12, %11
  br i1 %13, label %14, label %35

14:                                               ; preds = %6
  %15 = shl i64 %9, 32
  %16 = ashr exact i64 %15, 32
  %17 = getelementptr inbounds float, float* %3, i64 %16
  %18 = load float, float* %17, align 4, !tbaa !8
  %19 = shl i64 %7, 32
  %20 = ashr exact i64 %19, 32
  %21 = getelementptr inbounds float, float* %1, i64 %20
  %22 = load float, float* %21, align 4, !tbaa !8
  %23 = getelementptr inbounds float, float* %4, i64 %16
  %24 = load float, float* %23, align 4, !tbaa !8
  %25 = getelementptr inbounds float, float* %2, i64 %20
  %26 = load float, float* %25, align 4, !tbaa !8
  %27 = fmul float %24, %26
  %28 = tail call float @llvm.fmuladd.f32(float %18, float %22, float %27)
  %29 = mul nsw i32 %10, %5
  %30 = add nsw i32 %29, %8
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float* %0, i64 %31
  %33 = load float, float* %32, align 4, !tbaa !8
  %34 = fadd float %33, %28
  store float %34, float* %32, align 4, !tbaa !8
  br label %35

35:                                               ; preds = %14, %6
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @gemver_kernel2(float* nocapture readonly %0, float* nocapture %1, float* nocapture readonly %2, float* nocapture readonly %3, float %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !12 !kernel_arg_access_qual !4 !kernel_arg_type !13 !kernel_arg_base_type !14 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = icmp slt i32 %8, %5
  br i1 %9, label %10, label %68

10:                                               ; preds = %6
  %11 = icmp sgt i32 %5, 0
  %12 = shl i64 %7, 32
  %13 = ashr exact i64 %12, 32
  br i1 %11, label %14, label %62

14:                                               ; preds = %10
  %15 = getelementptr inbounds float, float* %1, i64 %13
  %16 = zext i32 %5 to i64
  %17 = shl i64 %7, 32
  %18 = ashr exact i64 %17, 32
  %19 = zext i32 %5 to i64
  %20 = load float, float* %15, align 4, !tbaa !8
  %21 = and i64 %19, 1
  %22 = icmp eq i32 %5, 1
  br i1 %22, label %49, label %23

23:                                               ; preds = %14
  %24 = sub nsw i64 %19, %21
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi float [ %20, %23 ], [ %45, %25 ]
  %27 = phi i64 [ 0, %23 ], [ %46, %25 ]
  %28 = phi i64 [ %24, %23 ], [ %47, %25 ]
  %29 = mul nsw i64 %27, %16
  %30 = add nsw i64 %29, %18
  %31 = getelementptr inbounds float, float* %0, i64 %30
  %32 = load float, float* %31, align 4, !tbaa !8
  %33 = fmul float %32, %4
  %34 = getelementptr inbounds float, float* %2, i64 %27
  %35 = load float, float* %34, align 4, !tbaa !8
  %36 = tail call float @llvm.fmuladd.f32(float %33, float %35, float %26)
  store float %36, float* %15, align 4, !tbaa !8
  %37 = or i64 %27, 1
  %38 = mul nsw i64 %37, %16
  %39 = add nsw i64 %38, %18
  %40 = getelementptr inbounds float, float* %0, i64 %39
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = fmul float %41, %4
  %43 = getelementptr inbounds float, float* %2, i64 %37
  %44 = load float, float* %43, align 4, !tbaa !8
  %45 = tail call float @llvm.fmuladd.f32(float %42, float %44, float %36)
  store float %45, float* %15, align 4, !tbaa !8
  %46 = add nuw nsw i64 %27, 2
  %47 = add i64 %28, -2
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %49, label %25

49:                                               ; preds = %25, %14
  %50 = phi float [ %20, %14 ], [ %45, %25 ]
  %51 = phi i64 [ 0, %14 ], [ %46, %25 ]
  %52 = icmp eq i64 %21, 0
  br i1 %52, label %62, label %53

53:                                               ; preds = %49
  %54 = mul nsw i64 %51, %16
  %55 = add nsw i64 %54, %18
  %56 = getelementptr inbounds float, float* %0, i64 %55
  %57 = load float, float* %56, align 4, !tbaa !8
  %58 = fmul float %57, %4
  %59 = getelementptr inbounds float, float* %2, i64 %51
  %60 = load float, float* %59, align 4, !tbaa !8
  %61 = tail call float @llvm.fmuladd.f32(float %58, float %60, float %50)
  store float %61, float* %15, align 4, !tbaa !8
  br label %62

62:                                               ; preds = %53, %49, %10
  %63 = getelementptr inbounds float, float* %3, i64 %13
  %64 = load float, float* %63, align 4, !tbaa !8
  %65 = getelementptr inbounds float, float* %1, i64 %13
  %66 = load float, float* %65, align 4, !tbaa !8
  %67 = fadd float %64, %66
  store float %67, float* %65, align 4, !tbaa !8
  br label %68

68:                                               ; preds = %62, %6
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @gemver_kernel3(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, float %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !15 !kernel_arg_access_qual !16 !kernel_arg_type !17 !kernel_arg_base_type !18 !kernel_arg_type_qual !19 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = icmp slt i32 %7, %4
  %9 = icmp sgt i32 %4, 0
  %10 = and i1 %8, %9
  br i1 %10, label %11, label %57

11:                                               ; preds = %5
  %12 = mul nsw i32 %7, %4
  %13 = shl i64 %6, 32
  %14 = ashr exact i64 %13, 32
  %15 = getelementptr inbounds float, float* %2, i64 %14
  %16 = sext i32 %12 to i64
  %17 = zext i32 %4 to i64
  %18 = load float, float* %15, align 4, !tbaa !8
  %19 = and i64 %17, 1
  %20 = icmp eq i32 %4, 1
  br i1 %20, label %45, label %21

21:                                               ; preds = %11
  %22 = sub nsw i64 %17, %19
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi float [ %18, %21 ], [ %41, %23 ]
  %25 = phi i64 [ 0, %21 ], [ %42, %23 ]
  %26 = phi i64 [ %22, %21 ], [ %43, %23 ]
  %27 = add nsw i64 %25, %16
  %28 = getelementptr inbounds float, float* %0, i64 %27
  %29 = load float, float* %28, align 4, !tbaa !8
  %30 = fmul float %29, %3
  %31 = getelementptr inbounds float, float* %1, i64 %25
  %32 = load float, float* %31, align 4, !tbaa !8
  %33 = tail call float @llvm.fmuladd.f32(float %30, float %32, float %24)
  store float %33, float* %15, align 4, !tbaa !8
  %34 = or i64 %25, 1
  %35 = add nsw i64 %34, %16
  %36 = getelementptr inbounds float, float* %0, i64 %35
  %37 = load float, float* %36, align 4, !tbaa !8
  %38 = fmul float %37, %3
  %39 = getelementptr inbounds float, float* %1, i64 %34
  %40 = load float, float* %39, align 4, !tbaa !8
  %41 = tail call float @llvm.fmuladd.f32(float %38, float %40, float %33)
  store float %41, float* %15, align 4, !tbaa !8
  %42 = add nuw nsw i64 %25, 2
  %43 = add i64 %26, -2
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %45, label %23

45:                                               ; preds = %23, %11
  %46 = phi float [ %18, %11 ], [ %41, %23 ]
  %47 = phi i64 [ 0, %11 ], [ %42, %23 ]
  %48 = icmp eq i64 %19, 0
  br i1 %48, label %57, label %49

49:                                               ; preds = %45
  %50 = add nsw i64 %47, %16
  %51 = getelementptr inbounds float, float* %0, i64 %50
  %52 = load float, float* %51, align 4, !tbaa !8
  %53 = fmul float %52, %3
  %54 = getelementptr inbounds float, float* %1, i64 %47
  %55 = load float, float* %54, align 4, !tbaa !8
  %56 = tail call float @llvm.fmuladd.f32(float %53, float %55, float %46)
  store float %56, float* %15, align 4, !tbaa !8
  br label %57

57:                                               ; preds = %49, %45, %5
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
!3 = !{i32 1, i32 1, i32 1, i32 1, i32 1, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"int"}
!6 = !{!"float*", !"float*", !"float*", !"float*", !"float*", !"int"}
!7 = !{!"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{i32 1, i32 1, i32 1, i32 1, i32 0, i32 0}
!13 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE", !"int"}
!14 = !{!"float*", !"float*", !"float*", !"float*", !"float", !"int"}
!15 = !{i32 1, i32 1, i32 1, i32 0, i32 0}
!16 = !{!"none", !"none", !"none", !"none", !"none"}
!17 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE", !"int"}
!18 = !{!"float*", !"float*", !"float*", !"float", !"int"}
!19 = !{!"", !"", !"", !"", !""}
