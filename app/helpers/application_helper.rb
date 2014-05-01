module ApplicationHelper
  def app_button(action, path)
    case action
    when "show"
      link_to path, :class => "btn btn-info" do
        content = content_tag(:i, "", :class => "icon-info-sign icon-white")
        content += " "
        content += t("action.show", :default => "Show")
        content.html_safe
      end
    when "edit"
      link_to path, :class => "btn btn-warning", :id => "edit" do
        content = content_tag(:i, "", :class => "icon-edit icon-white")
        content += " "
        content += t("action.edit", :default => "Edit")
        content.html_safe
      end
    when "delete"
      link_to path, :method => :delete, :class => "btn btn-danger", :data => {:confirm => "#{t("action.confirm", :default => "Are you sure?")}" } do
        content = content_tag(:i, "", :class => "icon-remove-circle icon-white")
        content += " "
        content += t("action.delete", :default => "Delete")
        content.html_safe
      end
    when "pdf"
      link_to path, :target => "_blank", :class => "btn btn-info" do
        content = content_tag(:i, "", :class => "icon-file icon-white")
        content += " "
        content += t("action.pdf", :default => "PDF")
        content.html_safe
      end
    when "save"
      link_to path, :class => "btn btn-primary", :data => { :disable_with => 'Please wait ...'} do
        content = content_tag(:i, "", :class => "icon-pencil icon-white")
        content += " "
        content += t("action.save", :default => "Save")
        content.html_safe
      end
    when "cancel"
      link_to path, :class => "btn btn-success" do
        content = content_tag(:i, "", :class => "icon-arrow-left icon-white")
        content += " "
        content += t("action.cancel", :default => "Cancel")
        content.html_safe
      end
    end
  end

  #Cancanのabilityに基づきShow Methodの読み込み権限がある場合にのみリンク先を表示する
  def show_link(object)
      link_to object, :class => "show-link" do
        content = content_tag(:i, "", :class => "icon-info-sign")
        content += " "
        content += t("action.show", :default => "Show")
        content.html_safe
      end
  end

  def show_ajax_link(object)
      link_to object, {:remote => true, 'data-toggle' => 'modal', 'data-target' => "#modal-window", 'data-backdrop' => true, 'data-keyboard' => true} do
        content = content_tag(:i, "", :class => "icon-eye-open")
        content += " "
        content += t("action.show", :default => "Show")
        content.html_safe
      end
  end

  def show_button(object)
      link_to object, :class => "btn btn-info btn-small" do
        content = content_tag(:i, "", :class => "icon-info-sign icon-white")
        content += " "
        content += t("action.show", :default => "Show")
        content.html_safe
      end
  end

  #Cancanのabilityに基づきEdit Methodのみ権限がある場合にのみリンク先を表示する
  def edit_link(object)
      link_to [:edit, object], :class => "edit-link" do
        content = content_tag(:i, "", :class => "icon-pencil")
        content += " "
        content += t("action.edit", :default => "Edit")
        content.html_safe
      end
  end

  def edit_button(object)
      link_to [:edit, object], :class => "btn btn-warning btn-small" do
        content = content_tag(:i, "", :class => "icon-pencil icon-white")
        content += " "
        content += t("action.edit", :default => "Edit")
        content.html_safe
      end
  end

  def edit_ajax_button(object)
      link_to [:edit, object], {:remote => true, 'data-toggle' => 'modal', 'data-target' => "#modal-window", :class => "btn btn-warning btn-small"} do
        content = content_tag(:i, "", :class => "icon-pencil icon-white")
        content += " "
        content += t("action.edit", :default => "Edit")
        content.html_safe
      end
  end

  #Cancanのabilityに基づきDestroy Methodのみ権限がある場合にのみリンク先を表示する
  def destroy_link(object)
      link_to object, :method => :delete, :data => { :confirm => "Are you sure?" }, :class => "destroy-link" do
        content = content_tag(:i, "", :class => "icon-remove")
        content += " "
        content += t("action.delete", :default => "Delete")
        content.html_safe
      end
  end

  def destroy_ajax_link(object)
      link_to object, :method => :delete, :data => { :confirm => "Are you sure?" }, :remote => true, :class => "destroy-link" do
        content = content_tag(:i, "", :class => "icon-remove")
        content += " "
        content += t("action.delete", :default => "Delete")
        content.html_safe
      end
  end

  def destroy_button(object)
      link_to object, :method => :delete, :data => { :confirm => "Are you sure?" }, :class => "btn btn-danger btn-small" do
        content = content_tag(:i, "", :class => "icon-remove icon-white")
        content += " "
        content += t("action.delete", :default => "Delete")
        content.html_safe
      end
  end

  def destroy_ajax_button(object)
      link_to object, :method => :delete, :data => {:confirm => "Are you sure?"}, :remote => true, :class => "btn btn-danger btn-small" do
        content = content_tag(:i, "", :class => "icon-remove icon-white")
        content += " "
        content += t("action.delete", :default => "Delete")
        content.html_safe
      end
  end

  #Cancanのabilityに基づきCreate Methodのみ権限がある場合にのみリンク先を表示する
  def create_link(object)
      object_class = (object.kind_of?(Class) ? object : object.class)
      link_to [:new, object_class.name.underscore.to_sym] do
        content = content_tag(:i, "", :class => "icon-plus")
        content += " "
        content = "#{t("action.new", :default => "New")}"
      end
  end

  # HTMLタグをすべて除去
  def rm_html_tag(str)
    str.sub!(/<[^<>]*>/,"") while /<[^<>]*>/ =~ str
    str
  end

  #htmlエスケープした上で改行を＜br＞変換する
  def hbr(str)
    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end
end
