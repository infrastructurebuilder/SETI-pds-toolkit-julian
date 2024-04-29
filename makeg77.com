cc -c \
dates.c \
format.c \
juldates.c \
leapsecs.c \
parse.c \
seconds.c \
tai_et.c \
utc_tai.c
gfortran -c -fno-second-underscore fjulian.for

cc -c fortran.c rlerrors.c rlmemory.c
gfortran -c -fno-second-underscore fstrings.for

ar cr julian.a \
dates.o \
format.o \
juldates.o \
leapsecs.o \
parse.o \
seconds.o \
tai_et.o \
utc_tai.o \
fjulian.o \
fortran.o \
rlerrors.o \
rlmemory.o \
fstrings.o \

ranlib julian.a

rm *.o

gfortran -o tconvert -fno-second-underscore tconvert.for julian.a
