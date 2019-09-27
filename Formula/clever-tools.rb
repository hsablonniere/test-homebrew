class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud."
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clever-tools.clever-cloud.com/releases/1.6.0/clever-tools-1.6.0_macos.tar.gz"
  version "1.6.0"
  sha256 "dca7ea534bb01a39685efaa6e019c6143b0dda89c956253ed5dcc9431655e494"

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
