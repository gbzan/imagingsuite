//<LICENCE>

#ifndef LINFIT_H
#define LINFIT_H

namespace kipl { namespace math {

template <typename T, typename S> void LinearLSFit(T *x, S *y, int N, double *q);
template <typename T, typename S> void LinearLSFit(T *x, S *y, int N, double *k, double *m, double *R2);
template <typename T, typename S> void LinearLSFit(T *x, S *y, int N, double *k, double *m, double *R2, double fraction);
}}

#include "core/linfit.hpp"
#endif // LINFIT_H