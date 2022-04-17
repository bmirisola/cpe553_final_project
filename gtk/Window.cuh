//
// Created by bmirisola on 4/17/22.
//

#ifndef CPE553_FINAL_PROJECT_WINDOW_CUH
#define CPE553_FINAL_PROJECT_WINDOW_CUH

#include "gtk/gtk.h"

class Window {
    GtkWidget *window, *grid;
    const gchar *windowName;

public:
    Window();
    Window(const gchar *windowName, int width, int height);
    ~Window();
    GtkWidget *getGrid();


};


#endif //CPE553_FINAL_PROJECT_WINDOW_CUH
