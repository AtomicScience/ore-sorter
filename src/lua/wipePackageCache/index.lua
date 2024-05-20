local pkg = {}

pkg.wipeCache = function()
  for k in pairs(package.loaded) do
    if k:find('ts.', 1, true) or k:find('lua.', 1, true) or k === 'lualib_bundle' then
      package.loaded[k] = nil
    end
  end
end

return pkg
