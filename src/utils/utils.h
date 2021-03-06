#ifndef UTILS_H
#define UTILS_H

#define PI 3.14159265359

#include "../png_io/png_io.h"

//------------ METHODS FOR COLORSPACE CONVERSION ------------
extern void rgb2yuv (png_img* img);
extern void yuv2rgb (png_img* img);

//---------- CALCULATION OF SIGNAL-TO-NOISE RATIO -----------
extern double get_snr (png_img* img, png_img* ref);

//--------------------- DCT CALCULATIONS --------------------
extern void dct_1d (int const len, double arr[len]);
extern void dct_2d (int const len, double arr[len][len]);
extern void dct_3d (int const len, int const z, double arr[z][len][len]);
extern void idct_3d (int const len, int const z, double arr[z][len][len]);

extern int limit (int const x);
extern int exclude_extension (char* const str, char* name);
extern int get_output_filename (char* outfile, char* const path, char* const prefix, char* const ext, int const attr);

#endif // UTILS_H
