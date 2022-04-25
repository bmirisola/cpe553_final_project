#include "kernels.cuh"


using namespace std;

__global__ void matrixMultiplicationKernel(float* A, float* B, float* C, int N) {

    int ROW = blockIdx.y*blockDim.y+threadIdx.y;
    int COL = blockIdx.x*blockDim.x+threadIdx.x;

    float tmpSum = 0;

    if (ROW < N && COL < N) {
        // each thread computes one element of the block sub-matrix
        for (int i = 0; i < N; i++) {
            tmpSum += A[ROW * N + i] * B[i * N + COL];
        }
    }
    C[ROW * N + COL] = tmpSum;
}


void matrixMultiplication(float *A, float *B, float *C, int N){

    // declare the number of blocks per grid and the number of threads per block
    // use 1 to 512 threads per block
    dim3 threadsPerBlock(N, N);
    dim3 blocksPerGrid(1, 1);

    matrixMultiplicationKernel<<<blocksPerGrid,threadsPerBlock>>>(A, B, C, N);
}

void matrixOperations(GtkWidget *widget, gpointer data) {
    //matrixMultiplication()
    gchar* b = gtk_combo_box_text_get_active_text(GTK_COMBO_BOX_TEXT(data));
    int size = 0;
    bool isFirstMatrixDone, isSecondMatrixDone = false;

    fstream file ("/home/bmirisola/CLionProjects/cpe553/cpe553_final_project/matrices/matrices.csv", ios::in);

    string line, word;
    vector<string> matrix1;
    vector<string> matrix2;
    vector<string> ccc;

    if(file.is_open()){
        while(getline(file,line)){

            stringstream s(line);

            while(getline(s,word,',')) {
                if(word == "op"){
                    isFirstMatrixDone = true;
                }
                if(word != "=====" && word != "op" && !isFirstMatrixDone) {
                    matrix1.push_back(word);
                }
                else if(word != "=====" && word != "op" && isFirstMatrixDone){
                    matrix2.push_back(word);
                }
            }

            if(!isFirstMatrixDone){
                size++;
            }
        }
    }
    size = pow(size,2);
    for(int i = 0; i<size; i++){
        cout << matrix2[i] << " ";
    }

    dev_array<double> d_A(size*size);
    dev_array<double> d_B(size*size);
    dev_array<double> d_C(size*size);

    if(b == NULL) {
        g_print("Remember to pick an operation");
    }

    else if(g_content_type_equals(b,"*")) {

    }

    else if(g_content_type_equals(b,"+")) {
        g_print("Done +");
    }

    else if(g_content_type_equals(b,"-")) {
        g_print("Done -");
    }

}