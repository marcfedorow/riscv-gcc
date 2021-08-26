long __attribute__ ((noinline)) andn(long a, long b) {
    long i = ~b;
    return a & i;
}

long __attribute__ ((noinline)) orn(long a, long b) {
    long i = ~b;
    return a | i;
}

long __attribute__ ((noinline)) xorn(long a, long b) {
    long i = a ^ b;
    return ~i;
}

int main() {
    volatile long a = 12, b = 34;
    if (andn(a, b) != (12 & ~34)) return 1;
    if (orn(a, b) != (12 | ~34)) return 2;
    if (xorn(a, b) != (~(12 ^ 34))) return 3;
    return 0;
}