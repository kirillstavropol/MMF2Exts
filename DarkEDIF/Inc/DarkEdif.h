#pragma once

// Stops Visual Studio complaining it cannot generate copy functions because of the 0-sized array
#pragma warning (disable:4200)

// Struct contains information about a/c/e
struct ACEInfo {
	union BothParams {
		// Actions, conditions
		Params p;
		// Expressions
		ExpParams ep;
	};
	// Original type of BothParams is short, so this must be too.
	static_assert(sizeof(BothParams) == 2U, "Union failed to be a good size.");

	union BothFlags {
		// Conditions: indicates whether condition is negatable
		EVFLAGS ev;
		// Expressions: indicates return type
		ExpReturnType ef;
	};
	// Original type of BothFlags is short.
	static_assert(sizeof(BothFlags) == 2U, "Union failed to be a good size.");


	short	   FloatFlags,	 // Float flags (if bit n is true, parameter n returns a float)
			   ID;			 // ID, non-EDIFified; used to be called 'code'
	BothFlags  Flags;		 // For conds: EVFLAGS_ALWAYS, etc; whether condition is negatable
							 // For exps: EXPFLAG_DOUBLE, etc; return type
							 // For acts: unused, always 0
	short	   NumOfParams;	 // Number of parameters this A/C/E is called with (Parameters[n])
	BothParams Parameter[0]; // Parameter information (max sizeof(FloatFlags)*8 params)
	
	ACEInfo(short _ID, BothFlags _Flags, short _NumOfParams) :
			FloatFlags(0), ID(_ID),
			Flags(_Flags), NumOfParams(_NumOfParams)
	{
		// No code needed. Leave Parameters[n] construction to parent struct.
	}

	// Simple function to return the part of the struct that is expected by MMF2
	inline void * MMFPtr (void) { return &ID; }
};

bool CreateNewActionInfo();
bool CreateNewConditionInfo();
bool CreateNewExpressionInfo();

#ifndef NOPROPS
void InitialisePropertiesFromJSON(mv *, EDITDATA *);

Prop * GetProperty(EDITDATA *, size_t);

void PropChangeChkbox(EDITDATA * edPtr, unsigned int PropID, bool newValue);
void PropChange(mv * mV, EDITDATA * &edPtr, unsigned int PropID, void * newData, size_t newSize);
char * PropIndex(EDITDATA * edPtr, unsigned int ID, unsigned int * size);

#endif // NOPROPS


// This region does type checking on LinkXXX functions.
// Since the JSON should never change between Debug and Edittime/Runtime versions,
// we'll only do the slow check in Debug Mode.

#include <algorithm>
#include <sstream>

#ifdef _DEBUG

// Uses code from https://stackoverflow.com/a/21272048 (bottom-most section)
// and from https://stackoverflow.com/a/20170989 (pre the C++17 update section)

#include <tuple>
#include <utility>
#include <type_traits>
#include <stdexcept>
#include <cstdio>

// Check VS version compatibility
// DarkEDIF SDK requires Visual Studio; version 2015 or greater.
#if _MSC_VER < 1900
#define CONSTEXPR11_TN
#define CONSTEXPR14_TN
#define NOEXCEPT_TN
#elif _MSC_VER < 2000
#define CONSTEXPR11_TN constexpr
#define CONSTEXPR14_TN
#define NOEXCEPT_TN noexcept
#else
#define CONSTEXPR11_TN constexpr
#define CONSTEXPR14_TN constexpr
#define NOEXCEPT_TN noexcept
#endif

class static_string
{
	const char* const p_;
	const std::size_t sz_;

public:
	typedef const char* const_iterator;

	template <std::size_t N>
	CONSTEXPR11_TN static_string(const char(&a)[N]) NOEXCEPT_TN
		: p_(a)
		, sz_(N - 1)
	{}

	CONSTEXPR11_TN static_string(const char* p, std::size_t N) NOEXCEPT_TN
		: p_(p)
		, sz_(N)
	{}

	CONSTEXPR11_TN const char* data() const NOEXCEPT_TN { return p_; }
	CONSTEXPR11_TN std::size_t size() const NOEXCEPT_TN { return sz_; }

	CONSTEXPR11_TN const_iterator begin() const NOEXCEPT_TN { return p_; }
	CONSTEXPR11_TN const_iterator end()   const NOEXCEPT_TN { return p_ + sz_; }

	CONSTEXPR11_TN char operator[](std::size_t n) const
	{
		return n < sz_ ? p_[n] : throw std::out_of_range("static_string");
	}
};

inline std::ostream& operator<<(std::ostream& os, static_string const& s)
{
	return os.write(s.data(), s.size());
}

template <class T>
CONSTEXPR14_TN static_string type_name()
{
	static_string p = __FUNCSIG__;
	return static_string(p.data() + 38, p.size() - 38 - 7);
}

// static_string to std::string
#define typestr(type) std::string(type_name<type>().begin(), type_name<type>().end())

template<int j, class Ret, class Struct, class... Args>
typename std::enable_if<(j > 0), void>::type
forLoopAC(unsigned int ID, const _json_value &json, std::stringstream &str, Ret(Struct::*Function)(Args...) const) {
	constexpr int i = j - 1U;
	do
	{
		bool isFloat = false;
		Params p = ReadParameterType(json["Parameters"][i][0], isFloat);
		using type2 = typename std::tuple_element<i, std::tuple<Args...>>::type;
		std::string cppType(typestr(type2));
		std::string expCppType = "?";
		if (isFloat)
		{
			if (cppType == typestr(float) || cppType == typestr(const float))
				continue;
			expCppType = "float";
		}
		else if (p == Params::String || p == Params::String_Comparison || p == Params::String_Expression ||
			p == Params::Filename || p == Params::Filename_2)
		{
			if (cppType == typestr(const TCHAR *) || cppType == typestr(TCHAR *) || cppType == typestr(const TCHAR * const))
				continue;
			expCppType = "const TCHAR *";
		}
		else if (p == Params::Integer || p == Params::Expression)
		{
			if (!_stricmp(json["Parameters"][i][0], "Unsigned Integer"))
			{
				if (cppType == typestr(unsigned int) || cppType == typestr(const unsigned int))
					break;

				expCppType = "unsigned int";
			}
			else
			{
				if (cppType == typestr(int) || cppType == typestr(const int))
					break;
				expCppType = "int";
			}
		}
		else
			continue;


		str << "Has JSON parameter " << (const char *)json["Parameters"][i][1] << ", JSON type " << (const char *)json["Parameters"][i][0]
			<< "; expected C++ type " << expCppType << ", but actual C++ type is " << cppType << ".\r\n";
	} while (false);

	// Recurse into next iteration
	forLoopAC<i>(ID, json, str, Function);
}

template<int j, class Ret, class Struct, class... Args>
typename std::enable_if<(j == 0), void>::type
forLoopAC(unsigned int ID, const _json_value &json, std::stringstream &str, Ret(Struct::*Function)(Args...) const) {
	// end of loop; do nothing
}

template<int j, class Ret, class Struct, class... Args>
typename std::enable_if<(j > 0), void>::type
forLoopE(unsigned int ID, const _json_value &json, std::stringstream &str, Ret(Struct::*Function)(Args...) const) {
	constexpr int i = j - 1U;
	do
	{
		bool isFloat = false;
		ExpParams p = ReadExpressionParameterType(json["Parameters"][i][0], isFloat);
		using type2 = typename std::tuple_element<i, std::tuple<Args...>>::type;
		std::string cppType(typestr(type2));
		std::string expCppType = "?";
		if (isFloat)
		{
			if (cppType == typestr(float) || cppType == typestr(const float))
				break;
			expCppType = "float";
		}
		else if (p == ExpParams::String)
		{
			if (cppType == typestr(const TCHAR *) || cppType == typestr(TCHAR *) || cppType == typestr(const TCHAR * const))
				break;
			expCppType = "const TCHAR *";
		}
		else if (p == ExpParams::Integer)
		{
			if (!_stricmp(json["Parameters"][i][0], "Unsigned Integer"))
			{
				if (cppType == typestr(unsigned int) || cppType == typestr(const unsigned int))
					break;

				expCppType = "unsigned int";
			}
			else
			{
				if (cppType == typestr(int) || cppType == typestr(const int))
					break;
				expCppType = "int";
			}
		}
		else // ?
			break;

		str << "Has JSON parameter " << (const char *)json["Parameters"][i][1] << ", JSON type " << (const char *)json["Parameters"][i][0]
			<< "; expected C++ type " << expCppType << ", but actual C++ type is " << cppType << ".\r\n";
	} while (false);

	// Recurse into next iteration
	forLoopE<i>(ID, json, str, Function);
}

template<int j, class Ret, class Struct, class... Args>
typename std::enable_if<(j == 0), void>::type
forLoopE(unsigned int ID, const _json_value &json, std::stringstream &str, Ret(Struct::*Function)(Args...) const) {
	// end of loop; do nothing
}

template<class Ret, class Struct, class... Args>
void LinkActionDebug(unsigned int ID, Ret(Struct::*Function)(Args...) const)
{
	std::stringstream str;
	for (size_t k = 0; k < SDK->json.u.object.length; k++)
	{
		json_value &curLang = *SDK->json.u.object.values[k].value;
		char * curLangName = SDK->json.u.object.values[k].name;

		if (curLang.type != json_object || curLang["About"]["Name"].type != json_string)
			continue;

		if (curLang["Actions"].u.array.length < ID)
		{
			str << "Error in linking action ID " << ID << "; it has no Actions JSON item.";
			break;
		}
		const json_value &json = curLang["Actions"][ID];

		if (!std::is_same<Ret, void>())
		{
			str << curLangName << ": error in linking action ID " << ID << ", " << (const char *)json["Title"] << "; it has return type "
				<< typestr(Ret) << " instead of void in the C++ function definition.";
			break;
		}

		const int cppParamCount = sizeof...(Args);
		const int jsonParamCount = json["Parameters"].type == json_none ? 0 : json["Parameters"].u.array.length;
		if (cppParamCount != jsonParamCount)
		{
			str << curLangName << ": error in linking action ID " << ID << ", " << (const char *)json["Title"] << "; it has "
				<< jsonParamCount << " parameters in the Actions JSON item, but " << cppParamCount << " parameters in the C++ function definition.";
		}
		else if (jsonParamCount > 0)
		{
			forLoopAC<sizeof...(Args), Ret, Struct, Args...>(ID, json, str, Function);

			// remove final \r\n
			if (str.str().size() > 0)
			{
				std::stringstream str2;
				str2 << curLangName << ": error in linking action ID " << ID << ", " << (const char *)json["Title"] << ":\r\n" << str.str();
				std::string realError = str2.str();
				str.str(realError.substr(0U, realError.size() - 2U));
			}
		}
	}

	// Exit with error
	if (str.str().size() > 0)
	{
		char extName[128];
		Edif::GetExtensionName(extName);
		strcat_s(extName, " - Linking Error");
		MessageBoxA(NULL, str.str().c_str(), extName, MB_OK);
	}

	SDK->ActionFunctions[ID] = Edif::MemberFunctionPointer(Function);
}

template<class Ret, class Struct, class... Args>
void LinkConditionDebug(unsigned int ID, Ret(Struct::*Function)(Args...) const)
{
	std::stringstream str;
	for (size_t k = 0; k < SDK->json.u.object.length; k++)
	{
		json_value &curLang = *SDK->json.u.object.values[k].value;
		char * curLangName = SDK->json.u.object.values[k].name;

		if (curLang.type != json_object || curLang["About"]["Name"].type != json_string)
			continue;

		if (curLang["Conditions"].u.array.length < ID)
		{
			str << curLangName << ": error in linking condition ID " << ID << "; it has no Conditions JSON item.";
			break;
		}
		const json_value &json = curLang["Conditions"][ID];

		if (!std::is_same<Ret, bool>() && !std::is_same<Ret, const bool>())
		{
			str << curLangName << ": error in linking condition ID " << ID << ", " << (const char *)json["Title"] << "; it has return type "
				<< typestr(Ret) << " instead of bool in the C++ function definition.";
			break;
		}

		const int cppParamCount = sizeof...(Args);
		const int jsonParamCount = json["Parameters"].type == json_none ? 0 : json["Parameters"].u.array.length;
		if (cppParamCount != jsonParamCount)
		{
			str << curLangName << ": error in linking condition ID " << ID << ", " << (const char *)json["Title"] << "; it has "
				<< jsonParamCount << " parameters in the Conditions JSON item, but " << cppParamCount << " parameters in the C++ function definition.";
		}
		else if (jsonParamCount > 0)
		{
			forLoopAC<sizeof...(Args), Ret, Struct, Args...>(ID, json, str, Function);

			// remove final \r\n
			if (str.str().size() > 0)
			{
				std::stringstream str2;
				str2 << curLangName << ": error in linking condition ID " << ID << ", " << (const char *)json["Title"] << "\r\n" << str.str();
				std::string realError = str2.str();
				str.str(realError.substr(0U, realError.size() - 2U));
			}
		}
	}

	// Exit with error
	if (str.str().size() > 0)
	{
		char extName[128];
		Edif::GetExtensionName(extName);
		strcat_s(extName, " - Linking Error");
		MessageBoxA(NULL, str.str().c_str(), extName, MB_OK);
	}

	SDK->ConditionFunctions[ID] = Edif::MemberFunctionPointer(Function);
}

template<class Ret, class Struct, class... Args>
void LinkExpressionDebug(unsigned int ID, Ret(Struct::*Function)(Args...) const)
{
	std::stringstream str;
	for (size_t k = 0; k < SDK->json.u.object.length; k++)
	{
		json_value &curLang = *SDK->json.u.object.values[k].value;
		char * curLangName = SDK->json.u.object.values[k].name;

		if (curLang.type != json_object || curLang["About"]["Name"].type != json_string)
			continue;

		if (curLang["Expressions"].u.array.length < ID)
		{
			str << curLangName << ": error in linking expression ID " << ID << "; it has no Expressions JSON item.";
			break;
		}

		std::string expCppRetType = "<unknown>";
		std::string cppRetType = typestr(Ret);
		bool retTypeOK = false;
		const json_value &json = curLang["Expressions"][ID];
		ExpReturnType jsonRetType = ReadExpressionReturnType(json["Returns"]);

		if (jsonRetType == ExpReturnType::Integer)
		{
			if (!_stricmp(json["Returns"], "Unsigned Integer"))
			{
				retTypeOK = cppRetType == typestr(unsigned int) || cppRetType == typestr(const unsigned int);
				expCppRetType = "unsigned int";
			}
			else
			{
				retTypeOK = cppRetType == typestr(int) || cppRetType == typestr(const int);
				expCppRetType = "int";
			}
		}
		else if (jsonRetType == ExpReturnType::Float)
		{
			retTypeOK = cppRetType == typestr(float) || cppRetType == typestr(const float);
			expCppRetType = "float";
		}
		else if (jsonRetType == ExpReturnType::String)
		{
			retTypeOK = cppRetType == typestr(TCHAR *) || cppRetType == typestr(const TCHAR *) || cppRetType == typestr(const TCHAR * const);
			expCppRetType = "const TCHAR *";
		}
		// else failure by default

		std::string exprName = (const char *)json["Title"];
		if (exprName[exprName.size() - 1U] == '(')
			exprName = exprName.substr(0U, exprName.size() - 1U);

		if (!retTypeOK)
		{
			str << curLangName << ": error in linking expression ID " << ID << ", " << exprName << "; it has return type "
				<< (const char *)json["Returns"] << " in the JSON (C++ type " << expCppRetType << "), but " << typestr(Ret) << " in the C++ function definition.";
			break;
		}

		const int cppParamCount = sizeof...(Args);
		const int jsonParamCount = json["Parameters"].type == json_none ? 0 : json["Parameters"].u.array.length;
		if (cppParamCount != jsonParamCount)
		{
			str << curLangName << ": error in linking expression ID " << ID << ", " << exprName << "; it has "
				<< jsonParamCount << " parameters in the Expressions JSON item, but " << cppParamCount << " parameters in the C++ function definition.";
		}
		else if (jsonParamCount > 0)
		{
			forLoopE<sizeof...(Args), Ret, Struct, Args...>(ID, json, str, Function);
			
			// remove final \r\n
			if (str.str().size() > 0)
			{
				std::stringstream str2;
				str2 << curLangName << ": error in linking expression ID " << ID << ", " << exprName << ":\r\n" << str.str();
				std::string realError = str2.str();
				str.str(realError.substr(0U, realError.size() - 2U));
			}
		}
	}

	// Exit with error
	if (str.str().size() > 0)
	{
		char extName[128];
		Edif::GetExtensionName(extName);
		strcat_s(extName, " - Linking Error");
		MessageBoxA(NULL, str.str().c_str(), extName, MB_OK);
	}

	SDK->ExpressionFunctions[ID] = Edif::MemberFunctionPointer(Function);
}

// Combine the two:
// returnType X() const;
// returnType X();
// to resolve ambiguity complaints between Extension::* and const Extension::*

template<class Ret, class Struct, class... Args>
void LinkActionDebug(unsigned int ID, Ret(Struct::*Function)(Args...))
{
	LinkActionDebug(ID, (Ret(Struct::*)(Args...) const)Function);
}
template<class Ret, class Struct, class... Args>
void LinkConditionDebug(unsigned int ID, Ret(Struct::*Function)(Args...))
{
	LinkConditionDebug(ID, (Ret(Struct::*)(Args...) const)Function);
}
template<class Ret, class Struct, class... Args>
void LinkExpressionDebug(unsigned int ID, Ret(Struct::*Function)(Args...))
{
	LinkExpressionDebug(ID, (Ret(Struct::*)(Args...) const)Function);
}

#endif