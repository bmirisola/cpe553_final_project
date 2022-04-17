//
// Created by bmirisola on 4/16/22.
//

#ifndef CPE553_FINAL_PROJECT_WINDOWMANAGER_CUH
#define CPE553_FINAL_PROJECT_WINDOWMANAGER_CUH

#include "vector"
#include "string"
#include "gtk/gtk.h";
#include "Window.cuh"

using namespace std;

class WindowManager {
    vector<Window*> windows;

public:
    WindowManager();

    WindowManager(const gchar *firstWindowName, int width, int height);

    ~WindowManager();

    void addWindow(const gchar *windowName, int width, int height);

    GtkWidget *getWindow();

    void addButton(const gchar *text, GtkWidget *window);

    void showWindow();

    void createMatrix(int rows, int columns);


};


#endif //CPE553_FINAL_PROJECT_WINDOWMANAGER_CUH