long __attribute__ ((noinline)) rev8(long rs1) {
    long rd;
    __asm__ ("rev8    %0, %1" : "=r"(rd) : "r"(rs1));
    return rd;
}

int main() {
    volatile long a = 0x1100023300004455;
    if (rev8(a) != 0x5544000033020011) return 1;
    return 0;
}
