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
        cudaMalloc((void **) &start_, size * sizeof(T));
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

    ~dev_array() {
        if (start_ != 0) {
            cudaFree(start_);
            start_ = end_ = 0;
        }
    }

    // copyToHost the size of the array
    size_t getSize() const {
        return end_ - start_;
    }

    // set
    void set(const T *src, size_t size) {
        size_t min = std::min(size, getSize());
        cudaMemcpy(start_, src, min * sizeof(T), cudaMemcpyHostToDevice);

    }

    // copyToHost
    void copyToHost(T *dest, size_t size) {
        size_t min = std::min(size, getSize());
        cudaMemcpy(dest, start_, min * sizeof(T), cudaMemcpyDeviceToHost);
    }

    T *getData() {
        return start_;
    }
};

#endif