module I18nHelper
  def translate(key, options={})
    translation_center_key = TranslationCenter::TranslationKey.find_by(name: key)
    translation_key =  super(key, options.merge(raise: true))
    if user_signed_in? && (translation_key.include? ("translation_missing")) && !current_user.nil? && (current_user.role? "translator") && (current_user.debug_translations == "missing")
      translation_key = ActionView::Base.full_sanitizer.sanitize(translation_key)
      simple_format %(<span class="info translation_missing tc-inspector-key" data-locale="#{I18n.locale}" data-type="#{translation_center_key.status(I18n.locale)}" data-id="#{translation_center_key.id}" title="translation missing: ">#{translation_key}</span>)
      simple_format(translation_key,  {class: "info translation_missing tc-inspector-key", "data-locale" => "#{I18n.locale}", "data-type" => "#{translation_center_key.status(I18n.locale)}", "data-id" => "#{translation_center_key.id}", title: "translation missing: #{key}"}, wrapper_tag: "span")
    elsif user_signed_in? && !current_user.nil? && (current_user.role? "translator") && (current_user.debug_translations == "all")
      translation_key = ActionView::Base.full_sanitizer.sanitize(translation_key)
      simple_format %(<span class="info translation_missing tc-inspector-key" data-locale="#{I18n.locale}" data-type="#{translation_center_key.status(I18n.locale)}" data-id="#{translation_center_key.id}" title="translation missing: ">#{translation_key}</span>)
      simple_format(translation_key,  {class: "info translation_missing tc-inspector-key", "data-locale" => "#{I18n.locale}", "data-type" => "#{translation_center_key.status(I18n.locale)}", "data-id" => "#{translation_center_key.id}", title: "translation missing: #{key}"}, wrapper_tag: "span")    
    else
      translation_key
    end
  #rescue I18n::MissingTranslation
  #  if TranslationCenter::CONFIG['inspector'] == 'off' || category == 'translation_center'
  #    %(<span class="info translation_missing" title="translation missing: #{keys.join('.')}">#{key}</span>)
  #  else
  #    %(<span class="success translation_missing tc-inspector-key" data-locale='#{I18n.locale}' data-type="#{translation_key.status(I18n.locale)}" data-id="#{translation_key.id}" title="translation missing: #{keys.join('.')}">#{key}</span>)
  #  end
  end
  alias :t :translate
end