api.unmapAllExcept(
  ["E", "R"],
  /mail.google.com|calendar.google.com|photos.google.com|docs.google.com|monkeytype.com|discord.com|chat.zalo.me|messenger.com/
);

settings.modeAfterYank = "Normal";
settings.scrollStepSize = 200;

api.iunmap(":");

api.Hints.characters = "asdghklqwertyuiopzxcvbnmfj1234567890";

const hintsCss =
  "font-size: 12pt; font-family: JetBrains Mono NL, Cascadia Code, SauceCodePro Nerd Font, Consolas, Menlo, monospace; border: 0px; color: #000000; background: initial; background-color: #ffffff";

api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");

settings.theme = `
.sk_theme {
  font-family: JetBrains Mono NL, Cascadia Code, SauceCodePro Nerd Font, Consolas, Menlo, monospace;
  font-size: 10pt;
  background: #ffffff;
  color: #000000;
}
.sk_theme tbody {
  color: #ffffff;
}
.sk_theme input {
  color: #000000;
}
.sk_theme .url {
  color: #000000;
}
.sk_theme .annotation {
  color: #000000;
}
.sk_theme .omnibar_highlight {
  color: #000000;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: #fffff;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: #238636;
}
#sk_status,
#sk_find {
  font-size: 10pt;
}
`;
