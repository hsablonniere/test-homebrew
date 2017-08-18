class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud"
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clever-tools.cellar.services.clever-cloud.com/releases/0.9.0/clever-tools-0.9.0_macos.tar.gz"
  version "0.9.0"
  sha256 "5c4f995bff01fcdaae599e9ad86b0ab4e96f73ff4975be20bd0896b4c32b2224"

  depends_on "bash-completion"
  depends_on "zsh-completion"

  def install
    bin.install "clever", "nodegit.node"
    system "mkdir -p #{prefix}/etc/bash_completion.d"
    system "mkdir -p #{prefix}/usr/share/zsh-completions"
    system "#{prefix}/bin/clever --bash-autocomplete-script clever > #{prefix}/etc/bash_completion.d/clever"
    system "#{prefix}/bin/clever --zsh-autocomplete-script clever > #{prefix}/usr/share/zsh-completions/_clever"
  end

  test do
    system "clever --version"
  end
end
