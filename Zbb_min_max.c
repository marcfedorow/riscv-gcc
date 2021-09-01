long max(long a, long b) {
    return a > b ? a : b;
}

long min(long a, long b) {
    return a < b ? a : b;
}

unsigned long maxu(unsigned long a, unsigned long b) {
    return a > b ? a : b;
}

unsigned long minu(unsigned long a, unsigned long b) {
    return a < b ? a : b;
}


int _main() {
    volatile long a = 34, b = -56;
    if (max(a, b) != 34) return 1;
    if (min(a, b) != -56) return 2;
    if (maxu(a, b) != -56) return 3;
    if (minu(a, b) != 34) return 4;
    return 0;
}

char *_file = __FILE__;
