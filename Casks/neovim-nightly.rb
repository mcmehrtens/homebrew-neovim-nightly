cask "neovim-nightly" do
  v = system_command "git", args: ["git@github.com:neovim/neovim.git", "--tags", "nightly"]
  version v

  arch arm: "arm64", intel: "x86_64"
  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz",
      verified: "github.com/neovim"
  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  conflicts_with formula: "neovim"

  binary "nvim-macos-#{arch}/bin/nvim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end
