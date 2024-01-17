; ModuleID = '../linear-algebra/kernels/gemm/gemm.cl'
source_filename = "../linear-algebra/kernels/gemm/gemm.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @gemm(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, float %3, float %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %9 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %10 = trunc i64 %9 to i32
  %11 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %12 = trunc i64 %11 to i32
  %13 = icmp slt i32 %12, %5
  %14 = icmp slt i32 %10, %6
  %15 = and i1 %14, %13
  br i1 %15, label %16, label %75

16:                                               ; preds = %8
  %17 = mul nsw i32 %12, %6
  %18 = add nsw i32 %17, %10
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %2, i64 %19
  %21 = load float, float* %20, align 4, !tbaa !8
  %22 = fmul float %21, %4
  store float %22, float* %20, align 4, !tbaa !8
  %23 = icmp sgt i32 %7, 0
  br i1 %23, label %24, label %75

24:                                               ; preds = %16
  %25 = mul nsw i32 %12, %7
  %26 = sext i32 %6 to i64
  %27 = shl i64 %9, 32
  %28 = ashr exact i64 %27, 32
  %29 = sext i32 %25 to i64
  %30 = zext i32 %7 to i64
  %31 = and i64 %30, 1
  %32 = icmp eq i32 %7, 1
  br i1 %32, label %61, label %33

33:                                               ; preds = %24
  %34 = sub nsw i64 %30, %31
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi float [ %22, %33 ], [ %57, %35 ]
  %37 = phi i64 [ 0, %33 ], [ %58, %35 ]
  %38 = phi i64 [ %34, %33 ], [ %59, %35 ]
  %39 = add nsw i64 %37, %29
  %40 = getelementptr inbounds float, float* %0, i64 %39
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = fmul float %41, %3
  %43 = mul nsw i64 %37, %26
  %44 = add nsw i64 %43, %28
  %45 = getelementptr inbounds float, float* %1, i64 %44
  %46 = load float, float* %45, align 4, !tbaa !8
  %47 = tail call float @llvm.fmuladd.f32(float %42, float %46, float %36)
  store float %47, float* %20, align 4, !tbaa !8
  %48 = or i64 %37, 1
  %49 = add nsw i64 %48, %29
  %50 = getelementptr inbounds float, float* %0, i64 %49
  %51 = load float, float* %50, align 4, !tbaa !8
  %52 = fmul float %51, %3
  %53 = mul nsw i64 %48, %26
  %54 = add nsw i64 %53, %28
  %55 = getelementptr inbounds float, float* %1, i64 %54
  %56 = load float, float* %55, align 4, !tbaa !8
  %57 = tail call float @llvm.fmuladd.f32(float %52, float %56, float %47)
  store float %57, float* %20, align 4, !tbaa !8
  %58 = add nuw nsw i64 %37, 2
  %59 = add i64 %38, -2
  %60 = icmp eq i64 %59, 0
  br i1 %60, label %61, label %35

61:                                               ; preds = %35, %24
  %62 = phi float [ %22, %24 ], [ %57, %35 ]
  %63 = phi i64 [ 0, %24 ], [ %58, %35 ]
  %64 = icmp eq i64 %31, 0
  br i1 %64, label %75, label %65

65:                                               ; preds = %61
  %66 = add nsw i64 %63, %29
  %67 = getelementptr inbounds float, float* %0, i64 %66
  %68 = load float, float* %67, align 4, !tbaa !8
  %69 = fmul float %68, %3
  %70 = mul nsw i64 %63, %26
  %71 = add nsw i64 %70, %28
  %72 = getelementptr inbounds float, float* %1, i64 %71
  %73 = load float, float* %72, align 4, !tbaa !8
  %74 = tail call float @llvm.fmuladd.f32(float %69, float %73, float %62)
  store float %74, float* %20, align 4, !tbaa !8
  br label %75

75:                                               ; preds = %65, %61, %16, %8
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
!3 = !{i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE", !"DATA_TYPE", !"int", !"int", !"int"}
!6 = !{!"float*", !"float*", !"float*", !"float", !"float", !"int", !"int", !"int"}
!7 = !{!"", !"", !"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
