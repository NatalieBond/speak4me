Speak For Me 🎙️
================

A Discord TTS bot that reads messages from a relay text channel into your voice channel.  
Designed for accessibility and teamwork while gaming (e.g., Albion Online).

---------------------------------------------------
1) What it does
---------------------------------------------------
- Creates/uses a text channel called #yapper_spam in each server.
- Whenever someone posts in #yapper_spam, the bot speaks that message in the voice channel of the author.
- Players can run a small AutoHotkey helper (relay_hotkey.ahk) on their own PC to copy what they typed in-game and instantly send it to #yapper_spam with Shift+Enter.
- The bot picks it up and speaks it in VC.

---------------------------------------------------
2) Requirements
---------------------------------------------------
On each player’s PC (for the hotkey):
- AutoHotkey v2 → https://www.autohotkey.com/
- relay_hotkey.ahk file running in the background while playing.

---------------------------------------------------
3) Setup
---------------------------------------------------
1. Download and install AutoHotkey v2 → https://www.autohotkey.com/
2. Invite the bot to your server. The bot will automatically create yapper_spam text channel on joining your discord server.
3. Turn on Discord Developer Mode (Setting -> App Setting -> Advanced -> Developer Mode).
4. Go back to yapper_spam text channel the bot just created, right click on the yapper_spam text channel name on the left, select 'Copy Channel ID'.
5. Right click on relay_hotkey.ahk, select 'Edit script', paste the Channel ID in RELAY_TARGET  := "PASTE YOUR YAPPER SPAM CHANNEL ID HERE". It should look something like this: RELAY_TARGET  := "1234567890123456789".
6. Save the edit.
7. Double click the relay_hotkey.ahk file to let it run in the background while playing.

---------------------------------------------------
4) How to use
---------------------------------------------------
1. Join a voice channel.
2. Type in-game.
3. Press Shift+Enter.
4. Your text appears in #yapper_spam.
5. The bot speaks it in your VC.

Slash commands:
- /leave → leaves your voice channel

---------------------------------------------------
5) Troubleshooting
---------------------------------------------------
Bot doesn’t speak:
- Check bot has Connect/Speak permissions.
- Check you are in a VC.

Hotkey doesn’t send:
- Adjust RELAY_TARGET for #yapper_spam.
- Ensure Discord window is open.
