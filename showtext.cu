#include "showtext.h"

void createWindow(){
    GtkWidget* window;
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    g_signal_connect(window,"delete-event",G_CALLBACK(gtk_main_quit),NULL);
    gtk_widget_show(window);
}