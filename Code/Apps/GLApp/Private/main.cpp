#include <iostream>
#include <stdio.h>
#include <string>
#include <vector>
#include <functional>
#include <memory>

#include <Core/Core.h>
#include <Graphics/IGraphics.h>

int main()
{
	printf("Ello\n");

	std::unique_ptr<IGraphics> graphics = IGraphics::create();
	graphics->foo();

	Core c;
	c.foo();

	void* p = malloc(1);
	free(p);
	std::string str("wasd");
	std::function<void()> f;
	std::vector<int> v;
	return 0;
}