class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud."
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clever-tools.cellar.services.clever-cloud.com/releases/1.4.2/clever-tools-1.4.2_macos.tar.gz"
  version "1.4.2"
  sha256 "d9d7d1029229b9bf239e5cf0a40e8c8f89a2ae1d4711b8009f55eac05631e6b2"

  depends_on "bash-completion" => :recommended
  depends_on "zsh-completions" => :recommended

  def install
    bin.install "clever"
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
