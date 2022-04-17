//
// Created by bmirisola on 4/16/22.
//

#include "WindowManager.cuh"

WindowManager::WindowManager() {
    Window *mainWindow = new Window();
    windows.push_back(mainWindow);
}

WindowManager::WindowManager(const gchar *firstWindowName, int width, int height) {
    Window *mainWindow = new Window(firstWindowName,width,height);
    windows.push_back(mainWindow);
}

WindowManager::~WindowManager() {
    for (std::vector<Window*>::iterator i = windows.begin(); i != windows.end(); ++i) {
        delete *i;
    }
    //windows.clear(); // not necessary
}

GtkWidget *WindowManager::getWindow() {
    return nullptr;
}

void WindowManager::addButton(const gchar *text, GtkWidget *window) {
    GtkWidget *btn_ptr = gtk_button_new_with_label(text);
}

void WindowManager::showWindow() {
    gtk_widget_show_all(windows.at(0)->getWindow());
}

void WindowManager::addWindow(const gchar *windowName, int width, int height) {
    windows.push_back(new Window(windowName, width, height));
}

void WindowManager::createMatrix(int rows, int columns) {
    float x [rows][columns];
    for(int i = 0; i < rows*10; i+=10){
        for(int j=0; j < columns*10; j+=10){
            gtk_grid_attach(GTK_GRID(windows.at(0)->getGrid()), gtk_button_new_with_label("bob"), j, i, 10, 10);
        }
    }
    //gtk_grid_attach(GTK_GRID(windows.at(0)->getGrid()), gtk_button_new_with_label("bob"), 10, 10, 10, 10);
    //gtk_grid_attach(GTK_GRID(windows.at(0)->getGrid()), gtk_button_new_with_label("bob2"), 0, 10, 10, 10);




}
