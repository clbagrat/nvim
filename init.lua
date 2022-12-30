local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('bgi/plugins')
load('bgi/settings')
load('bgi/lsp')
load('bgi/keybinds')
