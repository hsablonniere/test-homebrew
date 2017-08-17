class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud"
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clementd-files.cellar.services.clever-cloud.com/clever-tools/macos.tar.gz"
  version "0.8.3"
  sha256 "95b8ff6fa0933765d1208f656bccd54cbc97c7cd65097099b42866f7eba14695"

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
