api.unmapAllExcept(
  ["E", "R"],
  /mail.google.com|calendar.google.com|photos.google.com|docs.google.com|monkeytype.com|discord.com|chat.zalo.me|messenger.com/
);

settings.modeAfterYank = "Normal";
settings.scrollStepSize = 200;

api.iunmap(":");

api.Hints.characters = "asdghklqwertyuiopzxcvbnmfj1234567890";

const hintsCss =
  "font-size: 2vb; font-family: 'JetBrains Mono NL', 'Cascadia Code', 'Helvetica Neue', Helvetica, Arial, sans-serif; border: 0px; color: #000000; background: #ffffff; background-color: #ffffff";

api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");
