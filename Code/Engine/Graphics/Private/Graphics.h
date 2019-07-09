#pragma once

#include "Graphics/IGraphics.h"

class Graphics : public IGraphics
{
public:
	Graphics();

	virtual ~Graphics() override {}
	virtual void foo() override;
};