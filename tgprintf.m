function ret = tgprintf(str,chat_id,token)
% TGPRINTF send a message to a Telegram bot
%
% [token,chat_id] = tgprintf(str,token,chat_id) 
% where token and chat_id are the authorization token of the target 
% Telegram bot and the identifier or username of the target chat.
%
% Example: tgprintf('Hello, World!');
%
% Please refer the following post 
% "Creating a Telegram bot for personal notifications"
% https://www.forsomedefinition.com/automation/creating-telegram-bot-notifications/
% 
% Seongsik Park
% seongsikpark@postech.ac.kr

% default token and chat_id
if nargin < 2
    chat_id = '59233348';
    token = '430183280:AAEoNtMwQQFxMhE7VP9hwQnHWI-RAtyD9No'; % @tgprintfbot
elseif nargin < 3
    token = '430183280:AAEoNtMwQQFxMhE7VP9hwQnHWI-RAtyD9No'; % @tgprintfbot
end

% convert MATLAB string to url query string
sendstr = urlencode(str);
sendstr = ['https://api.telegram.org/bot',token,...
           '/sendMessage?chat_id=',chat_id,...
           '&disable_web_page_preview=1',...
           '&text=',sendstr];

% send a message   
% ret = web(sendstr); 

send a message and check the return status, but too slow
try
%     ret = webread(sendstr);
%     ret = ret.ok;
catch ret
    if (strcmp(ret.identifier,'MATLAB:webservices:HTTP400StatusCodeError'))
        error('failed to send a message: invalid token or chat_id');
    end
end

end
