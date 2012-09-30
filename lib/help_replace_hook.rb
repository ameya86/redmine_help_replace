class HelpReplace < Redmine::Hook::ViewListener
  render_on :view_layouts_base_body_bottom, :partial => 'help_replaces/layouts_base_body_bottom'
end
