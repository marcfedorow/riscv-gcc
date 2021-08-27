long __attribute__ ((noinline)) bclr(long rs1, long rs2) {
    long rd;
    __asm__ ("bclr    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) bclri4(long rs1) {
    long rd;
    __asm__ ("bclri    %0, %1, %2" : "=r"(rd) : "r"(rs1), "i"(4));
    return rd;
}

long __attribute__ ((noinline)) bext(long rs1, long rs2) {
    long rd;
    __asm__ ("bext    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) bexti4(long rs1) {
    long rd;
    __asm__ ("bexti    %0, %1, %2" : "=r"(rd) : "r"(rs1), "i"(4));
    return rd;
}

long __attribute__ ((noinline)) binv(long rs1, long rs2) {
    long rd;
    __asm__ ("binv    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) binvi4(long rs1) {
    long rd;
    __asm__ ("binvi    %0, %1, %2" : "=r"(rd) : "r"(rs1), "i"(4));
    return rd;
}

long __attribute__ ((noinline)) bset(long rs1, long rs2) {
    long rd;
    __asm__ ("bset    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) bseti61(long rs1) {
    long rd;
    __asm__ ("bseti    %0, %1, %2" : "=r"(rd) : "r"(rs1), "i"(61));
    return rd;
}

int main() {
    volatile long a = 0xdeadbeef12345678;
    if (bclr(a, 4) != 0xdeadbeef12345668) return 1;
    if (bclr(a, 7) != 0xdeadbeef12345678) return 1;
    if (bclri4(a) != 0xdeadbeef12345668) return 2;
    if (bext(a, 63) != 1) return 3;
    if (bext(a, 7) != 0) return 3;
    if (bexti4(a) != 1) return 4;
    if (binv(a, 4) != 0xdeadbeef12345668) return 5;
    if (binv(a, 7) != 0xdeadbeef123456f8) return 5;
    if (binvi4(a) != 0xdeadbeef12345668) return 6;
    if (bset(a, 4) != 0xdeadbeef12345678) return 7;
    if (bset(a, 7) != 0xdeadbeef123456f8) return 7;
    if (bseti61(a) != 0xfeadbeef12345678) return 8;
    return 0;
}
