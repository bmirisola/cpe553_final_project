#ifndef KERNEL_CUH_
#define KERNEL_CUH_

#include "gtk/gtk.h"

void matrixMultiplication(float *A, float *B, float *C, int N);
void matrixOperations(GtkWidget *widget, gpointer data);
#endif