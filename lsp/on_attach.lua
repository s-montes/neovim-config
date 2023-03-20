return function(client, _)
  -- Disable hover for ruff-lsp
  if client.name == "ruff_lsp" then client.server_capabilities.hoverProvider = false end
end
