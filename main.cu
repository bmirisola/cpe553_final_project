#include "gtk/gtk.h"
#include "test/window_manager.h"

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);
    createWindow();
    addButtons();
    gtk_main();
    return 0;
}
