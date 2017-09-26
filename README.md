# tgprintf
TGPRINTF send a message to a Telegram bot from MATLAB

Use tgprintf() in the same way as sprintf().

Example: 

```
tgprintf('Hello, World!');
tgprintf('%d + %d = %d',1,2,1+2);
 ```
 
This uses [Telegram Bot API](https://core.telegram.org/bots/api). You MUST define token and chat_id before use, which are the authorization token of the target Telegram bot, and the identifier or username of the target chat.

Please refer the following post:
[Creating a Telegram bot for personal notifications](https://www.forsomedefinition.com/automation/creating-telegram-bot-notifications/).
