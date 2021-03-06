#include "Common.h"

bool Extension::OnAnyConsoleInput()
{
	return true;
}

bool Extension::OnSpecificConsoleInput(char * Command)
{
	if (!Command || Command[0] == '\0')
		GlobalExt->OutputNow(5, -1, "Blank command given as parameter to \"On specific console input\".");
	return _strnicmp(Command, Data->ConsoleReceived.c_str(), strnlen(Command, 255)) == 0;
}

bool Extension::OnUnhandledException()
{
	return true;
}

bool Extension::OnCtrlCEvent()
{
	return true;
}

bool Extension::OnCtrlBreakEvent()
{
	return true;
}

bool Extension::OnConsoleCloseEvent()
{
	return true;
}
