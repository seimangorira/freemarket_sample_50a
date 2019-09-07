class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def pick_errors(attribute)
    return nil if @object.nil? || (messages = @object.errors.messages[attribute]).nil?
    list = messages.collect do |message|
      %{<div class="validate-error-message">
          <li>#{message}</li>
        </div>}
    end.join

    %{<ul class="errors">#{list}</ul>}.html_safe
  end

  def text_area(attribute, options={})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end

  def select(attribute, collection, options={}, html_options = {})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end

  def collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end

  def file_field(attribute, options={})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end

end
