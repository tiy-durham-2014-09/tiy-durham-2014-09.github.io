# Dev Laptop Setup

---

## Install [Atom](atom.html)

* Download Atom from [the Atom website](https://atom.io/).
* Install and run it.
* Run Atom > Install Shell Commands.

---

## Install Google Chrome

* Feel free to also install Firefox, but we need Chrome.

---

## Install [XCode Command Line Tools](xcode.html)
* Copy the XCode Command Line Tools file provided.
* Open the .dmg file you received and look for the .pkg file inside.
* Run it, and follow all the prompts.

---

## Install [Homebrew](homebrew.html)

* Open up Terminal
* Paste `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`
* Run `brew doctor`

---

## Install rbenv & ruby-build
* `brew install ruby-build rbenv`
* `echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.profile`
* Run "`ls -a ~`". If you see `.bash_profile` or `.bashrc`, get a TA or instructor to help you.

---

## Install ruby 2.1.2

* Close and reopen Terminal.
* `rbenv install 2.1.2`
* Stretch
* `rbenv global 2.1.2`

---

## Install nodejs

* `brew install nodejs`

---

## Install git

* `brew install git`

---

## Create an SSH key
* `ssh-keygen`
* __Do not__ give your key a password.

---

## Register for a [GitHub](https://github.com) account
