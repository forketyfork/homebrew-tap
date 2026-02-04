class Clawtunes < Formula
  include Language::Python::Virtualenv

  desc "CLI app to control Apple Music"
  homepage "https://github.com/forketyfork/clawtunes"
  url "https://github.com/forketyfork/clawtunes/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "3bcfbce63495da1cd8475554b22a7d3fc6ad802febe22dc4f7cfb103265f267c"
  license "MIT"

  livecheck do
    skip "Updates are managed manually."
  end

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Control Apple Music", shell_output("#{bin}/clawtunes --help")
  end
end
