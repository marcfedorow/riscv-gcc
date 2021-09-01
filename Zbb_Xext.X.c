long __attribute__ ((noinline)) sext_b(long a) {
    char b = a;
    return b & 0x80 ? (long)0xffffffffffffff00 | b : b;
}

long __attribute__ ((noinline)) sext_h(long a) {
    short b = a;
    return b;
}

long __attribute__ ((noinline)) zext_h(long a) {
    unsigned short b = a;
    return b;
}

int _main() {
    volatile long a = 0x8080;
    if (sext_b(a) != -128) return 1;
    if (sext_h(a) != -32640) return 2;
    if (zext_h(a) != 32896) return 3;
    return 0;
}

char *_file = __FILE__;
