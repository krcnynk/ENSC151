# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

.PHONY = all clean

CC = g++                        # compiler to use

# CXXFLAGS = -std=c++2a -O0 -g3 -fno-exceptions -fno-web -fno-var-tracking-assignments -fno-var-tracking \
# 	-fno-unwind-tables -fno-tree-scev-cprop  -fno-tree-reassoc -fno-tree-phiprop -fno-tree-loop-optimize \
# 	-fno-tree-loop-ivcanon -fno-tree-loop-im -fno-tree-loop-if-convert -fno-tree-forwprop -fno-tree-cselim \
# 	-fno-trapping-math -fthreadsafe-statics -fno-strict-volatile-bitfields -fno-stdarg-opt -fno-ssa-backprop  \
# 	-fno-split-ivs-in-unroller -fno-signed-zeros -fno-shrink-wrap-separate -fno-short-enums  \
# 	-fno-schedule-fusion -fno-sched-stalled-insns-dep -fno-sched-spec-insn-heuristic -fno-sched-spec -fno-sched-rank-heuristic \
# 	-fno-sched-last-insn-heuristic -fno-sched-interblock  -fno-sched-group-heuristic -fno-sched-dep-count-heuristic \
# 	-fno-sched-critical-path-heuristic -fno-rtti -fno-rename-registers -fno-printf-return-value \
# 	-fno-prefetch-loop-arrays -fno-plt  -fno-peephole -fno-math-errno -fno-lifetime-dse -fno-jump-tables -fno-ivopts \
# 	-fno-ira-share-spill-slots -fno-ira-share-save-slots -fno-ira-hoist-pressure -fno-inline-atomics -fno-inline \
# 	-fno-gcse-lm -fno-function-cse -fno-fp-int-builtin-inexact -fno-early-inlining -fno-dse -fno-delete-null-pointer-checks\
# 	-fno-dce -fno-auto-inc-dec -fno-asynchronous-unwind-tables -fno-aggressive-loop-optimizations -fno-loop-unroll-and-jam\
# 	-fno-variable-expansion-in-unroller -fno-unroll-loops -Wall -c \
# 	-fmessage-length=0 -I/usr/include/ -I/home/xubuntu/Library/Frameworks/BigNumber/include/

CXXFLAGS = -std=c++2a -O0 -g3 \
	-fno-aggressive-loop-optimizations\
	-fno-allocation-dce\
	-fno-asynchronous-unwind-tables\
	-fno-auto-inc-dec\
	-fno-bit-tests\
	-fno-dce\
	-fno-delete-null-pointer-checks\
	-fno-early-inlining\
	-fno-fp-int-builtin-inexact\
	-fno-function-cse\
	-fno-gcse-lm\
	-fno-inline-atomics\
	-fno-ipa-stack-alignment\
	-fno-ira-hoist-pressure\
	-fno-ira-share-save-slots\
	-fno-ira-share-spill-slots\
	-fno-ivopts\
	-fno-jump-tables\
	-fno-lifetime-dse\
	-fno-math-errno\
	-fno-peephole\
	-fno-plt\
	-fno-prefetch-loop-arrays\
	-fno-printf-return-value\
	-fno-rename-registers\
	-fno-sched-critical-path-heuristic\
	-fno-sched-dep-count-heuristic\
	-fno-sched-group-heuristic\
	-fno-sched-interblock\
	-fno-sched-last-insn-heuristic\
	-fno-sched-rank-heuristic\
	-fno-sched-spec\
	-fno-sched-spec-insn-heuristic\
	-fno-sched-stalled-insns-dep\
	-fno-schedule-fusion\
	-fno-short-enums\
	-fno-shrink-wrap-separate\
	-fno-signed-zeros\
	-fno-split-ivs-in-unroller\
	-fno-ssa-backprop\
	-fno-stack-clash-protection\
	-fno-stdarg-opt\
	-fno-strict-volatile-bitfields\
	-fno-trapping-math\
	-fno-tree-cselim\
	-fno-tree-forwprop\
	-fno-tree-loop-if-convert\
	-fno-tree-loop-im\
	-fno-tree-loop-ivcanon\
	-fno-tree-loop-optimize\
	-fno-tree-phiprop\
	-fno-tree-reassoc\
	-fno-tree-scev-cprop\
	-fno-var-tracking\
	-fno-var-tracking-assignments\
	-fno-web\
	-fexcess-precision=fast\
	-fira-region=one\
	-flive-patching=inline-only-static\
	-fvect-cost-model=cheap\
	-Wall -c \
	-fmessage-length=0 -I/usr/include/ -I/home/xubuntu/Library/Frameworks/BigNumber/include/



#-fno-reg-struct-return BREAKING THE TIMING
LDFLAGS= -L/home/xubuntu/Library/Frameworks/BigNumber/lib/ 
LDLIBS =  -lBigNumber
SRCS := $(wildcard *.cpp)
BINS := $(SRCS:%.cpp=%) $(SRCS:%.cpp=%.o)

all: ${BINS}

%: %.o
	${CC} ${LDFLAGS} $< ${LDLIBS} -o $@

%.o: %.cpp
	${CC} ${CXXFLAGS} -c $<

clean:
	rm -rvf *.o ${BINS}
