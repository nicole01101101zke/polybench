; ModuleID = '../linear-algebra/kernels/bicg/bicg.cl'
source_filename = "../linear-algebra/kernels/bicg/bicg.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @bicgKernel1(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = icmp slt i32 %7, %3
  br i1 %8, label %9, label %53

9:                                                ; preds = %5
  %10 = shl i64 %6, 32
  %11 = ashr exact i64 %10, 32
  %12 = getelementptr inbounds float, float* %2, i64 %11
  store float 0.000000e+00, float* %12, align 4, !tbaa !8
  %13 = icmp sgt i32 %4, 0
  br i1 %13, label %14, label %53

14:                                               ; preds = %9
  %15 = mul nsw i32 %7, %4
  %16 = sext i32 %15 to i64
  %17 = zext i32 %4 to i64
  %18 = and i64 %17, 1
  %19 = icmp eq i32 %4, 1
  br i1 %19, label %42, label %20

20:                                               ; preds = %14
  %21 = sub nsw i64 %17, %18
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi float [ 0.000000e+00, %20 ], [ %38, %22 ]
  %24 = phi i64 [ 0, %20 ], [ %39, %22 ]
  %25 = phi i64 [ %21, %20 ], [ %40, %22 ]
  %26 = add nsw i64 %24, %16
  %27 = getelementptr inbounds float, float* %0, i64 %26
  %28 = load float, float* %27, align 4, !tbaa !8
  %29 = getelementptr inbounds float, float* %1, i64 %24
  %30 = load float, float* %29, align 4, !tbaa !8
  %31 = tail call float @llvm.fmuladd.f32(float %28, float %30, float %23)
  store float %31, float* %12, align 4, !tbaa !8
  %32 = or i64 %24, 1
  %33 = add nsw i64 %32, %16
  %34 = getelementptr inbounds float, float* %0, i64 %33
  %35 = load float, float* %34, align 4, !tbaa !8
  %36 = getelementptr inbounds float, float* %1, i64 %32
  %37 = load float, float* %36, align 4, !tbaa !8
  %38 = tail call float @llvm.fmuladd.f32(float %35, float %37, float %31)
  store float %38, float* %12, align 4, !tbaa !8
  %39 = add nuw nsw i64 %24, 2
  %40 = add i64 %25, -2
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %42, label %22

42:                                               ; preds = %22, %14
  %43 = phi float [ 0.000000e+00, %14 ], [ %38, %22 ]
  %44 = phi i64 [ 0, %14 ], [ %39, %22 ]
  %45 = icmp eq i64 %18, 0
  br i1 %45, label %53, label %46

46:                                               ; preds = %42
  %47 = add nsw i64 %44, %16
  %48 = getelementptr inbounds float, float* %0, i64 %47
  %49 = load float, float* %48, align 4, !tbaa !8
  %50 = getelementptr inbounds float, float* %1, i64 %44
  %51 = load float, float* %50, align 4, !tbaa !8
  %52 = tail call float @llvm.fmuladd.f32(float %49, float %51, float %43)
  store float %52, float* %12, align 4, !tbaa !8
  br label %53

53:                                               ; preds = %46, %42, %9, %5
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @bicgKernel2(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = icmp slt i32 %7, %4
  br i1 %8, label %9, label %57

9:                                                ; preds = %5
  %10 = shl i64 %6, 32
  %11 = ashr exact i64 %10, 32
  %12 = getelementptr inbounds float, float* %2, i64 %11
  store float 0.000000e+00, float* %12, align 4, !tbaa !8
  %13 = icmp sgt i32 %3, 0
  br i1 %13, label %14, label %57

14:                                               ; preds = %9
  %15 = sext i32 %4 to i64
  %16 = shl i64 %6, 32
  %17 = ashr exact i64 %16, 32
  %18 = zext i32 %3 to i64
  %19 = and i64 %18, 1
  %20 = icmp eq i32 %3, 1
  br i1 %20, label %45, label %21

21:                                               ; preds = %14
  %22 = sub nsw i64 %18, %19
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi float [ 0.000000e+00, %21 ], [ %41, %23 ]
  %25 = phi i64 [ 0, %21 ], [ %42, %23 ]
  %26 = phi i64 [ %22, %21 ], [ %43, %23 ]
  %27 = mul nsw i64 %25, %15
  %28 = add nsw i64 %27, %17
  %29 = getelementptr inbounds float, float* %0, i64 %28
  %30 = load float, float* %29, align 4, !tbaa !8
  %31 = getelementptr inbounds float, float* %1, i64 %25
  %32 = load float, float* %31, align 4, !tbaa !8
  %33 = tail call float @llvm.fmuladd.f32(float %30, float %32, float %24)
  store float %33, float* %12, align 4, !tbaa !8
  %34 = or i64 %25, 1
  %35 = mul nsw i64 %34, %15
  %36 = add nsw i64 %35, %17
  %37 = getelementptr inbounds float, float* %0, i64 %36
  %38 = load float, float* %37, align 4, !tbaa !8
  %39 = getelementptr inbounds float, float* %1, i64 %34
  %40 = load float, float* %39, align 4, !tbaa !8
  %41 = tail call float @llvm.fmuladd.f32(float %38, float %40, float %33)
  store float %41, float* %12, align 4, !tbaa !8
  %42 = add nuw nsw i64 %25, 2
  %43 = add i64 %26, -2
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %45, label %23

45:                                               ; preds = %23, %14
  %46 = phi float [ 0.000000e+00, %14 ], [ %41, %23 ]
  %47 = phi i64 [ 0, %14 ], [ %42, %23 ]
  %48 = icmp eq i64 %19, 0
  br i1 %48, label %57, label %49

49:                                               ; preds = %45
  %50 = mul nsw i64 %47, %15
  %51 = add nsw i64 %50, %17
  %52 = getelementptr inbounds float, float* %0, i64 %51
  %53 = load float, float* %52, align 4, !tbaa !8
  %54 = getelementptr inbounds float, float* %1, i64 %47
  %55 = load float, float* %54, align 4, !tbaa !8
  %56 = tail call float @llvm.fmuladd.f32(float %53, float %55, float %46)
  store float %56, float* %12, align 4, !tbaa !8
  br label %57

57:                                               ; preds = %49, %45, %9, %5
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
!3 = !{i32 1, i32 1, i32 1, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int"}
!6 = !{!"float*", !"float*", !"float*", !"int", !"int"}
!7 = !{!"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
