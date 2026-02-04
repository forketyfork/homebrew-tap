class Clawtunes < Formula
  include Language::Python::Virtualenv

  desc "CLI app to control Apple Music"
  homepage "https://github.com/forketyfork/clawtunes"
  url "https://api.github.com/repos/forketyfork/clawtunes/tarball/713badcaf10ed33f7f4bcd4706055024daf64abf",
      using: :github_api
  sha256 "0c67235a9c18f09c98012b5839f5afc70844b39f4d255cdc969c0e23c909210f"
  version "0.1.0"
  license "MIT"

  livecheck do
    skip "Private repo; updates are managed manually."
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
