function ret = tgprintf(varargin)
% TGPRINTF send a message to a Telegram bot
%
% Use tgprintf() in the same way as sprintf()
% Example: tgprintf('Hello, World!');
%          tgprintf('%d + %d = %d',1,2,1+2);
% 
% Define token and chat_id before use, 
% which are the authorization token of the target Telegram bot 
% and the identifier or username of the target chat
%
% Please refer the following post 
% "Creating a Telegram bot for personal notifications"
% https://www.forsomedefinition.com/automation/creating-telegram-bot-notifications/
% 
% Seongsik Park
% seongsikpark@postech.ac.kr

% default token and chat_id
token = DEFAULT_TOKEN_HERE;
chat_id = DEFAULT_CHAT_ID_HERE;

str = sprintf(varargin{:});

% print to MATLAB command window
fprintf(str);

% convert MATLAB string to url query string
sendstr = urlencode(str);
sendstr = ['https://api.telegram.org/bot',token,...
           '/sendMessage?chat_id=',chat_id,...
           '&text=',sendstr];

% send a message   
ret = webread(sendstr); 
assert(ret.ok);

% append human readable datetime to results [Set TimeZone value to desired time zone]
ret.result.datetime=datetime(ret.result.date,'ConvertFrom','posixtime','TimeZone','Asia/Seoul');
end
