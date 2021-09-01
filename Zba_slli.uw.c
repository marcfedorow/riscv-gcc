long slli_uw(long a) {
    long i = (unsigned int) a;
    return i << 3;
}

int _main() {
    volatile long a = 10;
    if (slli_uw(a) != 80) return 1;
    return 0;
}

char *_file = __FILE__;
