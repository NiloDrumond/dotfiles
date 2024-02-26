# Which-key

Utils = {}

local function make_opts(mode, prefix, buf)
  return {
    mode = mode,
    prefix = prefix,
    buffer = buf,
    silent = true,
    noremap = true,
    nowait = false,
  }
end

Utils.WK = {
  make_opts = make_opts,
  Normal = "n",
  Visual = "v",
  Operator = "o",
  Insert = "i",
  leader = "<leader>"
}

return Utils
