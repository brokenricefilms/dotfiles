function SERVER_IP () {
  hostname -I
}

function ser () {
  browser-sync start --server --files . --no-notify --host SERVER_IP --port 9000
}

function nvm() {
  echo "\n👉 NVM not loaded! Loading now..."
  unset -f nvm
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm "$@"
}

functions import_default_editor_config() {
  touch .editorconfig
  echo "root = true

  [*]
  indent_style = space
  indent_size = 2
  charset = utf-8
  trim_trailing_whitespace = true
  insert_final_newline = true
  end_of_line = lf
  # editorconfig-tools is unable to ignore longs strings or urls
  max_line_length = off" > .editorconfig
}

functions create_javascript_test_project() {
  cd /tmp
  mkdir js_test
  cd js_test
  yarn init --yes
  yarn add eslint-config-airbnb
  import_default_editor_config
  nvim js_test.js
}

functions create_typescript_test_project() {
  cd /tmp
  mkdir ts_test
  cd ts_test
  yarn init --yes
  yarn add eslint-config-airbnb
  import_default_editor_config
  nvim ts_test.ts
}

function cpp_project () {
  cp -r ~/.config/nvim/stuff/cpppro/* .
  nvim main.cpp source.cpp header.h input
}

format_cpp () { clang-format --style=Google -i $(find -name '*.h' && find -name '*.cpp') }

format_cs () { clang-format --style=Google -i $(find -name '*.cs') }
