; ModuleID = '../stencils/fdtd-2d/fdtd2d.cl'
source_filename = "../stencils/fdtd-2d/fdtd2d.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @fdtd_kernel1(float* nocapture readonly %0, float* nocapture readnone %1, float* nocapture %2, float* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %11 = trunc i64 %10 to i32
  %12 = icmp slt i32 %11, %5
  %13 = icmp slt i32 %9, %6
  %14 = and i1 %13, %12
  br i1 %14, label %15, label %45

15:                                               ; preds = %7
  %16 = mul nsw i32 %11, %6
  %17 = icmp eq i32 %11, 0
  br i1 %17, label %18, label %27

18:                                               ; preds = %15
  %19 = sext i32 %4 to i64
  %20 = getelementptr inbounds float, float* %0, i64 %19
  %21 = bitcast float* %20 to i32*
  %22 = load i32, i32* %21, align 4, !tbaa !8
  %23 = add nuw nsw i32 %16, %9
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float* %2, i64 %24
  %26 = bitcast float* %25 to i32*
  store i32 %22, i32* %26, align 4, !tbaa !8
  br label %45

27:                                               ; preds = %15
  %28 = add nsw i32 %16, %9
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float* %2, i64 %29
  %31 = load float, float* %30, align 4, !tbaa !8
  %32 = fpext float %31 to double
  %33 = getelementptr inbounds float, float* %3, i64 %29
  %34 = load float, float* %33, align 4, !tbaa !8
  %35 = add nsw i32 %11, -1
  %36 = mul nsw i32 %35, %6
  %37 = add nsw i32 %36, %9
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float* %3, i64 %38
  %40 = load float, float* %39, align 4, !tbaa !8
  %41 = fsub float %34, %40
  %42 = fpext float %41 to double
  %43 = tail call double @llvm.fmuladd.f64(double %42, double -5.000000e-01, double %32)
  %44 = fptrunc double %43 to float
  store float %44, float* %30, align 4, !tbaa !8
  br label %45

45:                                               ; preds = %18, %27, %7
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @fdtd_kernel2(float* nocapture %0, float* nocapture readnone %1, float* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !12 !kernel_arg_access_qual !13 !kernel_arg_type !14 !kernel_arg_base_type !15 !kernel_arg_type_qual !16 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %9 = trunc i64 %8 to i32
  %10 = icmp slt i32 %9, %3
  br i1 %10, label %11, label %32

11:                                               ; preds = %5
  %12 = icmp slt i32 %7, %4
  %13 = icmp sgt i32 %7, 0
  %14 = and i1 %12, %13
  br i1 %14, label %15, label %32

15:                                               ; preds = %11
  %16 = mul nsw i32 %9, %4
  %17 = add i32 %16, %7
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float* %0, i64 %18
  %20 = load float, float* %19, align 4, !tbaa !8
  %21 = fpext float %20 to double
  %22 = getelementptr inbounds float, float* %2, i64 %18
  %23 = load float, float* %22, align 4, !tbaa !8
  %24 = add i32 %17, -1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float* %2, i64 %25
  %27 = load float, float* %26, align 4, !tbaa !8
  %28 = fsub float %23, %27
  %29 = fpext float %28 to double
  %30 = tail call double @llvm.fmuladd.f64(double %29, double -5.000000e-01, double %21)
  %31 = fptrunc double %30 to float
  store float %31, float* %19, align 4, !tbaa !8
  br label %32

32:                                               ; preds = %15, %11, %5
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @fdtd_kernel3(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !12 !kernel_arg_access_qual !13 !kernel_arg_type !14 !kernel_arg_base_type !15 !kernel_arg_type_qual !16 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %9 = trunc i64 %8 to i32
  %10 = add nsw i32 %3, -1
  %11 = icmp sgt i32 %10, %9
  %12 = add nsw i32 %4, -1
  %13 = icmp sgt i32 %12, %7
  %14 = and i1 %13, %11
  br i1 %14, label %15, label %42

15:                                               ; preds = %5
  %16 = mul nsw i32 %9, %4
  %17 = add i32 %16, %7
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float* %2, i64 %18
  %20 = load float, float* %19, align 4, !tbaa !8
  %21 = fpext float %20 to double
  %22 = add i32 %17, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float* %0, i64 %23
  %25 = load float, float* %24, align 4, !tbaa !8
  %26 = getelementptr inbounds float, float* %0, i64 %18
  %27 = load float, float* %26, align 4, !tbaa !8
  %28 = fsub float %25, %27
  %29 = add nsw i32 %9, 1
  %30 = mul nsw i32 %29, %4
  %31 = add nsw i32 %30, %7
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float* %1, i64 %32
  %34 = load float, float* %33, align 4, !tbaa !8
  %35 = fadd float %28, %34
  %36 = getelementptr inbounds float, float* %1, i64 %18
  %37 = load float, float* %36, align 4, !tbaa !8
  %38 = fsub float %35, %37
  %39 = fpext float %38 to double
  %40 = tail call double @llvm.fmuladd.f64(double %39, double 0xBFE6666666666666, double %21)
  %41 = fptrunc double %40 to float
  store float %41, float* %19, align 4, !tbaa !8
  br label %42

42:                                               ; preds = %15, %5
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
!3 = !{i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int", !"int"}
!6 = !{!"float*", !"float*", !"float*", !"float*", !"int", !"int", !"int"}
!7 = !{!"", !"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{i32 1, i32 1, i32 1, i32 0, i32 0}
!13 = !{!"none", !"none", !"none", !"none", !"none"}
!14 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int"}
!15 = !{!"float*", !"float*", !"float*", !"int", !"int"}
!16 = !{!"", !"", !"", !"", !""}
