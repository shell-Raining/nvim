# structure

This nvim configuration project is divided into four main parts

1. core
2. utils
3. log
4. plugins

core is the main configuration without plugins, when delete other parts except utils, this configuration can still run properly, or when open a big file (10M and so on), use only core configuration is better

utils can provide some useful helper functions, such as key mapping functions, and so on

log provide a module that can used to debug (though now is still no prefect yet)

plugins have many files that configure plugins, such as UI, LSP, editor and so on
