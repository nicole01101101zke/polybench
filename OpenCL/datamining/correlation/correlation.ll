; ModuleID = '../datamining/correlation/correlation.cl'
source_filename = "../datamining/correlation/correlation.cl"
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
define dso_local spir_kernel void @std_kernel(float* nocapture readonly %0, float* nocapture %1, float* nocapture readonly %2, float %3, float %4, i32 %5, i32 %6) local_unnamed_addr #0 !kernel_arg_addr_space !13 !kernel_arg_access_qual !14 !kernel_arg_type !15 !kernel_arg_base_type !16 !kernel_arg_type_qual !17 {
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %9 = trunc i64 %8 to i32
  %10 = icmp slt i32 %9, %5
  br i1 %10, label %11, label %67

11:                                               ; preds = %7
  %12 = shl i64 %8, 32
  %13 = ashr exact i64 %12, 32
  %14 = getelementptr inbounds float, float* %1, i64 %13
  store float 0.000000e+00, float* %14, align 4, !tbaa !8
  %15 = icmp sgt i32 %6, 0
  br i1 %15, label %16, label %61

16:                                               ; preds = %11
  %17 = getelementptr inbounds float, float* %0, i64 %13
  %18 = sext i32 %5 to i64
  %19 = shl i64 %8, 32
  %20 = ashr exact i64 %19, 32
  %21 = zext i32 %6 to i64
  %22 = and i64 %21, 1
  %23 = icmp eq i32 %6, 1
  br i1 %23, label %48, label %24

24:                                               ; preds = %16
  %25 = sub nsw i64 %21, %22
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi float [ 0.000000e+00, %24 ], [ %44, %26 ]
  %28 = phi i64 [ 0, %24 ], [ %45, %26 ]
  %29 = phi i64 [ %25, %24 ], [ %46, %26 ]
  %30 = mul nsw i64 %28, %18
  %31 = add nsw i64 %30, %20
  %32 = getelementptr inbounds float, float* %2, i64 %31
  %33 = load float, float* %32, align 4, !tbaa !8
  %34 = load float, float* %17, align 4, !tbaa !8
  %35 = fsub float %33, %34
  %36 = tail call float @llvm.fmuladd.f32(float %35, float %35, float %27)
  store float %36, float* %14, align 4, !tbaa !8
  %37 = or i64 %28, 1
  %38 = mul nsw i64 %37, %18
  %39 = add nsw i64 %38, %20
  %40 = getelementptr inbounds float, float* %2, i64 %39
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = load float, float* %17, align 4, !tbaa !8
  %43 = fsub float %41, %42
  %44 = tail call float @llvm.fmuladd.f32(float %43, float %43, float %36)
  store float %44, float* %14, align 4, !tbaa !8
  %45 = add nuw nsw i64 %28, 2
  %46 = add i64 %29, -2
  %47 = icmp eq i64 %46, 0
  br i1 %47, label %48, label %26

48:                                               ; preds = %26, %16
  %49 = phi float [ undef, %16 ], [ %44, %26 ]
  %50 = phi float [ 0.000000e+00, %16 ], [ %44, %26 ]
  %51 = phi i64 [ 0, %16 ], [ %45, %26 ]
  %52 = icmp eq i64 %22, 0
  br i1 %52, label %61, label %53

53:                                               ; preds = %48
  %54 = mul nsw i64 %51, %18
  %55 = add nsw i64 %54, %20
  %56 = getelementptr inbounds float, float* %2, i64 %55
  %57 = load float, float* %56, align 4, !tbaa !8
  %58 = load float, float* %17, align 4, !tbaa !8
  %59 = fsub float %57, %58
  %60 = tail call float @llvm.fmuladd.f32(float %59, float %59, float %50)
  store float %60, float* %14, align 4, !tbaa !8
  br label %61

61:                                               ; preds = %53, %48, %11
  %62 = phi float [ 0.000000e+00, %11 ], [ %49, %48 ], [ %60, %53 ]
  %63 = fdiv float %62, %3, !fpmath !12
  %64 = tail call float @_Z4sqrtf(float %63) #3
  %65 = fcmp ugt float %64, %4
  %66 = select i1 %65, float %64, float 1.000000e+00
  store float %66, float* %14, align 4, !tbaa !8
  br label %67

67:                                               ; preds = %61, %7
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z4sqrtf(float) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @reduce_kernel(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, float %3, i32 %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !18 !kernel_arg_access_qual !19 !kernel_arg_type !20 !kernel_arg_base_type !21 !kernel_arg_type_qual !22 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, %5
  %12 = icmp slt i32 %8, %4
  %13 = and i1 %12, %11
  br i1 %13, label %14, label %30

14:                                               ; preds = %6
  %15 = shl i64 %7, 32
  %16 = ashr exact i64 %15, 32
  %17 = getelementptr inbounds float, float* %0, i64 %16
  %18 = load float, float* %17, align 4, !tbaa !8
  %19 = mul nsw i32 %10, %4
  %20 = add nsw i32 %19, %8
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %2, i64 %21
  %23 = load float, float* %22, align 4, !tbaa !8
  %24 = fsub float %23, %18
  store float %24, float* %22, align 4, !tbaa !8
  %25 = tail call float @_Z4sqrtf(float %3) #3
  %26 = getelementptr inbounds float, float* %1, i64 %16
  %27 = load float, float* %26, align 4, !tbaa !8
  %28 = fmul float %25, %27
  %29 = fdiv float %24, %28, !fpmath !12
  store float %29, float* %22, align 4, !tbaa !8
  br label %30

30:                                               ; preds = %14, %6
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @corr_kernel(float* nocapture %0, float* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !23 !kernel_arg_access_qual !24 !kernel_arg_type !25 !kernel_arg_base_type !26 !kernel_arg_type_qual !27 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = add nsw i32 %2, -1
  %8 = icmp sgt i32 %7, %6
  br i1 %8, label %9, label %81

9:                                                ; preds = %4
  %10 = mul nsw i32 %6, %2
  %11 = add nsw i32 %10, %6
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float* %0, i64 %12
  store float 1.000000e+00, float* %13, align 4, !tbaa !8
  %14 = add nsw i32 %6, 1
  %15 = icmp slt i32 %14, %2
  br i1 %15, label %16, label %81

16:                                               ; preds = %9
  %17 = icmp sgt i32 %3, 0
  %18 = sext i32 %2 to i64
  %19 = shl i64 %5, 32
  %20 = ashr exact i64 %19, 32
  %21 = add nsw i64 %20, 1
  %22 = sext i32 %10 to i64
  %23 = zext i32 %3 to i64
  %24 = and i64 %23, 1
  %25 = icmp eq i32 %3, 1
  %26 = sub nsw i64 %23, %24
  %27 = icmp eq i64 %24, 0
  br label %28

28:                                               ; preds = %70, %16
  %29 = phi i64 [ %21, %16 ], [ %78, %70 ]
  %30 = add nsw i64 %29, %22
  br i1 %17, label %31, label %70

31:                                               ; preds = %28
  %32 = getelementptr inbounds float, float* %0, i64 %30
  %33 = load float, float* %32, align 4, !tbaa !8
  br i1 %25, label %58, label %34

34:                                               ; preds = %31, %34
  %35 = phi float [ %54, %34 ], [ %33, %31 ]
  %36 = phi i64 [ %55, %34 ], [ 0, %31 ]
  %37 = phi i64 [ %56, %34 ], [ %26, %31 ]
  %38 = mul nsw i64 %36, %18
  %39 = add nsw i64 %38, %20
  %40 = getelementptr inbounds float, float* %1, i64 %39
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = add nsw i64 %38, %29
  %43 = getelementptr inbounds float, float* %1, i64 %42
  %44 = load float, float* %43, align 4, !tbaa !8
  %45 = tail call float @llvm.fmuladd.f32(float %41, float %44, float %35)
  store float %45, float* %32, align 4, !tbaa !8
  %46 = or i64 %36, 1
  %47 = mul nsw i64 %46, %18
  %48 = add nsw i64 %47, %20
  %49 = getelementptr inbounds float, float* %1, i64 %48
  %50 = load float, float* %49, align 4, !tbaa !8
  %51 = add nsw i64 %47, %29
  %52 = getelementptr inbounds float, float* %1, i64 %51
  %53 = load float, float* %52, align 4, !tbaa !8
  %54 = tail call float @llvm.fmuladd.f32(float %50, float %53, float %45)
  store float %54, float* %32, align 4, !tbaa !8
  %55 = add nuw nsw i64 %36, 2
  %56 = add i64 %37, -2
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %58, label %34

58:                                               ; preds = %34, %31
  %59 = phi float [ %33, %31 ], [ %54, %34 ]
  %60 = phi i64 [ 0, %31 ], [ %55, %34 ]
  br i1 %27, label %70, label %61

61:                                               ; preds = %58
  %62 = mul nsw i64 %60, %18
  %63 = add nsw i64 %62, %20
  %64 = getelementptr inbounds float, float* %1, i64 %63
  %65 = load float, float* %64, align 4, !tbaa !8
  %66 = add nsw i64 %62, %29
  %67 = getelementptr inbounds float, float* %1, i64 %66
  %68 = load float, float* %67, align 4, !tbaa !8
  %69 = tail call float @llvm.fmuladd.f32(float %65, float %68, float %59)
  store float %69, float* %32, align 4, !tbaa !8
  br label %70

70:                                               ; preds = %61, %58, %28
  %71 = getelementptr inbounds float, float* %0, i64 %30
  %72 = bitcast float* %71 to i32*
  %73 = load i32, i32* %72, align 4, !tbaa !8
  %74 = mul nsw i64 %29, %18
  %75 = add nsw i64 %74, %20
  %76 = getelementptr inbounds float, float* %0, i64 %75
  %77 = bitcast float* %76 to i32*
  store i32 %73, i32* %77, align 4, !tbaa !8
  %78 = add i64 %29, 1
  %79 = trunc i64 %78 to i32
  %80 = icmp eq i32 %79, %2
  br i1 %80, label %81, label %28

81:                                               ; preds = %70, %9, %4
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
!13 = !{i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0}
!14 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!15 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE", !"DATA_TYPE", !"int", !"int"}
!16 = !{!"float*", !"float*", !"float*", !"float", !"float", !"int", !"int"}
!17 = !{!"", !"", !"", !"", !"", !"", !""}
!18 = !{i32 1, i32 1, i32 1, i32 0, i32 0, i32 0}
!19 = !{!"none", !"none", !"none", !"none", !"none", !"none"}
!20 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE", !"int", !"int"}
!21 = !{!"float*", !"float*", !"float*", !"float", !"int", !"int"}
!22 = !{!"", !"", !"", !"", !"", !""}
!23 = !{i32 1, i32 1, i32 0, i32 0}
!24 = !{!"none", !"none", !"none", !"none"}
!25 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int"}
!26 = !{!"float*", !"float*", !"int", !"int"}
!27 = !{!"", !"", !"", !""}
