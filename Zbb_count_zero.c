
long __attribute__ ((noinline)) clz(long a) {
    int d;
    __asm__ ("clz     %0, %1" : "=r"(d) : "r"(a));
    return d;
    // long d = 1; d <<= 63;
    // for (int i = 0; i < 64; ++i) {
    //     if (a & d) return i;
    //     d >>= 1;
    // }
    // return 64;
}

long __attribute__ ((noinline)) clzw(long a) {
    int d;
    __asm__ ("clzw     %0, %1" : "=r"(d) : "r"(a));
    return d;
}

long __attribute__ ((noinline)) ctz(long a) {
    int d;
    __asm__ ("ctz     %0, %1" : "=r"(d) : "r"(a));
    return d;
}

long __attribute__ ((noinline)) ctzw(long a) {
    int d;
    __asm__ ("ctzw     %0, %1" : "=r"(d) : "r"(a));
    return d;
}

int main() {
    volatile long a = 0x8000, b = 0x1000000000;
    if (clz(a) != 48) return 1;
    if (clzw(a) != 16) return 2;
    if (ctz(a) != 15) return 3;
    if (ctzw(b) != 32) return 4;
    return 0;
}
