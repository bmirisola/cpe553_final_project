#include "gtk/gtk.h"
#include "gui/WindowManager.cuh"

WindowManager* manager;

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);
    manager = new WindowManager("Matrix Calculator", 640, 480);
    //manager.createMatrix(3,4);
    manager->addCalculationButtons();
    manager->showWindow();


    gtk_main();
    return 0;
}