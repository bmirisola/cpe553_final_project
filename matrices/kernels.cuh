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
#include "dev_array.cuh"

using namespace std;

void matrixMultiplication(double *A, double *B, double *C, int N);

void matrixAddition(double *A, double *B, double *C, int N);

void matrixSubtraction(double *A, double *B, double *C, int N);

void matrixOperations(GtkWidget *widget, gpointer data);

#endif