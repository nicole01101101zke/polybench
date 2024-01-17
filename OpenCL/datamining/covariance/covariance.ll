; ModuleID = '../datamining/covariance/covariance.cl'
source_filename = "../datamining/covariance/covariance.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @mean_kernel(float* nocapture %0, float* nocapture readonly %1, float %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = icmp slt i32 %7, %3
  br i1 %8, label %9, label %55

9:                                                ; preds = %5
  %10 = shl i64 %6, 32
  %11 = ashr exact i64 %10, 32
  %12 = getelementptr inbounds float, float* %0, i64 %11
  store float 0.000000e+00, float* %12, align 4, !tbaa !8
  %13 = icmp sgt i32 %4, 0
  br i1 %13, label %14, label %52

14:                                               ; preds = %9
  %15 = sext i32 %3 to i64
  %16 = shl i64 %6, 32
  %17 = ashr exact i64 %16, 32
  %18 = zext i32 %4 to i64
  %19 = and i64 %18, 1
  %20 = icmp eq i32 %4, 1
  br i1 %20, label %41, label %21

21:                                               ; preds = %14
  %22 = sub nsw i64 %18, %19
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi float [ 0.000000e+00, %21 ], [ %37, %23 ]
  %25 = phi i64 [ 0, %21 ], [ %38, %23 ]
  %26 = phi i64 [ %22, %21 ], [ %39, %23 ]
  %27 = mul nsw i64 %25, %15
  %28 = add nsw i64 %27, %17
  %29 = getelementptr inbounds float, float* %1, i64 %28
  %30 = load float, float* %29, align 4, !tbaa !8
  %31 = fadd float %30, %24
  store float %31, float* %12, align 4, !tbaa !8
  %32 = or i64 %25, 1
  %33 = mul nsw i64 %32, %15
  %34 = add nsw i64 %33, %17
  %35 = getelementptr inbounds float, float* %1, i64 %34
  %36 = load float, float* %35, align 4, !tbaa !8
  %37 = fadd float %36, %31
  store float %37, float* %12, align 4, !tbaa !8
  %38 = add nuw nsw i64 %25, 2
  %39 = add i64 %26, -2
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %41, label %23

41:                                               ; preds = %23, %14
  %42 = phi float [ undef, %14 ], [ %37, %23 ]
  %43 = phi float [ 0.000000e+00, %14 ], [ %37, %23 ]
  %44 = phi i64 [ 0, %14 ], [ %38, %23 ]
  %45 = icmp eq i64 %19, 0
  br i1 %45, label %52, label %46

46:                                               ; preds = %41
  %47 = mul nsw i64 %44, %15
  %48 = add nsw i64 %47, %17
  %49 = getelementptr inbounds float, float* %1, i64 %48
  %50 = load float, float* %49, align 4, !tbaa !8
  %51 = fadd float %50, %43
  store float %51, float* %12, align 4, !tbaa !8
  br label %52

52:                                               ; preds = %46, %41, %9
  %53 = phi float [ 0.000000e+00, %9 ], [ %42, %41 ], [ %51, %46 ]
  %54 = fdiv float %53, %2, !fpmath !12
  store float %54, float* %12, align 4, !tbaa !8
  br label %55

55:                                               ; preds = %52, %5
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @reduce_kernel(float* nocapture readonly %0, float* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !13 !kernel_arg_access_qual !14 !kernel_arg_type !15 !kernel_arg_base_type !16 !kernel_arg_type_qual !17 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %8 = trunc i64 %7 to i32
  %9 = icmp slt i32 %8, %3
  %10 = icmp slt i32 %6, %2
  %11 = and i1 %10, %9
  br i1 %11, label %12, label %23

12:                                               ; preds = %4
  %13 = shl i64 %5, 32
  %14 = ashr exact i64 %13, 32
  %15 = getelementptr inbounds float, float* %0, i64 %14
  %16 = load float, float* %15, align 4, !tbaa !8
  %17 = mul nsw i32 %8, %2
  %18 = add nsw i32 %17, %6
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %1, i64 %19
  %21 = load float, float* %20, align 4, !tbaa !8
  %22 = fsub float %21, %16
  store float %22, float* %20, align 4, !tbaa !8
  br label %23

23:                                               ; preds = %12, %4
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @covar_kernel(float* nocapture %0, float* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !13 !kernel_arg_access_qual !14 !kernel_arg_type !15 !kernel_arg_base_type !16 !kernel_arg_type_qual !17 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = icmp slt i32 %6, %2
  br i1 %7, label %8, label %73

8:                                                ; preds = %4
  %9 = mul nsw i32 %6, %2
  %10 = icmp sgt i32 %3, 0
  %11 = sext i32 %2 to i64
  %12 = shl i64 %5, 32
  %13 = ashr exact i64 %12, 32
  %14 = sext i32 %9 to i64
  %15 = zext i32 %3 to i64
  %16 = and i64 %15, 1
  %17 = icmp eq i32 %3, 1
  %18 = sub nsw i64 %15, %16
  %19 = icmp eq i64 %16, 0
  br label %20

20:                                               ; preds = %65, %8
  %21 = phi i64 [ %13, %8 ], [ %71, %65 ]
  %22 = add nsw i64 %21, %14
  %23 = getelementptr inbounds float, float* %0, i64 %22
  store float 0.000000e+00, float* %23, align 4, !tbaa !8
  br i1 %10, label %24, label %65

24:                                               ; preds = %20
  br i1 %17, label %49, label %25

25:                                               ; preds = %24, %25
  %26 = phi float [ %45, %25 ], [ 0.000000e+00, %24 ]
  %27 = phi i64 [ %46, %25 ], [ 0, %24 ]
  %28 = phi i64 [ %47, %25 ], [ %18, %24 ]
  %29 = mul nsw i64 %27, %11
  %30 = add nsw i64 %29, %13
  %31 = getelementptr inbounds float, float* %1, i64 %30
  %32 = load float, float* %31, align 4, !tbaa !8
  %33 = add nsw i64 %29, %21
  %34 = getelementptr inbounds float, float* %1, i64 %33
  %35 = load float, float* %34, align 4, !tbaa !8
  %36 = tail call float @llvm.fmuladd.f32(float %32, float %35, float %26)
  store float %36, float* %23, align 4, !tbaa !8
  %37 = or i64 %27, 1
  %38 = mul nsw i64 %37, %11
  %39 = add nsw i64 %38, %13
  %40 = getelementptr inbounds float, float* %1, i64 %39
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = add nsw i64 %38, %21
  %43 = getelementptr inbounds float, float* %1, i64 %42
  %44 = load float, float* %43, align 4, !tbaa !8
  %45 = tail call float @llvm.fmuladd.f32(float %41, float %44, float %36)
  store float %45, float* %23, align 4, !tbaa !8
  %46 = add nuw nsw i64 %27, 2
  %47 = add i64 %28, -2
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %49, label %25

49:                                               ; preds = %25, %24
  %50 = phi float [ undef, %24 ], [ %45, %25 ]
  %51 = phi float [ 0.000000e+00, %24 ], [ %45, %25 ]
  %52 = phi i64 [ 0, %24 ], [ %46, %25 ]
  br i1 %19, label %62, label %53

53:                                               ; preds = %49
  %54 = mul nsw i64 %52, %11
  %55 = add nsw i64 %54, %13
  %56 = getelementptr inbounds float, float* %1, i64 %55
  %57 = load float, float* %56, align 4, !tbaa !8
  %58 = add nsw i64 %54, %21
  %59 = getelementptr inbounds float, float* %1, i64 %58
  %60 = load float, float* %59, align 4, !tbaa !8
  %61 = tail call float @llvm.fmuladd.f32(float %57, float %60, float %51)
  store float %61, float* %23, align 4, !tbaa !8
  br label %62

62:                                               ; preds = %49, %53
  %63 = phi float [ %50, %49 ], [ %61, %53 ]
  %64 = bitcast float %63 to i32
  br label %65

65:                                               ; preds = %62, %20
  %66 = phi i32 [ %64, %62 ], [ 0, %20 ]
  %67 = mul nsw i64 %21, %11
  %68 = add nsw i64 %67, %13
  %69 = getelementptr inbounds float, float* %0, i64 %68
  %70 = bitcast float* %69 to i32*
  store i32 %66, i32* %70, align 4, !tbaa !8
  %71 = add nsw i64 %21, 1
  %72 = icmp eq i64 %71, %11
  br i1 %72, label %73, label %20

73:                                               ; preds = %65, %4
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
!3 = !{i32 1, i32 1, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE", !"int", !"int"}
!6 = !{!"float*", !"float*", !"float", !"int", !"int"}
!7 = !{!"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{float 2.500000e+00}
!13 = !{i32 1, i32 1, i32 0, i32 0}
!14 = !{!"none", !"none", !"none", !"none"}
!15 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int"}
!16 = !{!"float*", !"float*", !"int", !"int"}
!17 = !{!"", !"", !"", !""}
