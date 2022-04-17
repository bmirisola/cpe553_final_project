//
// Created by bmirisola on 4/16/22.
//

#include "WindowManager.cuh"

WindowManager::WindowManager() {
    GtkWidget *mainWindow = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(mainWindow), "Default");
    gtk_window_set_default_size(GTK_WINDOW(mainWindow), 640, 480);
    windows.push_back(mainWindow);
}

WindowManager::WindowManager(const gchar *firstWindowName, int width, int height) {
    GtkWidget *mainWindow = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(mainWindow), firstWindowName);
    gtk_window_set_default_size(GTK_WINDOW(mainWindow), width, height);
    windows.push_back(mainWindow);
}

WindowManager::~WindowManager() {
    for (std::vector<GtkWidget*>::iterator i = windows.begin(); i != windows.end(); ++i) {
        delete *i;
    }
}

GtkWidget *WindowManager::getWindow() {
    return nullptr;
}

void WindowManager::addButton(string text, GtkWidget *window) {

}

void WindowManager::showWindow() {

}

void WindowManager::addWindow(string windowName, int width, int height) {

}
