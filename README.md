# Free TON Homebrew tap

It is Homebrew tap for simple and convenient distribution of software for work and development on the Free TON network.

Homebrew — The Missing Package Manager for macOS or Linux or Windows 10 Subsystem for Linux, see more on the project website [brew.sh](https://docs.brew.sh/Installation).

## FAQ

1. [What does brew tap mean?](https://docs.brew.sh/Taps)

[You can ask a question](https://github.com/tonsoft/homebrew-stable/issues/new?labels=question&template=question.md) in any language (do not limit yourself, for example use Esperanto).

## Use

Tap a formula repository:

    brew tap tonsoft/stable

Install software:

    brew install tonos-cli
    brew install ton-sdk
    brew install tvm-solc

> Due to the lack of a stable tag for `tvm-linker`, you must install from the master, see [ISSUE#2](https://github.com/tonsoft/homebrew-stable/issues/2).

    brew install --head tvm-linker

## Develop

### New Formula

Create new a formula:

    nameFormula=new-tool

See `brew create --help`

    brew create --autotools --set-name $nameFormula https://github.com/users/repo/archive/version.tar.gz
    mv $(brew --repository)/Library/Taps/homebrew/homebrew-core/Formula/$nameFormula.rb ./Formula/$nameFormula.rb

Edit if need and test installation:

    brew install --verbose $(pwd)/Formula/$nameFormula.rb
