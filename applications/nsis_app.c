// Usage: nsis_app.exe <path to the file to edit>

#include <stdio.h>
#include <unistd.h>

static char* const SUBLIM_TEXT = "C:\\Program Files\\Sublime Text\\sublime_text.exe";

int main(const int argc, char* const argv[]) {
    if (2 != argc) {
        fprintf(stderr, "Error: invalid command line - usage: %s <path to the file to edit>\n", argv[0]);
        return 1;
    }
    char* const path = argv[1];
    char* const exec_argv[] = { SUBLIM_TEXT, path, NULL };
    char* const exec_envp[] = { NULL };
    execve(SUBLIM_TEXT, exec_argv, exec_envp);
    return 0;
}
