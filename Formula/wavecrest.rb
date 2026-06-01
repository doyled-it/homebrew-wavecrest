class Wavecrest < Formula
  desc "Wave Terminal companion for AI coding agents"
  homepage "https://github.com/doyled-it/wavecrest"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/doyled-it/wavecrest/releases/download/v#{version}/wavecrest-darwin-arm64.tar.gz"
      sha256 "4cdad6b23493237cc88ad182d1d64f2a3ad3445a3018d7523a27c4a44d492a32"
    end
    on_intel do
      url "https://github.com/doyled-it/wavecrest/releases/download/v#{version}/wavecrest-darwin-x64.tar.gz"
      sha256 "073c944e1a8bc2b87b5a17ba5fb35ff174edad276b7e0e98ad6b13e15b4c3ce1"
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
