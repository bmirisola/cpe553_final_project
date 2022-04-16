//
// Created by bmirisola on 4/16/22.
//

#include <gtk/gtk.h>


#ifndef CPE553_FINAL_PROJECT_SHOWTEXT_H
#define CPE553_FINAL_PROJECT_SHOWTEXT_H

void createWindow(){
    GtkWidget* window;
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    g_signal_connect(window,"delete-event",G_CALLBACK(gtk_main_quit),NULL);
    gtk_widget_show(window);
}

#endif //CPE553_FINAL_PROJECT_SHOWTEXT_H
