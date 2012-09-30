require 'redmine' unless Redmine::VERSION::MAJOR >= 2
require 'help_replace_hook'
require 'help_replace_application_helper_patch'

Redmine::Plugin.register :redmine_help_replace do
  name 'Redmine Help Replace plugin'
  author 'OZAWA Yasuhiro'
  description 'Replace help link'
  version '0.0.2'
  url 'https://github.com/ameya86/redmine_help_replace'
  author_url 'http://blog.livedoor.jp/ameya86/'
end
