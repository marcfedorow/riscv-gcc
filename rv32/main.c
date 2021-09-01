#include <stdio.h>

int _main();    // testcases in Z*.c
extern char *_file;    // testcases filename

int main() {
    int ret = _main();
    if (ret == 0) {
        printf("- test %s pass\n", _file);
    } else {
        printf("!!! test %s failed! (%d)\n", _file, ret);
    }
    return ret;
}
