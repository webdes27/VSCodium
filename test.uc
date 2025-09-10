// Copyright (c) VSCodium. All rights reserved.
class TestClass extends Object;

// This is a test UnrealScript file
var int TestVariable;
var string TestString;

function TestFunction()
{
	local int LocalVar;

	if (TestVariable > 0)
	{
		TestString = "Hello World";
	}

	for (LocalVar = 0; LocalVar < 10; LocalVar++)
	{
		// Do something
	}
}

defaultproperties
{
	TestVariable=100
	TestString="Default"
}
