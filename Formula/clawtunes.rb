class Clawtunes < Formula
  include Language::Python::Virtualenv

  desc "CLI app to control Apple Music"
  homepage "https://github.com/forketyfork/clawtunes"
  version "0.1.0"
  url "https://api.github.com/repos/forketyfork/clawtunes/tarball/v#{version}",
      using: :github_api
  sha256 "f47a4106ac80dbbe6eb07f81579f64f591d1ec2472d7f897448ff733b48f2eb4"
  license "MIT"

  livecheck do
    skip "Private repo; updates are managed manually."
  end

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "f47a4106ac80dbbe6eb07f81579f64f591d1ec2472d7f897448ff733b48f2eb4"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Control Apple Music", shell_output("#{bin}/clawtunes --help")
  end
end
