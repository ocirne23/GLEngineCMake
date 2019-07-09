#pragma once

#include <Core/Core.h>

class IGraphics
{
public:
	
	virtual ~IGraphics() {}
	virtual void foo() = 0;

	static owner<IGraphics*> create();
};