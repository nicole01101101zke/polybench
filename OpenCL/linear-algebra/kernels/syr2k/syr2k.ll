; ModuleID = '../linear-algebra/kernels/syr2k/syr2k.cl'
source_filename = "../linear-algebra/kernels/syr2k/syr2k.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @syr2k_kernel(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, float %3, float %4, i32 %5, i32 %6) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %11 = trunc i64 %10 to i32
  %12 = icmp slt i32 %11, %6
  %13 = icmp slt i32 %9, %6
  %14 = and i1 %13, %12
  br i1 %14, label %15, label %49

15:                                               ; preds = %7
  %16 = mul nsw i32 %11, %6
  %17 = add nsw i32 %16, %9
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float* %2, i64 %18
  %20 = load float, float* %19, align 4, !tbaa !8
  %21 = fmul float %20, %4
  store float %21, float* %19, align 4, !tbaa !8
  %22 = icmp sgt i32 %5, 0
  br i1 %22, label %23, label %49

23:                                               ; preds = %15
  %24 = mul nsw i32 %11, %5
  %25 = mul nsw i32 %9, %5
  %26 = sext i32 %25 to i64
  %27 = sext i32 %24 to i64
  %28 = zext i32 %5 to i64
  br label %29

29:                                               ; preds = %29, %23
  %30 = phi float [ %21, %23 ], [ %46, %29 ]
  %31 = phi i64 [ 0, %23 ], [ %47, %29 ]
  %32 = add nsw i64 %31, %27
  %33 = getelementptr inbounds float, float* %0, i64 %32
  %34 = load float, float* %33, align 4, !tbaa !8
  %35 = fmul float %34, %3
  %36 = add nsw i64 %31, %26
  %37 = getelementptr inbounds float, float* %1, i64 %36
  %38 = load float, float* %37, align 4, !tbaa !8
  %39 = getelementptr inbounds float, float* %1, i64 %32
  %40 = load float, float* %39, align 4, !tbaa !8
  %41 = fmul float %40, %3
  %42 = getelementptr inbounds float, float* %0, i64 %36
  %43 = load float, float* %42, align 4, !tbaa !8
  %44 = fmul float %41, %43
  %45 = tail call float @llvm.fmuladd.f32(float %35, float %38, float %44)
  %46 = fadd float %30, %45
  store float %46, float* %19, align 4, !tbaa !8
  %47 = add nuw nsw i64 %31, 1
  %48 = icmp eq i64 %47, %28
  br i1 %48, label %49, label %29

49:                                               ; preds = %29, %15, %7
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
!3 = !{i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE", !"DATA_TYPE", !"int", !"int"}
!6 = !{!"float*", !"float*", !"float*", !"float", !"float", !"int", !"int"}
!7 = !{!"", !"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
