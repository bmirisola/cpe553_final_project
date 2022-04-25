#ifndef _DEV_ARRAY_H_
#define _DEV_ARRAY_H_

#include <stdexcept>
#include <algorithm>
#include "cuda_runtime.h"

template<class T>
class dev_array {
    T *start_;
    T *end_;

    // allocate memory on the device
    void allocate(size_t size) {
        cudaError_t result = cudaMalloc((void **) &start_, size * sizeof(T));
        end_ = start_ + size;
    }
// public functions
public:
    explicit dev_array()
            : start_(0),
              end_(0) {}

    // constructor
    dev_array(size_t size) {
        allocate(size);
    }

    // get the size of the array
    size_t getSize() const {
        return end_ - start_;
    }

    // set
    void set(const T *src, size_t size) {
        size_t min = std::min(size, getSize());
        cudaError_t result = cudaMemcpy(start_, src, min * sizeof(T), cudaMemcpyHostToDevice);
        if (result != cudaSuccess) {
            throw std::runtime_error("failed to copy to device memory");
        }
    }

    // get
    void get(T *dest, size_t size) {
        size_t min = std::min(size, getSize());
        cudaError_t result = cudaMemcpy(dest, start_, min * sizeof(T), cudaMemcpyDeviceToHost);
        if (result != cudaSuccess) {
            throw std::runtime_error("failed to copy to host memory");
        }
    }

    T* getData(){
        return start_;
    }
};

#endif