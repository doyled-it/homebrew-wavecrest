class Wavecrest < Formula
  desc "Wave Terminal companion for AI coding agents"
  homepage "https://github.com/doyled-it/wavecrest"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/doyled-it/wavecrest/releases/download/v#{version}/wavecrest-darwin-arm64.tar.gz"
      sha256 "a9a9363de7f1d945da6f7c2cf016609cc6a3a5529e39d812fc5ccf6abb75c3a9"
    end
    on_intel do
      url "https://github.com/doyled-it/wavecrest/releases/download/v#{version}/wavecrest-darwin-x64.tar.gz"
      sha256 "8985a1efbfe351a2868a107c0fabe09f30dcfb2c84e1e80dcd457dc48b6130ba"
    end
  end

  on_linux do
    odie "wavecrest does not yet ship a Linux binary; Linux support is on the phase 2 roadmap."
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"wavecrest"
  end

  def caveats
    <<~EOS
      Wave Terminal companion installed.

      Next steps:
        wavecrest install
        # then in a fresh Wave terminal block (not inside tmux):
        wavecrest auth-set
        # restart Wave and drag the wavecrest widget into a block

      Run `wavecrest doctor` to verify your setup.
    EOS
  end

  test do
    assert_match "wavecrest:", shell_output("#{bin}/wavecrest doctor 2>&1", 1)
  end
end
