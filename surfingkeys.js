// https://github.com/brookhong/Surfingkeys/issues/63
settings.modeAfterYank = "Normal";
settings.scrollStepSize = 200;

api.removeSearchAlias("b");
api.removeSearchAlias("w");
api.removeSearchAlias("s");

api.addSearchAlias(
  "t",
  "translate",
  "https://translate.google.com/?sl=en&tl=vi&text=",
  "s",
  "https://translate.google.com/?sl=en&tl=vi&text=",
  function(response) {
    const res = JSON.parse(response.text);
    return res.map(function(r) {
      return r.phrase;
    });
  }
);

api.iunmap(":");

api.Hints.setCharacters("asdghklqwertyuiopzxcvbnmfj/.,;");

const hintsCss =
  "font-size: 13pt; font-family: 'JetBrains Mono NL', 'Cascadia Code', 'Helvetica Neue', Helvetica, Arial, sans-serif; border: 0px; color: #000000 !important; background: #ffffff; background-color: #ffffff";

api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");

settings.theme = `
* {
  font-size: 1rem;
  font-family: 'JetBrains Mono NL', 'Cascadia Code', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}
`
