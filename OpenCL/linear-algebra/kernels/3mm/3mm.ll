; ModuleID = '../linear-algebra/kernels/3mm/3mm.cl'
source_filename = "../linear-algebra/kernels/3mm/3mm.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @mm3_kernel1(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, %3
  %12 = icmp slt i32 %8, %4
  %13 = and i1 %12, %11
  br i1 %13, label %14, label %68

14:                                               ; preds = %6
  %15 = mul nsw i32 %10, %4
  %16 = add nsw i32 %15, %8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %2, i64 %17
  store float 0.000000e+00, float* %18, align 4, !tbaa !8
  %19 = icmp sgt i32 %5, 0
  br i1 %19, label %20, label %68

20:                                               ; preds = %14
  %21 = mul nsw i32 %10, %5
  %22 = sext i32 %4 to i64
  %23 = shl i64 %7, 32
  %24 = ashr exact i64 %23, 32
  %25 = sext i32 %21 to i64
  %26 = zext i32 %5 to i64
  %27 = and i64 %26, 1
  %28 = icmp eq i32 %5, 1
  br i1 %28, label %55, label %29

29:                                               ; preds = %20
  %30 = sub nsw i64 %26, %27
  br label %31

31:                                               ; preds = %31, %29
  %32 = phi float [ 0.000000e+00, %29 ], [ %51, %31 ]
  %33 = phi i64 [ 0, %29 ], [ %52, %31 ]
  %34 = phi i64 [ %30, %29 ], [ %53, %31 ]
  %35 = add nsw i64 %33, %25
  %36 = getelementptr inbounds float, float* %0, i64 %35
  %37 = load float, float* %36, align 4, !tbaa !8
  %38 = mul nsw i64 %33, %22
  %39 = add nsw i64 %38, %24
  %40 = getelementptr inbounds float, float* %1, i64 %39
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = tail call float @llvm.fmuladd.f32(float %37, float %41, float %32)
  store float %42, float* %18, align 4, !tbaa !8
  %43 = or i64 %33, 1
  %44 = add nsw i64 %43, %25
  %45 = getelementptr inbounds float, float* %0, i64 %44
  %46 = load float, float* %45, align 4, !tbaa !8
  %47 = mul nsw i64 %43, %22
  %48 = add nsw i64 %47, %24
  %49 = getelementptr inbounds float, float* %1, i64 %48
  %50 = load float, float* %49, align 4, !tbaa !8
  %51 = tail call float @llvm.fmuladd.f32(float %46, float %50, float %42)
  store float %51, float* %18, align 4, !tbaa !8
  %52 = add nuw nsw i64 %33, 2
  %53 = add i64 %34, -2
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %55, label %31

55:                                               ; preds = %31, %20
  %56 = phi float [ 0.000000e+00, %20 ], [ %51, %31 ]
  %57 = phi i64 [ 0, %20 ], [ %52, %31 ]
  %58 = icmp eq i64 %27, 0
  br i1 %58, label %68, label %59

59:                                               ; preds = %55
  %60 = add nsw i64 %57, %25
  %61 = getelementptr inbounds float, float* %0, i64 %60
  %62 = load float, float* %61, align 4, !tbaa !8
  %63 = mul nsw i64 %57, %22
  %64 = add nsw i64 %63, %24
  %65 = getelementptr inbounds float, float* %1, i64 %64
  %66 = load float, float* %65, align 4, !tbaa !8
  %67 = tail call float @llvm.fmuladd.f32(float %62, float %66, float %56)
  store float %67, float* %18, align 4, !tbaa !8
  br label %68

68:                                               ; preds = %59, %55, %14, %6
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @mm3_kernel2(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, %3
  %12 = icmp slt i32 %8, %4
  %13 = and i1 %12, %11
  br i1 %13, label %14, label %68

14:                                               ; preds = %6
  %15 = mul nsw i32 %10, %4
  %16 = add nsw i32 %15, %8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %2, i64 %17
  store float 0.000000e+00, float* %18, align 4, !tbaa !8
  %19 = icmp sgt i32 %5, 0
  br i1 %19, label %20, label %68

20:                                               ; preds = %14
  %21 = mul nsw i32 %10, %5
  %22 = sext i32 %4 to i64
  %23 = shl i64 %7, 32
  %24 = ashr exact i64 %23, 32
  %25 = sext i32 %21 to i64
  %26 = zext i32 %5 to i64
  %27 = and i64 %26, 1
  %28 = icmp eq i32 %5, 1
  br i1 %28, label %55, label %29

29:                                               ; preds = %20
  %30 = sub nsw i64 %26, %27
  br label %31

31:                                               ; preds = %31, %29
  %32 = phi float [ 0.000000e+00, %29 ], [ %51, %31 ]
  %33 = phi i64 [ 0, %29 ], [ %52, %31 ]
  %34 = phi i64 [ %30, %29 ], [ %53, %31 ]
  %35 = add nsw i64 %33, %25
  %36 = getelementptr inbounds float, float* %0, i64 %35
  %37 = load float, float* %36, align 4, !tbaa !8
  %38 = mul nsw i64 %33, %22
  %39 = add nsw i64 %38, %24
  %40 = getelementptr inbounds float, float* %1, i64 %39
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = tail call float @llvm.fmuladd.f32(float %37, float %41, float %32)
  store float %42, float* %18, align 4, !tbaa !8
  %43 = or i64 %33, 1
  %44 = add nsw i64 %43, %25
  %45 = getelementptr inbounds float, float* %0, i64 %44
  %46 = load float, float* %45, align 4, !tbaa !8
  %47 = mul nsw i64 %43, %22
  %48 = add nsw i64 %47, %24
  %49 = getelementptr inbounds float, float* %1, i64 %48
  %50 = load float, float* %49, align 4, !tbaa !8
  %51 = tail call float @llvm.fmuladd.f32(float %46, float %50, float %42)
  store float %51, float* %18, align 4, !tbaa !8
  %52 = add nuw nsw i64 %33, 2
  %53 = add i64 %34, -2
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %55, label %31

55:                                               ; preds = %31, %20
  %56 = phi float [ 0.000000e+00, %20 ], [ %51, %31 ]
  %57 = phi i64 [ 0, %20 ], [ %52, %31 ]
  %58 = icmp eq i64 %27, 0
  br i1 %58, label %68, label %59

59:                                               ; preds = %55
  %60 = add nsw i64 %57, %25
  %61 = getelementptr inbounds float, float* %0, i64 %60
  %62 = load float, float* %61, align 4, !tbaa !8
  %63 = mul nsw i64 %57, %22
  %64 = add nsw i64 %63, %24
  %65 = getelementptr inbounds float, float* %1, i64 %64
  %66 = load float, float* %65, align 4, !tbaa !8
  %67 = tail call float @llvm.fmuladd.f32(float %62, float %66, float %56)
  store float %67, float* %18, align 4, !tbaa !8
  br label %68

68:                                               ; preds = %59, %55, %14, %6
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @mm3_kernel3(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, %3
  %12 = icmp slt i32 %8, %4
  %13 = and i1 %12, %11
  br i1 %13, label %14, label %68

14:                                               ; preds = %6
  %15 = mul nsw i32 %10, %4
  %16 = add nsw i32 %15, %8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %2, i64 %17
  store float 0.000000e+00, float* %18, align 4, !tbaa !8
  %19 = icmp sgt i32 %5, 0
  br i1 %19, label %20, label %68

20:                                               ; preds = %14
  %21 = mul nsw i32 %10, %5
  %22 = sext i32 %4 to i64
  %23 = shl i64 %7, 32
  %24 = ashr exact i64 %23, 32
  %25 = sext i32 %21 to i64
  %26 = zext i32 %5 to i64
  %27 = and i64 %26, 1
  %28 = icmp eq i32 %5, 1
  br i1 %28, label %55, label %29

29:                                               ; preds = %20
  %30 = sub nsw i64 %26, %27
  br label %31

31:                                               ; preds = %31, %29
  %32 = phi float [ 0.000000e+00, %29 ], [ %51, %31 ]
  %33 = phi i64 [ 0, %29 ], [ %52, %31 ]
  %34 = phi i64 [ %30, %29 ], [ %53, %31 ]
  %35 = add nsw i64 %33, %25
  %36 = getelementptr inbounds float, float* %0, i64 %35
  %37 = load float, float* %36, align 4, !tbaa !8
  %38 = mul nsw i64 %33, %22
  %39 = add nsw i64 %38, %24
  %40 = getelementptr inbounds float, float* %1, i64 %39
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = tail call float @llvm.fmuladd.f32(float %37, float %41, float %32)
  store float %42, float* %18, align 4, !tbaa !8
  %43 = or i64 %33, 1
  %44 = add nsw i64 %43, %25
  %45 = getelementptr inbounds float, float* %0, i64 %44
  %46 = load float, float* %45, align 4, !tbaa !8
  %47 = mul nsw i64 %43, %22
  %48 = add nsw i64 %47, %24
  %49 = getelementptr inbounds float, float* %1, i64 %48
  %50 = load float, float* %49, align 4, !tbaa !8
  %51 = tail call float @llvm.fmuladd.f32(float %46, float %50, float %42)
  store float %51, float* %18, align 4, !tbaa !8
  %52 = add nuw nsw i64 %33, 2
  %53 = add i64 %34, -2
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %55, label %31

55:                                               ; preds = %31, %20
  %56 = phi float [ 0.000000e+00, %20 ], [ %51, %31 ]
  %57 = phi i64 [ 0, %20 ], [ %52, %31 ]
  %58 = icmp eq i64 %27, 0
  br i1 %58, label %68, label %59

59:                                               ; preds = %55
  %60 = add nsw i64 %57, %25
  %61 = getelementptr inbounds float, float* %0, i64 %60
  %62 = load float, float* %61, align 4, !tbaa !8
  %63 = mul nsw i64 %57, %22
  %64 = add nsw i64 %63, %24
  %65 = getelementptr inbounds float, float* %1, i64 %64
  %66 = load float, float* %65, align 4, !tbaa !8
  %67 = tail call float @llvm.fmuladd.f32(float %62, float %66, float %56)
  store float %67, float* %18, align 4, !tbaa !8
  br label %68

68:                                               ; preds = %59, %55, %14, %6
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
!3 = !{i32 1, i32 1, i32 1, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int", !"int"}
!6 = !{!"float*", !"float*", !"float*", !"int", !"int", !"int"}
!7 = !{!"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
