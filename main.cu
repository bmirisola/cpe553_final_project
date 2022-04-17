#include "gtk/gtk.h"
#include "WindowManager.cuh"

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);
    WindowManager manager("Matrix Calculator", 1280, 720);
    manager.showWindow();
    gtk_main();
    return 0;
}
