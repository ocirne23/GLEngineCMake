#include "Graphics.h"

#include <iostream>

std::unique_ptr<IGraphics> IGraphics::create()
{
	return std::make_unique<Graphics>();
}

Graphics::Graphics()
{
	printf("Graphics()\n");
}

void Graphics::foo()
{
	printf("Graphics::foo()\n");
}