require_dependency 'application_helper'

module HelpReplaceApplicationHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods) # obj.method
  end

  module InstanceMethods # obj.method
    @@help_replace_links = nil

    # 差し替えるURLを取得する
    def url_for_help_replace(controller_name, action_name)
      help_replace_links = load_help_replace

      help_url = help_replace_links['default']

      controller_helps = help_replace_links[controller_name]
      if controller_helps
        action_helps = controller_helps[action_name]
        if action_helps
          help_url = action_helps
        elsif controller_helps['default']
          help_url = controller_helps['default']
        end
      end

      return help_url
    end

    # ymlファイルの場所
    def help_replace_yaml_file
      unless @help_replace_yaml_file
        if Redmine::VERSION::MAJOR >= 2
          # 2.x
          @help_replace_yaml_file = "#{Rails.root}/plugins/redmine_help_replace/files/help_replace.yml"
        else
          # 1.x
          @help_replace_yaml_file = "#{RAILS_ROOT}/vendor/plugins/redmine_help_replace/files/help_replace.yml"
        end
      end

      return @help_replace_yaml_file
    end

    # ymlファイルを読み込む
    def load_help_replace
      unless @@help_replace_links
        @@help_replace_links = YAML.load_file(help_replace_yaml_file)
      end

      return @@help_replace_links
    end
  end
end

ApplicationHelper.send(:include, HelpReplaceApplicationHelperPatch)
