# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export STAGING_USERNAME="ekingan@newrelic.com"
export STAGING_PASSWORD="circuit15AMPS"
export ZSH="/Users/ekingan/.oh-my-zsh"
export TERM="xterm-256color"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias be="bundle exec"
alias acs="cd ~/newrelic/account-change-service"
alias notes="code ~/newrelic/notes"
alias prov="cd ~/newrelic/provisioning_service"
alias rpm="cd ~/newrelic/rpm_site"
alias scs="cd ~/newrelic/subscription_change_service"
alias bcr="cd ~/newrelic/business_change_router"
alias pb="cd ~/newrelic/peanut_2_butter"

alias run_ps="HANDLE_APOF_GRACE_PERIOD=true AUTHORIZATION_URL=https://staging-authorization.nr-ops.net NERDGRAPH_MANAGE_ACCOUNT_ENTITLEMENTS_AUTHLIST=ekingan@newrelic.com PASS_TEAM_MEMBERS=dclark@newrelic.com DISABLE_AEP_REFRESH='true' NR_IP_SAFELIST="" AUDIT_EVENT_RECEIVER_URL=https://audit-ingest.staging-service.nr-ops.net SUBSCRIPTION_ADMIN_SHARED_SECRET=shared_subscription_admin_secret PS_CPM_SHARED_SECRET=1234asdf SUBSCRIPTION_HISTORY_BUFFER_TIME=12 ACCOUNT_DB_URL=mysql://root:@127.0.0.1:13306/seldon_development RPM_ENDPOINT_URL=http://localhost:3006 PROVISIONING_SERVICE_DEV_NO_AUTH_CHECK=true bundle exec rails s -p 3003"
alias run_ps_local_staging="RAILS_ENV=local_staging PROVISIONING_SERVICE_DEV_NO_AUTH_CHECK=true ENTITLEMENTS_DB_URL=postgresql://`newrelic-vault us read -field=value containers/teams/pass/staging/entitlement-service/entitlements-db-ro-user`:`newrelic-vault us read -field=value containers/teams/pass/staging/entitlement-service/entitlements-db-ro-password`@psql-staging-entitlements.nr-ops.net/entitlements_staging ACCOUNT_DB_URL=mysql2://`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-user`:`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-password`@mysql-staging-accountdb-ro.nr-ops.net/rpm_staging ACCOUNT_DB_RO_URL=mysql2://`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-user`:`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-password`@mysql-staging-accountdb-ro.nr-ops.net/rpm_staging RPM_ENDPOINT_URL=https://staging.newrelic.com SUBSCRIPTION_ADMIN_SHARED_SECRET=`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/scs_shared_secret` NR_IP_SAFELIST='' bundle exec rails server -p 3003"
alias run_ps_audits_enabled="AUDIT_EVENT_RECEIVER_URL=http://staging-audit-event-receiver.nr-ops.net SUBSCRIPTION_ADMIN_SHARED_SECRET=shared_subscription_admin_secret ACCOUNT_DB_URL=mysql://root:@127.0.0.1:13306/seldon_development RPM_ENDPOINT_URL=http://localhost:3006 PROVISIONING_SERVICE_DEV_NO_AUTH_CHECK=true bundle exec rails s -p 3003"
alias run_ps_accounts_ro="RAILS_ENV=local_staging PROVISIONING_SERVICE_DEV_NO_AUTH_CHECK=true ACCOUNT_DB_URL=mysql2://`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-user`:`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-password`@mysql-staging-accountdb-ro.nr-ops.net/rpm_staging ACCOUNT_DB_RO_URL=mysql2://`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-user`:`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-password`@mysql-staging-accountdb-ro.nr-ops.net/rpm_staging RPM_ENDPOINT_URL=https://staging.newrelic.com SUBSCRIPTION_ADMIN_SHARED_SECRET=`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/scs_shared_secret` bundle exec rails server -p 3003"
alias run_rpm="bundle exec rails s -p 3006"
alias run_rpm_local_staging="RAILS_ENV=local_staging bundle exec rails s -p 3006"
alias run_scs="NR_IP_SAFELIST="" PS_SHARED_SECRET=shared_subscription_admin_secret AUTH_USERNAME=foo AUTH_PASSWORD=bar ACCOUNT_DB_URL=mysql://root:@127.0.0.1:13306/seldon_development NEW_RELIC_LITE_ID=2c91a0f95cc0769a015cccb80d9705b8 RPM_ENDPOINT_URL=http://localhost:3006 bundle exec rails s -p 3002"
alias run_acs="NR_IP_SAFELIST="" ENTITLEMENT_SET_URL=http://foo:bar@localhost:3002 ACCOUNT_DB_URL=mysql://root:@127.0.0.1:13306/seldon_development RPM_ENDPOINT_URL=http://localhost:3006 SEND_TO_BUSINESS_CLOUD=false bundle exec rails s -p 3004"
alias run_bcr="ACCOUNT_INFORMATION_SERVICE_URL_BASE=http://foo:bar@localhost:3003 PS_API_KEY='foo' NR_IP_SAFELIST="" SUBSCRIPTION_CHANGE_SERVICE_URL=http://foo:bar@localhost:3002 ACCOUNT_CHANGE_SERVICE_URL_BASE=http://localhost:3004 NEW_RELIC_LITE_ID=2c91a0f95cc0769a015cccb80d9705b8 PROVISIONING_SERVICE_URL_BASE=http://localhost:3003 STATUS_CHECK_SERVER_PORT=5000 MYSQL_URL=mysql://root:@127.0.0.1:13306/seldon_development bundle exec bin/run"
alias prod_con="ACCOUNT_DB_URL=mysql2://`newrelic-vault us read -field=value containers/teams/pass/production/provisioning-service/account-db-user`:`newrelic-vault us read -field=value containers/teams/pass/production/provisioning-service/account-db-password`@mysql-accountdb.nr-ops.net/rpm_production ENTITLEMENTS_DB_URL=postgresql://`newrelic-vault us read -field=value containers/teams/pass/production/provisioning-service/entitlements-db-user`:`newrelic-vault us read -field=value containers/teams/pass/production/provisioning-service/entitlements-db-password`@psql-prod-entitlements.nr-ops.net/entitlements_production rails c"
alias staging_con="RAILS_ENV=local_staging ACCOUNT_DB_URL=mysql2://`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-user`:`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-password`@mysql-accountdb.nr-ops.net/rpm_staging ENTITLEMENTS_DB_URL=postgresql://`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/entitlements-db-user`:`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/entitlements-db-password`@psql-staging-entitlements.nr-ops.net/entitlements_staging ACCOUNT_DB_RO_URL=mysql2://`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-user`:`newrelic-vault us read -field=value containers/teams/pass/staging/provisioning-service/account-db-ro-password`@mysql-staging-accountdb-ro.nr-ops.net/rpm_staging bundle exec rails c"
# Git Aliases
alias gco="git checkout"
alias gs="git status"
alias gd="git diff"
alias gpfwl="git push --force-with-lease"

#tmux Aliases
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/openssl/bin:$PATH"
eval "$(rbenv init -)"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# Vim
alias pluginstall="nvim +PlugInstall +PlugClean! +UpdateRemotePlugins +qall"
alias vim="nvim"
v() {
  if [[ $# > 0 ]]
  then
    nvim $@
  else
    nvim .
  fi
}

vconf () {
  nvim $HOME/.config/nvim/init.vim
}

# Shortcut to Edit zshrc
zconf () {
  nvim $HOME/.zshrc
}
# Shortcut to Edit tmux
tconf () {
  nvim $HOME/.tmux.conf
}
