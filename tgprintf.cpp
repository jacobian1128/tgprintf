#include <string>
#include <iostream>

using namespace std;

wstring s2ws(const string& s)
{
	int len;
	int slength = (int)s.length() + 1;
	len = MultiByteToWideChar(CP_ACP, 0, s.c_str(), slength, 0, 0);
	wchar_t* buf = new wchar_t[len];
	MultiByteToWideChar(CP_ACP, 0, s.c_str(), slength, buf, len);
	std::wstring r(buf);
	delete[] buf;
	return r;
}

void tgprintf(string hello) {
	string chat_id = "59233348";
	string token = "430183280:AAEoNtMwQQFxMhE7VP9hwQnHWI-RAtyD9No";
	string str = "https://api.telegram.org/bot" + token
		+ "/sendMessage?chat_id=" + chat_id + "&text=" + hello;
	
	wstring send = s2ws(str);
	printf("%s", str.c_str());
	ShellExecute(0, 0, send.c_str(), 0, SW_HIDE);
}
