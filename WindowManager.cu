//
// Created by bmirisola on 4/16/22.
//

#include "WindowManager.cuh"

WindowManager::WindowManager() {
    GtkWidget *mainWindow = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(mainWindow), "Default");
    gtk_window_set_default_size(GTK_WINDOW(mainWindow), 640, 480);
    g_signal_connect(mainWindow, "delete-event", G_CALLBACK(gtk_main_quit), NULL);

    GtkWidget *grid = gtk_grid_new();
    gtk_container_add (GTK_CONTAINER (mainWindow), grid);

    windows.push_back(mainWindow);
}

WindowManager::WindowManager(const gchar *firstWindowName, int width, int height) {
    GtkWidget *mainWindow = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(mainWindow), firstWindowName);
    gtk_window_set_default_size(GTK_WINDOW(mainWindow), width, height);
    g_signal_connect(mainWindow, "delete-event", G_CALLBACK(gtk_main_quit), NULL);

    GtkWidget *grid = gtk_grid_new();
    gtk_container_add (GTK_CONTAINER (mainWindow), grid);

    windows.push_back(mainWindow);
}

WindowManager::~WindowManager() {
    for (std::vector<GtkWidget*>::iterator i = windows.begin(); i != windows.end(); ++i) {
        delete *i;
    }
    windows.clear(); // not necessary
}

GtkWidget *WindowManager::getWindow() {
    return nullptr;
}

void WindowManager::addButton(const gchar *text, GtkWidget *window) {
    GtkWidget *btn_ptr = gtk_button_new_with_label(text);

}

void WindowManager::showWindow() {
    gtk_widget_show(windows.at(0));
}

void WindowManager::addWindow(string windowName, int width, int height) {

}