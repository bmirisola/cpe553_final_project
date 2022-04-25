#include "gtk/gtk.h"
#include "gui/WindowManager.cuh"

WindowManager *manager;

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);
    manager = new WindowManager("Matrix Calculator", 250, 80);
    manager->addCalculationButtons();
    manager->showWindow();
    gtk_main();
    return 0;
}