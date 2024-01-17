; ModuleID = '../linear-algebra/solvers/gramschmidt/gramschmidt.cl'
source_filename = "../linear-algebra/solvers/gramschmidt/gramschmidt.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @gramschmidt_kernel1(float* nocapture readonly %0, float* nocapture %1, float* nocapture readnone %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %75

10:                                               ; preds = %6
  %11 = icmp sgt i32 %4, 0
  br i1 %11, label %12, label %68

12:                                               ; preds = %10
  %13 = sext i32 %5 to i64
  %14 = sext i32 %3 to i64
  %15 = zext i32 %4 to i64
  %16 = add nsw i64 %15, -1
  %17 = and i64 %15, 3
  %18 = icmp ult i64 %16, 3
  br i1 %18, label %51, label %19

19:                                               ; preds = %12
  %20 = sub nsw i64 %15, %17
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i64 [ 0, %19 ], [ %48, %21 ]
  %23 = phi float [ 0.000000e+00, %19 ], [ %47, %21 ]
  %24 = phi i64 [ %20, %19 ], [ %49, %21 ]
  %25 = mul nsw i64 %22, %13
  %26 = add nsw i64 %25, %14
  %27 = getelementptr inbounds float, float* %0, i64 %26
  %28 = load float, float* %27, align 4, !tbaa !8
  %29 = tail call float @llvm.fmuladd.f32(float %28, float %28, float %23)
  %30 = or i64 %22, 1
  %31 = mul nsw i64 %30, %13
  %32 = add nsw i64 %31, %14
  %33 = getelementptr inbounds float, float* %0, i64 %32
  %34 = load float, float* %33, align 4, !tbaa !8
  %35 = tail call float @llvm.fmuladd.f32(float %34, float %34, float %29)
  %36 = or i64 %22, 2
  %37 = mul nsw i64 %36, %13
  %38 = add nsw i64 %37, %14
  %39 = getelementptr inbounds float, float* %0, i64 %38
  %40 = load float, float* %39, align 4, !tbaa !8
  %41 = tail call float @llvm.fmuladd.f32(float %40, float %40, float %35)
  %42 = or i64 %22, 3
  %43 = mul nsw i64 %42, %13
  %44 = add nsw i64 %43, %14
  %45 = getelementptr inbounds float, float* %0, i64 %44
  %46 = load float, float* %45, align 4, !tbaa !8
  %47 = tail call float @llvm.fmuladd.f32(float %46, float %46, float %41)
  %48 = add nuw nsw i64 %22, 4
  %49 = add i64 %24, -4
  %50 = icmp eq i64 %49, 0
  br i1 %50, label %51, label %21

51:                                               ; preds = %21, %12
  %52 = phi float [ undef, %12 ], [ %47, %21 ]
  %53 = phi i64 [ 0, %12 ], [ %48, %21 ]
  %54 = phi float [ 0.000000e+00, %12 ], [ %47, %21 ]
  %55 = icmp eq i64 %17, 0
  br i1 %55, label %68, label %56

56:                                               ; preds = %51, %56
  %57 = phi i64 [ %65, %56 ], [ %53, %51 ]
  %58 = phi float [ %64, %56 ], [ %54, %51 ]
  %59 = phi i64 [ %66, %56 ], [ %17, %51 ]
  %60 = mul nsw i64 %57, %13
  %61 = add nsw i64 %60, %14
  %62 = getelementptr inbounds float, float* %0, i64 %61
  %63 = load float, float* %62, align 4, !tbaa !8
  %64 = tail call float @llvm.fmuladd.f32(float %63, float %63, float %58)
  %65 = add nuw nsw i64 %57, 1
  %66 = add i64 %59, -1
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %68, label %56, !llvm.loop !12

68:                                               ; preds = %51, %56, %10
  %69 = phi float [ 0.000000e+00, %10 ], [ %52, %51 ], [ %64, %56 ]
  %70 = tail call float @_Z4sqrtf(float %69) #3
  %71 = mul nsw i32 %5, %3
  %72 = add nsw i32 %71, %3
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float* %1, i64 %73
  store float %70, float* %74, align 4, !tbaa !8
  br label %75

75:                                               ; preds = %68, %6
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z4sqrtf(float) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @gramschmidt_kernel2(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = icmp slt i32 %8, %4
  br i1 %9, label %10, label %23

10:                                               ; preds = %6
  %11 = mul nsw i32 %8, %5
  %12 = add nsw i32 %11, %3
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float* %0, i64 %13
  %15 = load float, float* %14, align 4, !tbaa !8
  %16 = mul nsw i32 %5, %3
  %17 = add nsw i32 %16, %3
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float* %1, i64 %18
  %20 = load float, float* %19, align 4, !tbaa !8
  %21 = fdiv float %15, %20, !fpmath !14
  %22 = getelementptr inbounds float, float* %2, i64 %13
  store float %21, float* %22, align 4, !tbaa !8
  br label %23

23:                                               ; preds = %10, %6
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @gramschmidt_kernel3(float* nocapture %0, float* nocapture %1, float* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = add nsw i32 %3, 1
  %9 = trunc i64 %7 to i32
  %10 = add i32 %8, %9
  %11 = icmp slt i32 %10, %5
  br i1 %11, label %12, label %126

12:                                               ; preds = %6
  %13 = mul nsw i32 %5, %3
  %14 = add nsw i32 %10, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float* %1, i64 %15
  store float 0.000000e+00, float* %16, align 4, !tbaa !8
  %17 = icmp sgt i32 %4, 0
  br i1 %17, label %18, label %126

18:                                               ; preds = %12
  %19 = sext i32 %5 to i64
  %20 = sext i32 %3 to i64
  %21 = sext i32 %10 to i64
  %22 = zext i32 %4 to i64
  %23 = and i64 %22, 1
  %24 = icmp eq i32 %4, 1
  br i1 %24, label %27, label %25

25:                                               ; preds = %18
  %26 = sub nsw i64 %22, %23
  br label %61

27:                                               ; preds = %61, %18
  %28 = phi float [ undef, %18 ], [ %81, %61 ]
  %29 = phi float [ 0.000000e+00, %18 ], [ %81, %61 ]
  %30 = phi i64 [ 0, %18 ], [ %82, %61 ]
  %31 = icmp eq i64 %23, 0
  br i1 %31, label %41, label %32

32:                                               ; preds = %27
  %33 = mul nsw i64 %30, %19
  %34 = add nsw i64 %33, %20
  %35 = getelementptr inbounds float, float* %2, i64 %34
  %36 = load float, float* %35, align 4, !tbaa !8
  %37 = add nsw i64 %33, %21
  %38 = getelementptr inbounds float, float* %0, i64 %37
  %39 = load float, float* %38, align 4, !tbaa !8
  %40 = tail call float @llvm.fmuladd.f32(float %36, float %39, float %29)
  store float %40, float* %16, align 4, !tbaa !8
  br label %41

41:                                               ; preds = %27, %32
  %42 = phi float [ %28, %27 ], [ %40, %32 ]
  br i1 %17, label %43, label %126

43:                                               ; preds = %41
  %44 = sext i32 %5 to i64
  %45 = sext i32 %3 to i64
  %46 = sext i32 %10 to i64
  %47 = getelementptr inbounds float, float* %2, i64 %45
  %48 = load float, float* %47, align 4, !tbaa !8
  %49 = getelementptr inbounds float, float* %0, i64 %46
  %50 = load float, float* %49, align 4, !tbaa !8
  %51 = fneg float %48
  %52 = tail call float @llvm.fmuladd.f32(float %51, float %42, float %50)
  store float %52, float* %49, align 4, !tbaa !8
  %53 = icmp eq i32 %4, 1
  br i1 %53, label %126, label %54

54:                                               ; preds = %43
  %55 = zext i32 %4 to i64
  %56 = add nsw i64 %55, -1
  %57 = and i64 %56, 1
  %58 = icmp eq i32 %4, 2
  br i1 %58, label %112, label %59

59:                                               ; preds = %54
  %60 = sub nsw i64 %56, %57
  br label %85

61:                                               ; preds = %61, %25
  %62 = phi float [ 0.000000e+00, %25 ], [ %81, %61 ]
  %63 = phi i64 [ 0, %25 ], [ %82, %61 ]
  %64 = phi i64 [ %26, %25 ], [ %83, %61 ]
  %65 = mul nsw i64 %63, %19
  %66 = add nsw i64 %65, %20
  %67 = getelementptr inbounds float, float* %2, i64 %66
  %68 = load float, float* %67, align 4, !tbaa !8
  %69 = add nsw i64 %65, %21
  %70 = getelementptr inbounds float, float* %0, i64 %69
  %71 = load float, float* %70, align 4, !tbaa !8
  %72 = tail call float @llvm.fmuladd.f32(float %68, float %71, float %62)
  store float %72, float* %16, align 4, !tbaa !8
  %73 = or i64 %63, 1
  %74 = mul nsw i64 %73, %19
  %75 = add nsw i64 %74, %20
  %76 = getelementptr inbounds float, float* %2, i64 %75
  %77 = load float, float* %76, align 4, !tbaa !8
  %78 = add nsw i64 %74, %21
  %79 = getelementptr inbounds float, float* %0, i64 %78
  %80 = load float, float* %79, align 4, !tbaa !8
  %81 = tail call float @llvm.fmuladd.f32(float %77, float %80, float %72)
  store float %81, float* %16, align 4, !tbaa !8
  %82 = add nuw nsw i64 %63, 2
  %83 = add i64 %64, -2
  %84 = icmp eq i64 %83, 0
  br i1 %84, label %27, label %61

85:                                               ; preds = %85, %59
  %86 = phi i64 [ 1, %59 ], [ %109, %85 ]
  %87 = phi i64 [ %60, %59 ], [ %110, %85 ]
  %88 = load float, float* %16, align 4, !tbaa !8
  %89 = mul nsw i64 %86, %44
  %90 = add nsw i64 %89, %45
  %91 = getelementptr inbounds float, float* %2, i64 %90
  %92 = load float, float* %91, align 4, !tbaa !8
  %93 = add nsw i64 %89, %46
  %94 = getelementptr inbounds float, float* %0, i64 %93
  %95 = load float, float* %94, align 4, !tbaa !8
  %96 = fneg float %92
  %97 = tail call float @llvm.fmuladd.f32(float %96, float %88, float %95)
  store float %97, float* %94, align 4, !tbaa !8
  %98 = add nuw nsw i64 %86, 1
  %99 = load float, float* %16, align 4, !tbaa !8
  %100 = mul nsw i64 %98, %44
  %101 = add nsw i64 %100, %45
  %102 = getelementptr inbounds float, float* %2, i64 %101
  %103 = load float, float* %102, align 4, !tbaa !8
  %104 = add nsw i64 %100, %46
  %105 = getelementptr inbounds float, float* %0, i64 %104
  %106 = load float, float* %105, align 4, !tbaa !8
  %107 = fneg float %103
  %108 = tail call float @llvm.fmuladd.f32(float %107, float %99, float %106)
  store float %108, float* %105, align 4, !tbaa !8
  %109 = add nuw nsw i64 %86, 2
  %110 = add i64 %87, -2
  %111 = icmp eq i64 %110, 0
  br i1 %111, label %112, label %85

112:                                              ; preds = %85, %54
  %113 = phi i64 [ 1, %54 ], [ %109, %85 ]
  %114 = icmp eq i64 %57, 0
  br i1 %114, label %126, label %115

115:                                              ; preds = %112
  %116 = load float, float* %16, align 4, !tbaa !8
  %117 = mul nsw i64 %113, %44
  %118 = add nsw i64 %117, %45
  %119 = getelementptr inbounds float, float* %2, i64 %118
  %120 = load float, float* %119, align 4, !tbaa !8
  %121 = add nsw i64 %117, %46
  %122 = getelementptr inbounds float, float* %0, i64 %121
  %123 = load float, float* %122, align 4, !tbaa !8
  %124 = fneg float %120
  %125 = tail call float @llvm.fmuladd.f32(float %124, float %116, float %123)
  store float %125, float* %122, align 4, !tbaa !8
  br label %126

126:                                              ; preds = %115, %112, %43, %12, %41, %6
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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{float 2.500000e+00}
