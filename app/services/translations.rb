class Translations
  class InvalidLocale < RuntimeError; end

  def initialize(locales = I18n.available_locales)
    @available_locales = locales.map(&:to_s)
  end

  def for(lang)
    raise InvalidLocale, "#{lang} is not supported" unless valid_locale?(lang.to_s)

    I18n.backend.send(:init_translations)
    hash = I18n.backend.send(:translations)[lang.to_sym]
    flatten_hash(hash)
  end

  private

  attr_reader :available_locales

  def valid_locale?(lang)
    available_locales.include?(lang)
  end

  def flatten_hash(hash, parent = [])
    hash.flat_map do |key, value|
      if value.is_a?(Hash)
        flatten_hash(value, parent + [key])
      else
        {(parent + [key]).join('.') => value}
      end
    end.inject({}, :merge)
  end
end
