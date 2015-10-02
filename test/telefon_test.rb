require "cutest"
require_relative "../lib/telefon"

scope do
  test "convert without area code" do
    result = Telefon.convert(1235551234)

    assert_equal("123-555-1234", result)
  end

  test "covert with area code" do
    result = Telefon.convert(1235551234, area_code: true)

    assert_equal("(123) 555-1234", result)
  end

  test "with additional options" do
    result = Telefon.convert(1235551234, country_code: 1,
      extension: 1343, delimiter: ".")

    assert_equal("+1.123.555.1234 x 1343", result)
  end
end
