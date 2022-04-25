#include "Window.cuh"

Window::Window() : windowName("Default") {
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Default");
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);
    g_signal_connect(window, "delete-event", G_CALLBACK(gtk_main_quit), NULL);

    grid = gtk_grid_new();
    gtk_container_add(GTK_CONTAINER (window), grid);
}

Window::Window(const gchar *windowName, int width, int height) : windowName(windowName) {
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), windowName);
    gtk_window_set_default_size(GTK_WINDOW(window), width, height);
    g_signal_connect(window, "delete-event", G_CALLBACK(gtk_main_quit), NULL);

    grid = gtk_grid_new();
    gtk_container_add(GTK_CONTAINER (window), grid);
}

Window::~Window() {
    //delete window;
    //delete grid;
}

GtkWidget *Window::getGrid() {
    return grid;
}

GtkWidget *Window::getWindow() {
    return window;
}

void Window::addWidget(GtkWidget *widget, int col, int row, int width, int height) {
    gtk_grid_attach(GTK_GRID(grid), widget, col, row, width, height);
}