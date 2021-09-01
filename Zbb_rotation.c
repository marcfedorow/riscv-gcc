#include <stdio.h>

long __attribute__ ((noinline)) rol(long rs1, long rs2) {
    long rd;
    __asm__ ("rol    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) rolw(long rs1, long rs2) {
    long rd;
    __asm__ ("rolw    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) ror(long rs1, long rs2) {
    long rd;
    __asm__ ("ror    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) rori_1(long rs1) {
    long rd;
    __asm__ ("rori    %0, %1, %2" : "=r"(rd) : "r"(rs1), "i"(1));
    return rd;
}

long __attribute__ ((noinline)) roriw_1(long rs1) {
    long rd;
    __asm__ ("roriw    %0, %1, %2" : "=r"(rd) : "r"(rs1), "i"(1));
    return rd;
}

long __attribute__ ((noinline)) rorw(long rs1, long rs2) {
    long rd;
    __asm__ ("rorw    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

int _main() {
    volatile long a = 0x8080808080808080;
    if (rol(a, 1) != 0x0101010101010101) return 1;
    if (rolw(a, 1) != 0x01010101) return 2;
    if (ror(a, 1) != 0x4040404040404040) return 3;
    if (rori_1(a) != 0x4040404040404040) return 4;
    if (roriw_1(a) != 0x40404040) return 5;
    if (rorw(a, 1) != 0x40404040) return 6;
    return 0;
}

char *_file = __FILE__;
