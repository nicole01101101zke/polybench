; ModuleID = '../stencils/jacobi-1d-imper/jacobi1D.cl'
source_filename = "../stencils/jacobi-1d-imper/jacobi1D.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @runJacobi1D_kernel1(float* nocapture readonly %0, float* nocapture %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #2
  %5 = trunc i64 %4 to i32
  %6 = icmp sgt i32 %5, 0
  %7 = add nsw i32 %2, -1
  %8 = icmp sgt i32 %7, %5
  %9 = and i1 %6, %8
  br i1 %9, label %10, label %27

10:                                               ; preds = %3
  %11 = shl i64 %4, 32
  %12 = add i64 %11, -4294967296
  %13 = ashr exact i64 %12, 32
  %14 = getelementptr inbounds float, float* %0, i64 %13
  %15 = load float, float* %14, align 4, !tbaa !8
  %16 = ashr exact i64 %11, 32
  %17 = getelementptr inbounds float, float* %0, i64 %16
  %18 = load float, float* %17, align 4, !tbaa !8
  %19 = fadd float %15, %18
  %20 = add i64 %11, 4294967296
  %21 = ashr exact i64 %20, 32
  %22 = getelementptr inbounds float, float* %0, i64 %21
  %23 = load float, float* %22, align 4, !tbaa !8
  %24 = fadd float %19, %23
  %25 = fmul float %24, 0x3FD5554760000000
  %26 = getelementptr inbounds float, float* %1, i64 %16
  store float %25, float* %26, align 4, !tbaa !8
  br label %27

27:                                               ; preds = %10, %3
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @runJacobi1D_kernel2(float* nocapture %0, float* nocapture readonly %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #2
  %5 = trunc i64 %4 to i32
  %6 = icmp sgt i32 %5, 0
  %7 = add nsw i32 %2, -1
  %8 = icmp sgt i32 %7, %5
  %9 = and i1 %6, %8
  br i1 %9, label %10, label %18

10:                                               ; preds = %3
  %11 = shl i64 %4, 32
  %12 = ashr exact i64 %11, 32
  %13 = getelementptr inbounds float, float* %1, i64 %12
  %14 = bitcast float* %13 to i32*
  %15 = load i32, i32* %14, align 4, !tbaa !8
  %16 = getelementptr inbounds float, float* %0, i64 %12
  %17 = bitcast float* %16 to i32*
  store i32 %15, i32* %17, align 4, !tbaa !8
  br label %18

18:                                               ; preds = %10, %3
  ret void
}

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 0}
!4 = !{!"none", !"none", !"none"}
!5 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"int"}
!6 = !{!"float*", !"float*", !"int"}
!7 = !{!"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
