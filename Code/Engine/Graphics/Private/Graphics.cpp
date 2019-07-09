#include "Graphics.h"

#include <iostream>

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