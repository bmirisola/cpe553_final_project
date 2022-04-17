//
// Created by bmirisola on 4/17/22.
//

#include "Window.cuh"

Window::Window() : windowName("Default") {
    gtk_window_set_title(GTK_WINDOW(window), "Default");
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);
    g_signal_connect(window, "delete-event", G_CALLBACK(gtk_main_quit), NULL);

    gtk_container_add (GTK_CONTAINER (window), grid);
}

Window::Window(const gchar *windowName, int width, int height): windowName(windowName) {
    gtk_window_set_title(GTK_WINDOW(window), windowName);
    gtk_window_set_default_size(GTK_WINDOW(window), width, height);
    g_signal_connect(window, "delete-event", G_CALLBACK(gtk_main_quit), NULL);

    gtk_container_add (GTK_CONTAINER (window), grid);
}

Window::~Window() {
    delete window;
    delete grid;
}

GtkWidget *Window::getGrid() {
    return grid;
}
