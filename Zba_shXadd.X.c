long sh1add(long a, long b) {
    return (a << 1) + b;
}

long sh1add_uw(long a, long b) {
    long i = (unsigned int)a;
    return (i << 1) + b;
}

long sh2add(long a, long b) {
    return (a << 2) + b;
}

long sh2add_uw(long a, long b) {
    long i = (unsigned int)a;
    return (i << 2) + b;
}

long sh3add(long a, long b) {
    return (a << 3) + b;
}

long sh3add_uw(long a, long b) {
    long i = (unsigned int)a;
    return (i << 3) + b;
}


int main() {
    volatile long a = 512, b = 10;
    if (sh1add(a, b) != 512*2 + 10) return 1;
    if (sh1add_uw(a, b) != 512*2 + 10) return 2;
    if (sh2add(a, b) != 512*4 + 10) return 3;
    if (sh2add_uw(a, b) != 512*4 + 10) return 4;
    if (sh3add(a, b) != 512*8 + 10) return 5;
    if (sh3add_uw(a, b) != 512*8 + 10) return 6;
    return 0;
}
