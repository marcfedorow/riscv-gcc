long __attribute__ ((noinline)) xperm_b(long rs1, long rs2) {
    long rd;
    __asm__ ("xperm.b    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

long __attribute__ ((noinline)) xperm_n(long rs1, long rs2) {
    long rd;
    __asm__ ("xperm.n    %0, %1, %2" : "=r"(rd) : "r"(rs1), "r"(rs2));
    return rd;
}

int main() {
    volatile long a = 0xdeadbeef12345678, b = 0x0502010009010302, c = 0x112210f4c01ce682;
    if (xperm_b(a, b) != 0xbe34567800561234) return 1;
    if (xperm_n(a, c) != 0x776678d4d87de2f6) return 2;
    return 0;
}
