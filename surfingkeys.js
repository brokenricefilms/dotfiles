settings.modeAfterYank = "Normal";

// Disable emoji
api.iunmap(":");

api.Hints.characters = "asdghklqwertyuiopzxcvbnmfj1234567890;/.,][-=`";

const hintsCss =
  "font-size: 12pt; font-family: Cascadia Code, JetBrains Mono NL,SauceCodePro Nerd Font, Consolas, Menlo, monospace; border: 0px; color: #353535; background: initial; background-color: #eeeeee";

api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");

settings.theme = `
.sk_theme {
  font-family: Cascadia Code, SauceCodePro Nerd Font, Consolas, Menlo, monospace;
  font-size: 10pt;
  background: #f0edec;
  color: #353535;
}
.sk_theme tbody {
  color: #eeeeee;
}
.sk_theme input {
  color: #353535;
}
.sk_theme .url {
  color: #1d5573;
}
.sk_theme .annotation {
  color: #353535;
}
.sk_theme .omnibar_highlight {
  color: #88507d;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: #eeeeee;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: #3b8992;
}
#sk_status,
#sk_find {
  font-size: 10pt;
}
`;
