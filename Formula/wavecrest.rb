class Wavecrest < Formula
  desc "Wave Terminal companion for AI coding agents"
  homepage "https://github.com/doyled-it/wavecrest"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/doyled-it/wavecrest/releases/download/v#{version}/wavecrest-darwin-arm64.tar.gz"
      sha256 "afac3624050755e03dab499defdd6926b944266cb09e1e375ae7011e2c9d444b"
    end
    on_intel do
      url "https://github.com/doyled-it/wavecrest/releases/download/v#{version}/wavecrest-darwin-x64.tar.gz"
      sha256 "e23a90fedc9b42d43526aacc5e22c83d42fff3705603507873ae88691c26af0a"
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
