; ModuleID = '../linear-algebra/kernels/doitgen/doitgen.cl'
source_filename = "../linear-algebra/kernels/doitgen/doitgen.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @doitgen_kernel1(i32 %0, i32 %1, i32 %2, float* nocapture readonly %3, float* nocapture readonly %4, float* nocapture %5, i32 %6) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %11 = trunc i64 %10 to i32
  %12 = icmp slt i32 %9, %2
  %13 = icmp slt i32 %11, %1
  %14 = and i1 %12, %13
  br i1 %14, label %15, label %70

15:                                               ; preds = %7
  %16 = mul i32 %6, %1
  %17 = add i32 %16, %11
  %18 = mul i32 %17, %2
  %19 = add nsw i32 %18, %9
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float* %5, i64 %20
  store float 0.000000e+00, float* %21, align 4, !tbaa !8
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %23, label %70

23:                                               ; preds = %15
  %24 = zext i32 %2 to i64
  %25 = shl i64 %8, 32
  %26 = ashr exact i64 %25, 32
  %27 = sext i32 %18 to i64
  %28 = zext i32 %2 to i64
  %29 = and i64 %28, 1
  %30 = icmp eq i32 %2, 1
  br i1 %30, label %57, label %31

31:                                               ; preds = %23
  %32 = sub nsw i64 %28, %29
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi float [ 0.000000e+00, %31 ], [ %53, %33 ]
  %35 = phi i64 [ 0, %31 ], [ %54, %33 ]
  %36 = phi i64 [ %32, %31 ], [ %55, %33 ]
  %37 = add nsw i64 %35, %27
  %38 = getelementptr inbounds float, float* %3, i64 %37
  %39 = load float, float* %38, align 4, !tbaa !8
  %40 = mul nsw i64 %35, %24
  %41 = add nsw i64 %40, %26
  %42 = getelementptr inbounds float, float* %4, i64 %41
  %43 = load float, float* %42, align 4, !tbaa !8
  %44 = tail call float @llvm.fmuladd.f32(float %39, float %43, float %34)
  store float %44, float* %21, align 4, !tbaa !8
  %45 = or i64 %35, 1
  %46 = add nsw i64 %45, %27
  %47 = getelementptr inbounds float, float* %3, i64 %46
  %48 = load float, float* %47, align 4, !tbaa !8
  %49 = mul nsw i64 %45, %24
  %50 = add nsw i64 %49, %26
  %51 = getelementptr inbounds float, float* %4, i64 %50
  %52 = load float, float* %51, align 4, !tbaa !8
  %53 = tail call float @llvm.fmuladd.f32(float %48, float %52, float %44)
  store float %53, float* %21, align 4, !tbaa !8
  %54 = add nuw nsw i64 %35, 2
  %55 = add i64 %36, -2
  %56 = icmp eq i64 %55, 0
  br i1 %56, label %57, label %33

57:                                               ; preds = %33, %23
  %58 = phi float [ 0.000000e+00, %23 ], [ %53, %33 ]
  %59 = phi i64 [ 0, %23 ], [ %54, %33 ]
  %60 = icmp eq i64 %29, 0
  br i1 %60, label %70, label %61

61:                                               ; preds = %57
  %62 = add nsw i64 %59, %27
  %63 = getelementptr inbounds float, float* %3, i64 %62
  %64 = load float, float* %63, align 4, !tbaa !8
  %65 = mul nsw i64 %59, %24
  %66 = add nsw i64 %65, %26
  %67 = getelementptr inbounds float, float* %4, i64 %66
  %68 = load float, float* %67, align 4, !tbaa !8
  %69 = tail call float @llvm.fmuladd.f32(float %64, float %68, float %58)
  store float %69, float* %21, align 4, !tbaa !8
  br label %70

70:                                               ; preds = %61, %57, %15, %7
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @doitgen_kernel2(i32 %0, i32 %1, i32 %2, float* nocapture %3, float* nocapture readnone %4, float* nocapture readonly %5, i32 %6) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %11 = trunc i64 %10 to i32
  %12 = icmp slt i32 %9, %2
  %13 = icmp slt i32 %11, %1
  %14 = and i1 %12, %13
  br i1 %14, label %15, label %26

15:                                               ; preds = %7
  %16 = mul i32 %6, %1
  %17 = add i32 %16, %11
  %18 = mul i32 %17, %2
  %19 = add i32 %18, %9
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float* %5, i64 %20
  %22 = bitcast float* %21 to i32*
  %23 = load i32, i32* %22, align 4, !tbaa !8
  %24 = getelementptr inbounds float, float* %3, i64 %20
  %25 = bitcast float* %24 to i32*
  store i32 %23, i32* %25, align 4, !tbaa !8
  br label %26

26:                                               ; preds = %15, %7
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
!3 = !{i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"int", !"int", !"int", !"DATA_TYPE*", !"DATA_TYPE*", !"DATA_TYPE*", !"int"}
!6 = !{!"int", !"int", !"int", !"float*", !"float*", !"float*", !"int"}
!7 = !{!"", !"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
