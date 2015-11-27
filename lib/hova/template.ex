defmodule Hova.Template do
  require EEx
  EEx.function_from_file :def, :index, "./lib/templates/index.html.eex", [:paragraph]
end
