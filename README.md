# Everscale Guild Homebrew tap

It is Homebrew tap for simple and convenient distribution of software for work and development on the Free TON network.

Homebrew — The Missing Package Manager for macOS or Linux or Windows 10 Subsystem for Linux, see more on the project website [brew.sh](https://docs.brew.sh/Installation).

Binary bottles are currently available only for:

- `x86_64_linux`
- `catalina`

## FAQ

1. [What does brew tap mean?](https://docs.brew.sh/Taps)

[You can ask a question](https://github.com/tonsoft/homebrew-stable/issues/new?labels=question&template=question.md) in any language (do not limit yourself, for example use Esperanto).

## Use

### Install

Tap a formula repository:

    brew tap EverscaleGuild/stable

Install software:

    brew install everos-cli
    brew install tvm-solc
    brew install tvm-linker

### Upgrade

    brew upgrade

## Develop

### New Formula


### Create new a formula

For help see `brew create --help` and [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook).

    brew create --tap EverscaleGuild/stable --set-name new-formula-name URL

### Edit if need and testing

    code $(brew --repository EverscaleGuild/stable)/Formula/new-formula-name.rb
    brew test-bot --tap=EverscaleGuild/stable --only-tap-syntax
    brew install --verbose ton-compiler

### Create PR

    cd $(brew --repository EverscaleGuild/stable)
    git remote add self fork
    git checkout -b add-new-formula-name
    git add Formula/new-formula-name.rb
    git commit -m "feat: add new-formula-name"
    git push self add-new-formula-name
