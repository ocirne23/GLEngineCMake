#include "Graphics.h"

#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_video.h>

owner<IGraphics*> IGraphics::create()
{
	return new Graphics();
}

Graphics::Graphics()
{
	printf("Graphics()\n");
}

void Graphics::foo()
{
	printf("Graphics::foo()\n");
}