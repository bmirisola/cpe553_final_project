//
// Created by bmirisola on 4/16/22.
//

#include "WindowManager.cuh"

WindowManager::WindowManager() {
    Window *mainWindow = new Window();
    windows.push_back(mainWindow);
}

WindowManager::WindowManager(const gchar *firstWindowName, int width, int height) {
    Window *mainWindow = new Window(firstWindowName,width,height);
    windows.push_back(mainWindow);
}

WindowManager::~WindowManager() {
    for (std::vector<Window*>::iterator i = windows.begin(); i != windows.end(); ++i) {
        delete *i;
    }
    //windows.clear(); // not necessary
}

GtkWidget *WindowManager::getWindow() {
    return nullptr;
}

void WindowManager::addButton(const gchar *text, GtkWidget *window) {
    GtkWidget *btn_ptr = gtk_button_new_with_label(text);
}

void WindowManager::showWindow() {
    gtk_widget_show_all(windows.at(0)->getWindow());
}

void WindowManager::addWindow(const gchar *windowName, int width, int height) {
    windows.push_back(new Window(windowName, width, height));
}

void WindowManager::createMatrix(int rows, int columns) {
    float x [rows][columns];
    for(int i = 0; i < rows*10; i+=10){
        for(int j=0; j < columns*10; j+=10){
            gtk_grid_attach(GTK_GRID(windows.at(0)->getGrid()), gtk_entry_new(), j, i, 2, 2);
        }
    }

}

void WindowManager::addCalculationButtons() {
    GtkWidget *comboBox = gtk_combo_box_text_new();
    GtkWidget *calculateButton = gtk_button_new_with_label("Calculate");
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(comboBox), 0, "+");
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(comboBox), 0, "-");
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(comboBox), 0, "*");
    windows.at(0)->addWidget(comboBox, 0, 0, 1, 1);
    windows.at(0)->addWidget(calculateButton, 1,0,1,1);
//g_signal_connect(G_OBJECT(calculateButton), "clicked", G_CALLBACK(matrixOperations),(gpointer)gtk_combo_box_text_get_active_text(GTK_COMBO_BOX_TEXT(comboBox)));
    g_signal_connect(G_OBJECT(calculateButton), "clicked", G_CALLBACK(matrixOperations),comboBox);


}

GtkWidget *WindowManager::getComboBox() {
    return comboBox;
}