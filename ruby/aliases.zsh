alias sc='script/console'
alias sg='script/generate'
alias sd='script/destroy'

# Be. Excited. Be! Be! Excited!
alias be="bundle exec"

# Grep rails routes
alias rgrep="bundle exec rake routes | grep"

# Run migrate, rollback, and migrate again. This is a good test
# to check if the migration works in both directions. Thanks Bikeshed.fm!
alias remigrate="bundle exec rake db:migrate && bundle exec rake db:rollback && bundle exec rake db:migrate"
alias migrate="bundle exec rails db:migrate"

# Open all generated files in Sublime
alias rg="$DOTFILES_ROOT/ruby/rails_g_and_open.rb"

# Start foreman using Procfile.personal
alias pfore="foreman start -f Procfile.personal"
