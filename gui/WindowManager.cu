//
// Created by bmirisola on 4/16/22.
//

#include "WindowManager.cuh"

/*
 * WindowManager Class to manage created windows
 *  Holds windows in vector to be referenced later
 */

WindowManager::WindowManager() {
    Window *mainWindow = new Window();
    windows.push_back(mainWindow);
}

// Creates new window and adds to
WindowManager::WindowManager(const gchar *firstWindowName, int width, int height) {
    Window *mainWindow = new Window(firstWindowName, width, height);
    windows.push_back(mainWindow);
}

// Loops through all windows and destroys them to free memory
WindowManager::~WindowManager() {
    for (std::vector<Window *>::iterator i = windows.begin(); i != windows.end(); ++i) {
        delete *i;
    }
    //windows.clear(); // not necessary
}

// Sets visibility to true for all  widgets attached to the default window
void WindowManager::showWindow() {
    gtk_widget_show_all(windows.at(0)->getWindow());
}

void WindowManager::addCalculationButtons() {
    // Dynamically creates a comboBox and button
    comboBox = gtk_combo_box_text_new();
    GtkWidget *calculateButton = gtk_button_new_with_label("Calculate");

    //Add Operation options to dropdown menu
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(comboBox), 0, "+");
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(comboBox), 0, "-");
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(comboBox), 0, "*");

    //Add the widgets to the grid
    windows.at(0)->addWidget(comboBox, 0, 0, 1, 1);
    windows.at(0)->addWidget(calculateButton, 1, 0, 1, 1);

    //When button is clicked set callback function to FUNCOR object matrixOperations and send over the comboBox
    g_signal_connect(G_OBJECT(calculateButton), "clicked", G_CALLBACK(matrixOperations), comboBox);
}

GtkWidget *WindowManager::getComboBox() {
    return comboBox;
}