class Clawtunes < Formula
  include Language::Python::Virtualenv

  desc "CLI app to control Apple Music"
  homepage "https://github.com/forketyfork/clawtunes"
  url \"https://github.com/forketyfork/clawtunes/archive/refs/tags/v0.2.1.tar.gz\"
  sha256 \"992dc40e200fded441473cc4063577c38009c2a355a26e76a45d11c6b17a65ab\"
  license "MIT"

  livecheck do
    skip "Updates are managed manually."
  end

  depends_on "python@3.12"

  resource "click" do
    url \"https://github.com/forketyfork/clawtunes/archive/refs/tags/v0.2.1.tar.gz\"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Control Apple Music", shell_output("#{bin}/clawtunes --help")
  end
end
