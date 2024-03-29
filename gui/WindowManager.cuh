//
// Created by bmirisola on 4/16/22.
//

#ifndef CPE553_FINAL_PROJECT_WINDOWMANAGER_CUH
#define CPE553_FINAL_PROJECT_WINDOWMANAGER_CUH

#include "vector"
#include "string"
#include "gtk/gtk.h"
#include "Window.cuh"
#include "../matrices/kernels.cuh"


using namespace std;

class WindowManager {
    vector<Window *> windows;
    GtkWidget *comboBox;
public:

    WindowManager();

    WindowManager(const gchar *firstWindowName, int width, int height);

    ~WindowManager();

    GtkWidget *getWindow();

    void showWindow();

    void addCalculationButtons();

    GtkWidget *getComboBox();

};

#endif //CPE553_FINAL_PROJECT_WINDOWMANAGER_CUH