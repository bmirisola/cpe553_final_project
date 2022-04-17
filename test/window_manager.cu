#include "window_manager.h"

void createWindow() {
    GtkWidget *window, *label, *grid, *dropdown;
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Matrix Calculator");
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    label = gtk_label_new("Hello World");

    grid = gtk_grid_new();

    //gtk_container_add(GTK_CONTAINER(window),label);
    gtk_container_add(GTK_CONTAINER(window), grid);
    gtk_widget_show_all(window);

    g_signal_connect(window, "delete-event", G_CALLBACK(gtk_main_quit), NULL);
    gtk_widget_show(window);

}

void addButtons() {

}