; ModuleID = '../stencils/convolution-2d/2DConvolution.cl'
source_filename = "../stencils/convolution-2d/2DConvolution.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @Convolution2D_kernel(float* nocapture readonly %0, float* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %8 = trunc i64 %7 to i32
  %9 = add nsw i32 %2, -1
  %10 = icmp sgt i32 %9, %8
  br i1 %10, label %11, label %72

11:                                               ; preds = %4
  %12 = add nsw i32 %3, -1
  %13 = icmp sgt i32 %12, %6
  %14 = icmp sgt i32 %8, 0
  %15 = and i1 %13, %14
  %16 = icmp sgt i32 %6, 0
  %17 = and i1 %16, %15
  br i1 %17, label %18, label %72

18:                                               ; preds = %11
  %19 = add nsw i32 %8, -1
  %20 = mul nsw i32 %19, %3
  %21 = add nsw i32 %6, -1
  %22 = add nsw i32 %20, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float* %0, i64 %23
  %25 = load float, float* %24, align 4, !tbaa !8
  %26 = add nsw i32 %20, %6
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float* %0, i64 %27
  %29 = load float, float* %28, align 4, !tbaa !8
  %30 = fmul float %29, 5.000000e-01
  %31 = tail call float @llvm.fmuladd.f32(float %25, float 0x3FC99999A0000000, float %30)
  %32 = add nuw nsw i32 %6, 1
  %33 = add nsw i32 %20, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float* %0, i64 %34
  %36 = load float, float* %35, align 4, !tbaa !8
  %37 = tail call float @llvm.fmuladd.f32(float %36, float 0xBFE99999A0000000, float %31)
  %38 = mul nsw i32 %8, %3
  %39 = add nsw i32 %38, %21
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float* %0, i64 %40
  %42 = load float, float* %41, align 4, !tbaa !8
  %43 = tail call float @llvm.fmuladd.f32(float %42, float 0xBFD3333340000000, float %37)
  %44 = add nsw i32 %38, %6
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float* %0, i64 %45
  %47 = load float, float* %46, align 4, !tbaa !8
  %48 = tail call float @llvm.fmuladd.f32(float %47, float 0x3FE3333340000000, float %43)
  %49 = add nsw i32 %38, %32
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float* %0, i64 %50
  %52 = load float, float* %51, align 4, !tbaa !8
  %53 = tail call float @llvm.fmuladd.f32(float %52, float 0xBFECCCCCC0000000, float %48)
  %54 = add nuw nsw i32 %8, 1
  %55 = mul nsw i32 %54, %3
  %56 = add nsw i32 %55, %21
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float* %0, i64 %57
  %59 = load float, float* %58, align 4, !tbaa !8
  %60 = tail call float @llvm.fmuladd.f32(float %59, float 0x3FD99999A0000000, float %53)
  %61 = add nsw i32 %55, %6
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %0, i64 %62
  %64 = load float, float* %63, align 4, !tbaa !8
  %65 = tail call float @llvm.fmuladd.f32(float %64, float 0x3FE6666660000000, float %60)
  %66 = add nsw i32 %55, %32
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float* %0, i64 %67
  %69 = load float, float* %68, align 4, !tbaa !8
  %70 = tail call float @llvm.fmuladd.f32(float %69, float 0x3FB99999A0000000, float %65)
  %71 = getelementptr inbounds float, float* %1, i64 %45
  store float %70, float* %71, align 4, !tbaa !8
  br label %72

72:                                               ; preds = %18, %11, %4
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
!3 = !{i32 1, i32 1, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int"}
!6 = !{!"float*", !"float*", !"int", !"int"}
!7 = !{!"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
