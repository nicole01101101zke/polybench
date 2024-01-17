; ModuleID = '../stencils/adi/adi.cl'
source_filename = "../stencils/adi/adi.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @adi_kernel1(float* nocapture readonly %0, float* nocapture %1, float* nocapture %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = icmp slt i32 %6, %3
  %8 = icmp sgt i32 %3, 1
  %9 = and i1 %7, %8
  br i1 %9, label %10, label %71

10:                                               ; preds = %4
  %11 = mul nsw i32 %6, %3
  %12 = sext i32 %11 to i64
  %13 = zext i32 %3 to i64
  %14 = getelementptr float, float* %2, i64 %12
  %15 = add nsw i64 %12, %13
  %16 = getelementptr float, float* %2, i64 %15
  %17 = getelementptr float, float* %1, i64 %12
  %18 = getelementptr float, float* %1, i64 %15
  %19 = icmp ult float* %14, %18
  %20 = icmp ult float* %17, %16
  %21 = and i1 %19, %20
  br i1 %21, label %22, label %46

22:                                               ; preds = %10, %22
  %23 = phi i64 [ %44, %22 ], [ 1, %10 ]
  %24 = add nsw i64 %23, %12
  %25 = getelementptr inbounds float, float* %2, i64 %24
  %26 = load float, float* %25, align 4, !tbaa !8
  %27 = add nsw i64 %24, -1
  %28 = getelementptr inbounds float, float* %2, i64 %27
  %29 = load float, float* %28, align 4, !tbaa !8
  %30 = getelementptr inbounds float, float* %0, i64 %24
  %31 = load float, float* %30, align 4, !tbaa !8
  %32 = fmul float %29, %31
  %33 = getelementptr inbounds float, float* %1, i64 %27
  %34 = load float, float* %33, align 4, !tbaa !8
  %35 = fdiv float %32, %34, !fpmath !12
  %36 = fsub float %26, %35
  store float %36, float* %25, align 4, !tbaa !8
  %37 = getelementptr inbounds float, float* %1, i64 %24
  %38 = load float, float* %37, align 4, !tbaa !8
  %39 = load float, float* %30, align 4, !tbaa !8
  %40 = fmul float %39, %39
  %41 = load float, float* %33, align 4, !tbaa !8
  %42 = fdiv float %40, %41, !fpmath !12
  %43 = fsub float %38, %42
  store float %43, float* %37, align 4, !tbaa !8
  %44 = add nuw nsw i64 %23, 1
  %45 = icmp eq i64 %44, %13
  br i1 %45, label %71, label %22

46:                                               ; preds = %10
  %47 = getelementptr float, float* %2, i64 %12
  %48 = load float, float* %47, align 4
  %49 = getelementptr float, float* %1, i64 %12
  %50 = load float, float* %49, align 4
  br label %51

51:                                               ; preds = %51, %46
  %52 = phi float [ %50, %46 ], [ %68, %51 ]
  %53 = phi float [ %48, %46 ], [ %62, %51 ]
  %54 = phi i64 [ 1, %46 ], [ %69, %51 ]
  %55 = add nsw i64 %54, %12
  %56 = getelementptr inbounds float, float* %2, i64 %55
  %57 = load float, float* %56, align 4, !tbaa !8
  %58 = getelementptr inbounds float, float* %0, i64 %55
  %59 = load float, float* %58, align 4, !tbaa !8
  %60 = fmul float %53, %59
  %61 = fdiv float %60, %52, !fpmath !12
  %62 = fsub float %57, %61
  store float %62, float* %56, align 4, !tbaa !8
  %63 = getelementptr inbounds float, float* %1, i64 %55
  %64 = load float, float* %63, align 4, !tbaa !8
  %65 = load float, float* %58, align 4, !tbaa !8
  %66 = fmul float %65, %65
  %67 = fdiv float %66, %52, !fpmath !12
  %68 = fsub float %64, %67
  store float %68, float* %63, align 4, !tbaa !8
  %69 = add nuw nsw i64 %54, 1
  %70 = icmp eq i64 %69, %13
  br i1 %70, label %71, label %51

71:                                               ; preds = %51, %22, %4
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @adi_kernel2(float* nocapture readnone %0, float* nocapture readonly %1, float* nocapture %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = icmp slt i32 %6, %3
  br i1 %7, label %8, label %18

8:                                                ; preds = %4
  %9 = mul nsw i32 %6, %3
  %10 = add nsw i32 %3, -1
  %11 = add nsw i32 %10, %9
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float* %2, i64 %12
  %14 = load float, float* %13, align 4, !tbaa !8
  %15 = getelementptr inbounds float, float* %1, i64 %12
  %16 = load float, float* %15, align 4, !tbaa !8
  %17 = fdiv float %14, %16, !fpmath !12
  store float %17, float* %13, align 4, !tbaa !8
  br label %18

18:                                               ; preds = %8, %4
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @adi_kernel3(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = icmp slt i32 %6, %3
  br i1 %7, label %8, label %50

8:                                                ; preds = %4
  %9 = add i32 %3, -2
  %10 = icmp sgt i32 %3, 2
  br i1 %10, label %11, label %50

11:                                               ; preds = %8
  %12 = mul nsw i32 %6, %3
  %13 = add nsw i32 %3, -3
  %14 = add i32 %13, %12
  %15 = sext i32 %9 to i64
  %16 = sext i32 %12 to i64
  %17 = zext i32 %9 to i64
  br label %18

18:                                               ; preds = %18, %11
  %19 = phi i64 [ 0, %11 ], [ %48, %18 ]
  %20 = sub nsw i64 %15, %19
  %21 = add nsw i64 %20, %16
  %22 = getelementptr inbounds float, float* %2, i64 %21
  %23 = load float, float* %22, align 4, !tbaa !8
  %24 = trunc i64 %20 to i32
  %25 = add i32 %12, %24
  %26 = add i32 %25, -1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float* %2, i64 %27
  %29 = load float, float* %28, align 4, !tbaa !8
  %30 = trunc i64 %19 to i32
  %31 = sub i32 %3, %30
  %32 = add i32 %31, %12
  %33 = add i32 %32, -3
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float* %0, i64 %34
  %36 = load float, float* %35, align 4, !tbaa !8
  %37 = fneg float %29
  %38 = tail call float @llvm.fmuladd.f32(float %37, float %36, float %23)
  %39 = trunc i64 %19 to i32
  %40 = sub i32 %14, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float* %1, i64 %41
  %43 = load float, float* %42, align 4, !tbaa !8
  %44 = fdiv float %38, %43, !fpmath !12
  %45 = add i32 %32, -2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float* %2, i64 %46
  store float %44, float* %47, align 4, !tbaa !8
  %48 = add nuw nsw i64 %19, 1
  %49 = icmp eq i64 %48, %17
  br i1 %49, label %50, label %18

50:                                               ; preds = %18, %8, %4
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @adi_kernel4(float* nocapture readonly %0, float* nocapture %1, float* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !13 !kernel_arg_access_qual !14 !kernel_arg_type !15 !kernel_arg_base_type !16 !kernel_arg_type_qual !17 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = icmp slt i32 %7, %4
  br i1 %8, label %9, label %35

9:                                                ; preds = %5
  %10 = mul nsw i32 %4, %3
  %11 = add nsw i32 %10, %7
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float* %2, i64 %12
  %14 = load float, float* %13, align 4, !tbaa !8
  %15 = add nsw i32 %3, -1
  %16 = mul nsw i32 %15, %4
  %17 = add nsw i32 %16, %7
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float* %2, i64 %18
  %20 = load float, float* %19, align 4, !tbaa !8
  %21 = getelementptr inbounds float, float* %0, i64 %12
  %22 = load float, float* %21, align 4, !tbaa !8
  %23 = fmul float %20, %22
  %24 = getelementptr inbounds float, float* %1, i64 %18
  %25 = load float, float* %24, align 4, !tbaa !8
  %26 = fdiv float %23, %25, !fpmath !12
  %27 = fsub float %14, %26
  store float %27, float* %13, align 4, !tbaa !8
  %28 = getelementptr inbounds float, float* %1, i64 %12
  %29 = load float, float* %28, align 4, !tbaa !8
  %30 = load float, float* %21, align 4, !tbaa !8
  %31 = fmul float %30, %30
  %32 = load float, float* %24, align 4, !tbaa !8
  %33 = fdiv float %31, %32, !fpmath !12
  %34 = fsub float %29, %33
  store float %34, float* %28, align 4, !tbaa !8
  br label %35

35:                                               ; preds = %9, %5
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @adi_kernel5(float* nocapture readnone %0, float* nocapture readonly %1, float* nocapture %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = icmp slt i32 %6, %3
  br i1 %7, label %8, label %18

8:                                                ; preds = %4
  %9 = add nsw i32 %3, -1
  %10 = mul nsw i32 %9, %3
  %11 = add nsw i32 %10, %6
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float* %2, i64 %12
  %14 = load float, float* %13, align 4, !tbaa !8
  %15 = getelementptr inbounds float, float* %1, i64 %12
  %16 = load float, float* %15, align 4, !tbaa !8
  %17 = fdiv float %14, %16, !fpmath !12
  store float %17, float* %13, align 4, !tbaa !8
  br label %18

18:                                               ; preds = %8, %4
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @adi_kernel6(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !13 !kernel_arg_access_qual !14 !kernel_arg_type !15 !kernel_arg_base_type !16 !kernel_arg_type_qual !17 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = icmp slt i32 %7, %4
  br i1 %8, label %9, label %31

9:                                                ; preds = %5
  %10 = sub i32 -2, %3
  %11 = add i32 %10, %4
  %12 = mul nsw i32 %11, %4
  %13 = add nsw i32 %12, %7
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float* %2, i64 %14
  %16 = load float, float* %15, align 4, !tbaa !8
  %17 = sub i32 -3, %3
  %18 = add i32 %17, %4
  %19 = mul nsw i32 %18, %4
  %20 = add nsw i32 %19, %7
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %2, i64 %21
  %23 = load float, float* %22, align 4, !tbaa !8
  %24 = getelementptr inbounds float, float* %0, i64 %21
  %25 = load float, float* %24, align 4, !tbaa !8
  %26 = fneg float %23
  %27 = tail call float @llvm.fmuladd.f32(float %26, float %25, float %16)
  %28 = getelementptr inbounds float, float* %1, i64 %14
  %29 = load float, float* %28, align 4, !tbaa !8
  %30 = fdiv float %27, %29, !fpmath !12
  store float %30, float* %15, align 4, !tbaa !8
  br label %31

31:                                               ; preds = %9, %5
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
!3 = !{i32 1, i32 1, i32 1, i32 0}
!4 = !{!"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"int"}
!6 = !{!"float*", !"float*", !"float*", !"int"}
!7 = !{!"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{float 2.500000e+00}
!13 = !{i32 1, i32 1, i32 1, i32 0, i32 0}
!14 = !{!"none", !"none", !"none", !"none", !"none"}
!15 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int"}
!16 = !{!"float*", !"float*", !"float*", !"int", !"int"}
!17 = !{!"", !"", !"", !"", !""}
