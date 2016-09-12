module I18nHelper
  def translate(key, options={})
    super(key, options.merge(raise: true))
  rescue I18n::MissingTranslationData
    key.split('.')[-1]
  end
  alias :t :translate
end
