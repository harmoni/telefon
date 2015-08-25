require_relative "telefon/version"

class Telefon
  WITH_AREA_CODE = /(\d{1,3})(\d{3})(\d{4}$)/
  WITHOUT_AREA_CODE = /(\d{0,3})(\d{3})(\d{4})$/

  DEFAULTS = {
    area_code: false,
    country_code: nil,
    delimiter: "-",
    extension: nil
  }

  def self.convert(number, options = {})
    new(options).convert(number)
  end

  def initialize(options = {})
    @options = DEFAULTS.merge(options)
  end

  def convert(number)
    code = @options[:country_code]
    ext = @options[:extension]

    result = ""

    result << country_code(code) if code
    result << convert_to_phone_number(number.to_s)
    result << extension(ext) if ext

    return result
  end

  private

  def country_code(code)
    return "+#{ code }#{ delimiter }"
  end

  def convert_to_phone_number(number)
    if @options[:area_code]
      return convert_with_area_code(number)
    else
      return convert_without_area_code(number)
    end
  end

  def convert_with_area_code(number)
    return number.gsub(WITH_AREA_CODE, "(\\1) \\2#{ delimiter }\\3")
  end

  def convert_without_area_code(number)
    result = number.gsub(WITHOUT_AREA_CODE, "\\1#{ delimiter }\\2#{ delimiter }\\3")
    result.slice!(0, delimiter.size) if start_with_delimiter?(result)

    return result
  end

  def extension(ext)
    return " x #{ ext }"
  end

  def start_with_delimiter?(number)
    delimiter && number.start_with?(delimiter)
  end

  def delimiter
    return @options[:delimiter]
  end
end
