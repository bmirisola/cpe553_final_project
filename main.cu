#include <iostream>
#include "gtk/gtk.h"
#include "showtext.h"

int main(int argc, char* argv[]) {
    gtk_init(&argc,&argv);
    createWindow();
    gtk_main();
    return 0;
}
