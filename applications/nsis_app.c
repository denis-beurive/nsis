// Usage: nsis_app.exe <path to the file to create>

#include <stdio.h>
#include <fcntl.h>
#include <time.h>
#include <limits.h>

int main(const int argc, const char* const argv[]) {
    if (2 != argc) {
        fprintf(stderr, "Error: invalid command line - usage: %s <path to the file to create>\n", argv[0]);
        return 1;
    }
    const char* const path = argv[1];

    const int arch = (int)(CHAR_BIT * sizeof(void *));
    printf("arch = %d\n", arch);

    // Test whether the given path already exists or not.
    if (access(path, F_OK) == 0) {
        fprintf(stdout, "The file \"%s\" exists - remove it\n", path);
        if (0 != remove(path)) {
            fprintf(stderr, "Error: cannot remove file \"%s\"\n", path);
            return 1;
        }
    }

    // Create the file.
    FILE* const fd = fopen(path, "w");
    if (NULL == fd) {
        fprintf(stderr, "Error: cannot create file \"%s\"\n", path);
        return 1;
    }
    const time_t timestamp = time(NULL);

    if (64 == arch) {
        fprintf(fd, "%lu\n", (unsigned long)timestamp);
    } else {
        fprintf(fd, "%u\n", (unsigned)timestamp);
    }

    fclose(fd);
    return 0;
}
