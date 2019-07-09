#include <iostream>
#include <stdio.h>

#include <Core/Core.h>
#include <Graphics/IGraphics.h>

int main()
{
	printf("Ello\n");

	Core c;
	c.foo();
	owner<IGraphics*> g = IGraphics::create();
	g->foo();
	delete g;
	std::cin.get();
	return 0;
}