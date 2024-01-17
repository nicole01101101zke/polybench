; ModuleID = '../linear-algebra/kernels/atax/atax.cl'
source_filename = "../linear-algebra/kernels/atax/atax.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @atax_kernel1(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = icmp slt i32 %7, %3
  %9 = icmp sgt i32 %4, 0
  %10 = and i1 %8, %9
  br i1 %10, label %11, label %54

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
  br i1 %20, label %43, label %21

21:                                               ; preds = %11
  %22 = sub nsw i64 %17, %19
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi float [ %18, %21 ], [ %39, %23 ]
  %25 = phi i64 [ 0, %21 ], [ %40, %23 ]
  %26 = phi i64 [ %22, %21 ], [ %41, %23 ]
  %27 = add nsw i64 %25, %16
  %28 = getelementptr inbounds float, float* %0, i64 %27
  %29 = load float, float* %28, align 4, !tbaa !8
  %30 = getelementptr inbounds float, float* %1, i64 %25
  %31 = load float, float* %30, align 4, !tbaa !8
  %32 = tail call float @llvm.fmuladd.f32(float %29, float %31, float %24)
  store float %32, float* %15, align 4, !tbaa !8
  %33 = or i64 %25, 1
  %34 = add nsw i64 %33, %16
  %35 = getelementptr inbounds float, float* %0, i64 %34
  %36 = load float, float* %35, align 4, !tbaa !8
  %37 = getelementptr inbounds float, float* %1, i64 %33
  %38 = load float, float* %37, align 4, !tbaa !8
  %39 = tail call float @llvm.fmuladd.f32(float %36, float %38, float %32)
  store float %39, float* %15, align 4, !tbaa !8
  %40 = add nuw nsw i64 %25, 2
  %41 = add i64 %26, -2
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %43, label %23

43:                                               ; preds = %23, %11
  %44 = phi float [ %18, %11 ], [ %39, %23 ]
  %45 = phi i64 [ 0, %11 ], [ %40, %23 ]
  %46 = icmp eq i64 %19, 0
  br i1 %46, label %54, label %47

47:                                               ; preds = %43
  %48 = add nsw i64 %45, %16
  %49 = getelementptr inbounds float, float* %0, i64 %48
  %50 = load float, float* %49, align 4, !tbaa !8
  %51 = getelementptr inbounds float, float* %1, i64 %45
  %52 = load float, float* %51, align 4, !tbaa !8
  %53 = tail call float @llvm.fmuladd.f32(float %50, float %52, float %44)
  store float %53, float* %15, align 4, !tbaa !8
  br label %54

54:                                               ; preds = %47, %43, %5
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @atax_kernel2(float* nocapture readonly %0, float* nocapture %1, float* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = icmp slt i32 %7, %4
  %9 = icmp sgt i32 %3, 0
  %10 = and i1 %8, %9
  br i1 %10, label %11, label %58

11:                                               ; preds = %5
  %12 = shl i64 %6, 32
  %13 = ashr exact i64 %12, 32
  %14 = getelementptr inbounds float, float* %1, i64 %13
  %15 = sext i32 %4 to i64
  %16 = shl i64 %6, 32
  %17 = ashr exact i64 %16, 32
  %18 = zext i32 %3 to i64
  %19 = load float, float* %14, align 4, !tbaa !8
  %20 = and i64 %18, 1
  %21 = icmp eq i32 %3, 1
  br i1 %21, label %46, label %22

22:                                               ; preds = %11
  %23 = sub nsw i64 %18, %20
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi float [ %19, %22 ], [ %42, %24 ]
  %26 = phi i64 [ 0, %22 ], [ %43, %24 ]
  %27 = phi i64 [ %23, %22 ], [ %44, %24 ]
  %28 = mul nsw i64 %26, %15
  %29 = add nsw i64 %28, %17
  %30 = getelementptr inbounds float, float* %0, i64 %29
  %31 = load float, float* %30, align 4, !tbaa !8
  %32 = getelementptr inbounds float, float* %2, i64 %26
  %33 = load float, float* %32, align 4, !tbaa !8
  %34 = tail call float @llvm.fmuladd.f32(float %31, float %33, float %25)
  store float %34, float* %14, align 4, !tbaa !8
  %35 = or i64 %26, 1
  %36 = mul nsw i64 %35, %15
  %37 = add nsw i64 %36, %17
  %38 = getelementptr inbounds float, float* %0, i64 %37
  %39 = load float, float* %38, align 4, !tbaa !8
  %40 = getelementptr inbounds float, float* %2, i64 %35
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = tail call float @llvm.fmuladd.f32(float %39, float %41, float %34)
  store float %42, float* %14, align 4, !tbaa !8
  %43 = add nuw nsw i64 %26, 2
  %44 = add i64 %27, -2
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %46, label %24

46:                                               ; preds = %24, %11
  %47 = phi float [ %19, %11 ], [ %42, %24 ]
  %48 = phi i64 [ 0, %11 ], [ %43, %24 ]
  %49 = icmp eq i64 %20, 0
  br i1 %49, label %58, label %50

50:                                               ; preds = %46
  %51 = mul nsw i64 %48, %15
  %52 = add nsw i64 %51, %17
  %53 = getelementptr inbounds float, float* %0, i64 %52
  %54 = load float, float* %53, align 4, !tbaa !8
  %55 = getelementptr inbounds float, float* %2, i64 %48
  %56 = load float, float* %55, align 4, !tbaa !8
  %57 = tail call float @llvm.fmuladd.f32(float %54, float %56, float %47)
  store float %57, float* %14, align 4, !tbaa !8
  br label %58

58:                                               ; preds = %50, %46, %5
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
