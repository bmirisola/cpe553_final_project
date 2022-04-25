//
// Created by bmirisola on 4/16/22.
//

#include "WindowManager.cuh"

WindowManager::WindowManager() {
    Window *mainWindow = new Window();
    windows.push_back(mainWindow);
}

WindowManager::WindowManager(const gchar *firstWindowName, int width, int height) {
    Window *mainWindow = new Window(firstWindowName, width, height);
    windows.push_back(mainWindow);
}

WindowManager::~WindowManager() {
    for (std::vector<Window *>::iterator i = windows.begin(); i != windows.end(); ++i) {
        delete *i;
    }
    //windows.clear(); // not necessary
}

void WindowManager::showWindow() {
    gtk_widget_show_all(windows.at(0)->getWindow());
}

void WindowManager::addCalculationButtons() {
    GtkWidget *comboBox = gtk_combo_box_text_new();
    GtkWidget *calculateButton = gtk_button_new_with_label("Calculate");
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(comboBox), 0, "+");
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(comboBox), 0, "-");
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(comboBox), 0, "*");
    windows.at(0)->addWidget(comboBox, 0, 0, 1, 1);
    windows.at(0)->addWidget(calculateButton, 1, 0, 1, 1);
    g_signal_connect(G_OBJECT(calculateButton), "clicked", G_CALLBACK(matrixOperations), comboBox);
}

GtkWidget *WindowManager::getComboBox() {
    return comboBox;
}