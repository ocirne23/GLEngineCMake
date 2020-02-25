#pragma once

#include <memory>

class IGraphics
{
public:
	
	virtual ~IGraphics() {}
	virtual void foo() = 0;

	static std::unique_ptr<IGraphics> create();
};