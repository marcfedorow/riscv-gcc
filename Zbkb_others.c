long __attribute__ ((noinline)) pack(long rs1, long rs2) {
    long rd;
    __asm__ ("pack    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) packh(long rs1, long rs2) {
    long rd;
    __asm__ ("packh    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) packw(long rs1, long rs2) {
    long rd;
    __asm__ ("packw    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) rev_b(long rs1) {
    long rd;
    __asm__ ("rev.b    %0, %1" : "=r"(rd) : "r"(rs1));
    return rd;
}

int main() {
    volatile long a = 0xdeadbeef12345678, b = 0xffff1234ffff4321;
    if (pack(a, b) != 0xffff432112345678) return 1;
    if (packh(a, b) != 0x2178) return 2;
    if (packw(a, b) != 0x43215678) return 3;
    if (rev_b(a) != 0x7bb57df7482c6a1e) return 4;
    // zip, unzip not included since this testcase is for rv64
    return 0;
}
