#include "Window.cuh"

/*
 * Wrapper Class for GTK window and grid widgets
 */

Window::Window() : windowName("Default") {
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL); //set window type to top level. Big window everyone is used to
    gtk_window_set_title(GTK_WINDOW(window), "Default"); // Set title of window
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480); // set window resolution to 640 x 480
    g_signal_connect(window, "delete-event", G_CALLBACK(gtk_main_quit), NULL); // set up what happens when x button is clicked. Destroy window with FUNCOR

    grid = gtk_grid_new(); //create new grid to hold widgets
    gtk_container_add(GTK_CONTAINER (window), grid); // Add grid to window
}

Window::Window(const gchar *windowName, int width, int height) : windowName(windowName) {
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL); //set window type to top level. Big window everyone is used to
    gtk_window_set_title(GTK_WINDOW(window), windowName); // Set title of window to windowname var
    gtk_window_set_default_size(GTK_WINDOW(window), width, height); // Set resolution to width and height vars
    g_signal_connect(window, "delete-event", G_CALLBACK(gtk_main_quit), NULL); // set up what happens when x button is clicked. Destroy window with FUNCOR

    grid = gtk_grid_new(); //create new grid to hold widgets
    gtk_container_add(GTK_CONTAINER (window), grid); // Add grid to window
}

Window::~Window() {
}

// Return grid of window
GtkWidget *Window::getGrid() {
    return grid;
}

//Return window of window class
GtkWidget *Window::getWindow() {
    return window;
}
// Add widget to window at col, row position with width and height
void Window::addWidget(GtkWidget *widget, int col, int row, int width, int height) {
    gtk_grid_attach(GTK_GRID(grid), widget, col, row, width, height);
}