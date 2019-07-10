#pragma once

#if defined(OpenGL_EXPORTS)
#define GLAPI __declspec(dllexport)
#elif defined(OpenGL_IMPORTS)
#define GLAPI __declspec(dllimport)
#else
#define GLAPI
#endif