# OpenCL_SDK=/global/homes/s/sgrauerg/NVIDIA_GPU_Computing_SDK
# -L${OpenCL_SDK}/shared/lib
INCLUDE=-I/usr/local/cuda/include -I${PATH_TO_UTILS}
LIBPATH=-L/usr/local/cuda/lib64
LIB=-lOpenCL -lm
all:
	gcc -O3 ${INCLUDE} ${LIBPATH} -o ${EXECUTABLE} ${CFILES} ${LIB}

clean:
	rm -f *~ *.exe *.txt
