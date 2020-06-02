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

void tgprintf(string msg) {
	string chat_id = "DEFAULT_CHAT_ID_HERE";
	string token = "DEFAULT_TOKEN_HERE";
	string str = "https://api.telegram.org/bot" + token
		+ "/sendMessage?chat_id=" + chat_id + "&text=" + msg;
	
	wstring send = s2ws(str);
	printf("%s", str.c_str());
	ShellExecute(0, 0, send.c_str(), 0, SW_HIDE);
}
