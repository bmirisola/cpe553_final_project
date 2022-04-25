#ifndef KERNEL_CUH_
#define KERNEL_CUH_

#include "gtk/gtk.h"
#include "string"
#include <math.h>
#include <iostream>
#include "cuda_runtime.h"
#include <cstdlib>
#include <vector>
#include <fstream>
#include <sstream>

using namespace std;

void matrixMultiplication(float *A, float *B, float *C, int N);
void matrixAddition(float *A, float *B, float *C, int N);
void matrixSubtraction(float *A, float *B, float *C, int N);

void matrixOperations(GtkWidget *widget, gpointer data);
#endif