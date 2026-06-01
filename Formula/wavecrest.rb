class Wavecrest < Formula
  desc "Wave Terminal companion for AI coding agents"
  homepage "https://github.com/doyled-it/wavecrest"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/doyled-it/wavecrest/releases/download/v#{version}/wavecrest-darwin-arm64.tar.gz"
      sha256 "b43ba0608900d79cb708a6b42adf11e3af610a6869ae858dd4f0521b19454a56"
    end
    on_intel do
      url "https://github.com/doyled-it/wavecrest/releases/download/v#{version}/wavecrest-darwin-x64.tar.gz"
      sha256 "31293d24d82237d5547a7dff237c7e7dcb3d66f782def6dbf32f54e106a0047f"
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
