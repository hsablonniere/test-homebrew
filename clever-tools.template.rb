class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud"
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clever-tools.cellar.services.clever-cloud.com/releases/@VERSION@/clever-tools-@VERSION@_macos.tar.gz"
  version "@VERSION@"
  sha256 "@SHA256@"

  depends_on "bash-completion" => :recommended
  depends_on "zsh-completions" => :recommended

  def install
    bin.install "clever", "nodegit.node"
    system "mkdir -p #{prefix}/completions/bash"
    system "mkdir -p #{prefix}/completions/zsh"
    system "#{prefix}/bin/clever --bash-autocomplete-script clever > #{prefix}/completions/bash/clever"
    system "#{prefix}/bin/clever --zsh-autocomplete-script clever >  #{prefix}/completions/zsh/_clever"

    bash_completion.install "#{prefix}/completions/bash/clever"
    zsh_completion.install "#{prefix}/completions/zsh/_clever"
  end

  test do
    system "clever --version"
  end
end
