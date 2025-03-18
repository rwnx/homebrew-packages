class Pynonymizer < Formula
  include Language::Python::Virtualenv

  desc "Tool for anonymizing data in databases"
  homepage "https://pypi.org/project/pynonymizer"
  url "https://files.pythonhosted.org/packages/09/e8/9d1ed8e2a3ea849bddb96daff0b6108010d8a9cb9b2ff212f231d7258e24/pynonymizer-2.5.0.tar.gz"
  sha256 "fa6a68a4c3f898ee15446aeb86948bf7bbe27f5987b314e9b41de37cd5bbd519"
  license "MIT"

  livecheck do
    url "https://pypi.org/simple/pynonymizer/"
    regex(%r{href=.*?/pynonymizer-(\d+(?:\.\d+)*)\.t}i)
  end

  depends_on "libyaml"
  depends_on "python3"
  depends_on "mysql-client" => :optional
  depends_on "postgresql@14" => :optional

  def install
    # Use the recommended virtualenv_install_with_resources instead
    # This handles creating a virtualenv with pip properly
    virtualenv_install_with_resources
  end

  test do
    system bin/"pynonymizer", "--version"
  end
end
