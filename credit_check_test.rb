# Valid: 5541808923795240, 4024007136512380, 6011797668867828
# Invalid: 5541801923795240, 4024007106512380, 6011797668868728

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/creditcheck.rb'

class CreditCheckTest < Minitest::Test
  def test_it_can_tell_if_a_number_is_valid
    input = '6011797668867828'

    credit_check = CreditCheck.new
    actual = credit_check.validator(input)
    expected = "The number is valid"

    assert_equal expected, actual
  end

  def test_it_can_tell_if_a_number_is_invalid
    input = '5541801923795240'

    credit_check = CreditCheck.new
    actual = credit_check.validator(input)
    expected = "The number is invalid"

    assert_equal expected, actual
  end

  def test_array_of_integers
    input = '5541808923795240'

    credit_check = CreditCheck.new
    expected = [5, 5, 4, 1, 8, 0, 8, 9, 2, 3, 7, 9, 5, 2, 4, 0]
    actual = credit_check.array_conversion(input)

    assert_equal expected, actual
  end

  def test_multiplies_every_other_digit_by_two
    input = [5, 5, 4, 1, 8, 0, 8, 9, 2, 3, 7, 9, 5, 2, 4, 0]

    credit_check = CreditCheck.new
    expected = [5, 10, 4, 2, 8, 0, 8, 18, 2, 6, 7, 18, 5, 4, 4, 0]
    actual = credit_check.double_numbers(input)

    assert_equal expected, actual
  end

def test_sum_digits_over_ten
  input = [5, 10, 4, 2, 8, 0, 8, 18, 2, 6, 7, 18, 5, 4, 4, 0]

  credit_check = CreditCheck.new
  expected = [5, 1, 4, 2, 8, 0, 8, 9, 2, 6, 7, 9, 5, 4, 4, 0]
  actual = credit_check.sum_large_digits(input)

  assert_equal expected, actual
end

def test_sum_elements_of_array
  input = [5, 1, 4, 2, 8, 0, 8, 9, 2, 6, 7, 9, 5, 4, 4, 0]

  credit_check = CreditCheck.new
  expected = 74
  actual = credit_check.summed_account_id(input)

  assert_equal expected, actual
end

def test_mod_is_zero
  input = 70

  credit_check = CreditCheck.new
  expected = true
  actual = credit_check.mod_value_zero?(input)

  assert_equal expected, actual
end

def test_produce_check_digit
  input = 74

  credit_check = CreditCheck.new
  expected = 6
  actual = credit_check.calculate_check_digit(input)

  assert_equal expected, actual
end

end
#
# describe '#luna_algorithm' do
#
#   it 'should multiply every other digit times 2' do
#     account_id = [1, 2, 3, 9]
#     doubled = luna_algorithm(account_id)
#     expect(doubled).to eq([1, 4, 3, 18])
#   end
#
#   it 'should sum digits over 10' do
#     doubled = [1, 4, 3, 18]
#     summed = luna_algorithm(doubled)
#     expect(summed).to eq([1, 4, 3, 9])
#   end
#
#   it 'should sum the elements of the array' do
#     summed = [1, 4, 3, 9]
#     sum_array = luna_algorithm(summed)
#     expect(sum_array).to eq(17)
#   end
#
#   it 'should return 10 minus one digit of result' do
#     sum_array = 17
#     check_digit = luna_algorithm(sum_array)
#     expect(check_digit).to eq(3)
#   end
#
# end
