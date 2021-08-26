long __attribute__ ((noinline)) sext_b(long a) {
    char b = a;
    return b & 0x80 ? 0xffffffffffffff00 | b : b;
}

int main() {
    volatile long a = 0x8080;
    if (sext_b(a) != -128) return 1;
    return 0;
}
