# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

.PHONY = all clean

CC = g++                        # compiler to use

CXXFLAGS = -std=c++2a -O0 -g3 -Wall -c -fmessage-length=0 -I/usr/include/ -I/home/xubuntu/Library/Frameworks/BigNumber/include/
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
