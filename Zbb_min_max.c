int max(int a, int b) {
    return a > b ? a : b;
}

int min(int a, int b) {
    return a < b ? a : b;
}

int main() {
    volatile int a = 34, b = 56;
    if (max(a, b) != 56 || min(a, b) != 34) {
        return 1;
    }
    return 0;
}
