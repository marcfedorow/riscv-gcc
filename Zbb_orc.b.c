
long __attribute__ ((noinline)) orc_b(long rs1) {
    long rd;
    __asm__ ("orc.b    %0, %1" : "=r"(rd) : "r"(rs1));
    return rd;
}

int _main() {
    volatile long a = 0x1100223300004455;
    if (orc_b(a) != 0xff00ffff0000ffff) return 1;
    return 0;
}

char *_file = __FILE__;
