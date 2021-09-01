long __attribute__ ((noinline)) clmul(long rs1, long rs2) {
    long rd;
    __asm__ ("clmul    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) clmulh(long rs1, long rs2) {
    long rd;
    __asm__ ("clmulh    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

int _main() {
    volatile long a = 0xffffccccffffcccc, b = 0xdeadbeef12345678;
    if (clmul(a, b) != 0xb330e223312d6820) return 1;
    if (clmulh(a, b) != 0x4a6482eec87908ed) return 2;
    return 0;
}

char *_file = __FILE__;
