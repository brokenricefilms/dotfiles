Hints.characters = "asdghklqwertyuiopzxcvbnmfj1234567890;/.,][-=`";

const hintsCss =
  "font-size: 10pt; font-family: JetBrains Mono NL,SauceCodePro Nerd Font, Consolas, Menlo, monospace; border: 0px; color:#2c363c; background: initial; background-color: #f0edec;";

Hints.style(hintsCss);
Hints.style(hintsCss, "text");

settings.theme = `
.sk_theme {
  font-family: SauceCodePro Nerd Font, Consolas, Menlo, monospace;
  font-size: 10pt;
  background: #f0edec;
  color: #2c363c;
}
.sk_theme tbody {
  color: #f0edec;
}
.sk_theme input {
  color: #2c363c;
}
.sk_theme .url {
  color: #1d5573;
}
.sk_theme .annotation {
  color: #2c363c;
}
.sk_theme .omnibar_highlight {
  color: #88507d;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: #f0edec;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: #cbd9e3;
}
#sk_status,
#sk_find {
  font-size: 10pt;
}
`;
