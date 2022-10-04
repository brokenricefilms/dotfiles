settings.modeAfterYank = "Normal";

// Disable emoji
api.iunmap(":");

api.Hints.characters = "asdghklqwertyuiopzxcvbnmfj1234567890;/.,][-=`";

const hintsCss =
  "font-size: 12pt; font-family: JetBrains Mono NL, Cascadia Code, SauceCodePro Nerd Font, Consolas, Menlo, monospace; border: 0px; color: #0366d6; background: initial; background-color: #ffffff";

api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");

settings.theme = `
.sk_theme {
  font-family: JetBrains Mono NL, Cascadia Code, SauceCodePro Nerd Font, Consolas, Menlo, monospace;
  font-size: 10pt;
  background: #ffffff;
  color: #24292f;
}
.sk_theme tbody {
  color: #ffffff;
}
.sk_theme input {
  color: #24292f;
}
.sk_theme .url {
  color: #24292f;
}
.sk_theme .annotation {
  color: #24292f;
}
.sk_theme .omnibar_highlight {
  color: #24292f;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: #ffffff;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: #0598bc;
}
#sk_status,
#sk_find {
  font-size: 10pt;
}
`;

// #ffffff
// #24292f
// #24292e
// #d73a49
// #28a745
// #dbab09
// #0366d6
// #5a32a3
// #0598bc
// #6a737d
// #959da5
// #cb2431
// #22863a
// #b08800
// #005cc5
// #5a32a3
// #3192aa
// #d1d5da
