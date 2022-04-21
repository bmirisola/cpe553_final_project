//
// Created by bmirisola on 4/17/22.
//

#ifndef CPE553_FINAL_PROJECT_WINDOW_CUH
#define CPE553_FINAL_PROJECT_WINDOW_CUH

#include "gtk/gtk.h"
#include "vector"

using namespace std;

class Window {
    GtkWidget *window, *grid;
    const gchar *windowName;
    vector<GtkWidget*> widgets;


public:
    Window();
    Window(const gchar *windowName, int width, int height);
    ~Window();
    GtkWidget *getGrid();
    GtkWidget  *getWindow();
    void addWidget(GtkWidget *widget, int col, int row, int width, int height);


};


#endif //CPE553_FINAL_PROJECT_WINDOW_CUH
