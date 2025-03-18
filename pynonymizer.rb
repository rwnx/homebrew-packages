class Pynonymizer < Formula
  include Language::Python::Virtualenv

  desc "Tool for anonymizing data in databases"
  homepage "https://github.com/username/pynonymizer"
  url "https://files.pythonhosted.org/packages/source/p/pynonymizer/pynonymizer-1.0.0.tar.gz"
  sha256 "23664ec74f87edb59be51ecb6cb915ea889dcd214601d6fa53a8c27b94937513"
  license "MIT"

  livecheck do
    url "https://pypi.org/simple/pynonymizer/"
    regex(%r{href=.*?/pynonymizer-(\d+(?:\.\d+)*)\.tar\.gz}i)
  end

  depends_on "python3"
  depends_on "mysql-client" => :optional
  depends_on "postgresql" => :optional

  def install
    virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"pynonymizer", "--version"
  end
end