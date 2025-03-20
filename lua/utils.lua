local fn = vim.fn
local version = vim.version

local M = {}

--- Create a command-line abbreviation with context awareness
--- This function creates an abbreviation that only triggers in command mode at the beginning of the line
--- @param from string The abbreviation to expand
--- @param to string What the abbreviation should expand to
function M.utils_cabbrev(from, to)
  local cmd = string.format(
    "cnoreabbrev <expr> %s (getcmdtype() == ':' && getcmdline() =~# '^%s\\>') ? '%s' : '%s'",
    from, from, to, from
  )
  vim.cmd(cmd)
end

--- Check if we are inside a git repo
--- @return boolean
function M.inside_git_repo()
  local result = vim.system({ "git", "rev-parse", "--is-inside-work-tree" }, { text = true }):wait()
  if result.code ~= 0 then
    return false
  end

  -- Manually trigger a special user autocmd InGitRepo (used lazyloading.
  vim.cmd([[doautocmd User InGitRepo]])

  return true
end

return M
