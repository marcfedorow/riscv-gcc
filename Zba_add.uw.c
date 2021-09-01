int _main() {
    volatile long a = 10, b = 0x80000000;
    long c = a + (unsigned int) b;
    if (c != 0x8000000A) return 1;
    return 0;
}

char *_file = __FILE__;
