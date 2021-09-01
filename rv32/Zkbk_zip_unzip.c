long __attribute__ ((noinline)) zip(long rs1) {
    long rd;
    __asm__ ("zip    %0, %1" : "=r"(rd) : "r"(rs1));
    return rd;
}

long __attribute__ ((noinline)) unzip(long rs1) {
    long rd;
    __asm__ ("unzip    %0, %1" : "=r"(rd) : "r"(rs1));
    return rd;
}

int main() {
    volatile long a = 0x12345678, b = 0x131c1f60;
    if (zip(a) != 0x131c1f60) return 1;
    if (unzip(b) != 0x12345678) return 2;
    return 0;
}
