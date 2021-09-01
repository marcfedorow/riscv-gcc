
long __attribute__ ((noinline)) cpop(long a) {
    int d;
    __asm__ ("cpop     %0, %1" : "=r"(d) : "r"(a));
    return d;
}

long __attribute__ ((noinline)) cpopw(long a) {
    int d;
    __asm__ ("cpopw     %0, %1" : "=r"(d) : "r"(a));
    return d;
}

int _main() {
    volatile long a = 0xC0007300FFF0;   // 0 2 5 12
    if (cpop(a) != 19) return 1;
    if (cpopw(a) != 17) return 2;
    return 0;
}

char *_file = __FILE__;

