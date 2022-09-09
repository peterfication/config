export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

alias rspec-quickfix="rm quickfix.out && rspec --format progress --require ~/config/vim/ruby/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out"
