card_number = "4929735477250543"

valid = false

class CreditCheck
  def validator (account_id)
    account_id_array = array_conversion(account_id)
    doubled_array = double_numbers(account_id_array)
    summed_array = sum_large_digits(doubled_array)
    sum = summed_account_id(summed_array)
    if mod_value_zero?(sum)
      "The number is valid"
    else
      "The number is invalid"
    end
  end

  def array_conversion (account_id)
    array = account_id.chars
    array.map {|character| character.to_i}
  end

  def double_numbers (account_id_array)
    account_id_array.map.with_index(1) do |integer, index|
      if index.even?
        integer * 2
      elsif index.odd?
        integer
      end
    end
  end

  def sum_large_digits (account_id_array)
    account_id_array.map do |integer|
      if integer > 9
        int_array = self.split_num(integer)
        int_array.reduce :+
      else
        integer
      end
    end
  end

  def summed_account_id (final_array)
    final_array.reduce :+
  end

  def mod_value_zero?(summed_account_id)
    if summed_account_id % 10 == 0
      true
    else
      false
    end
  end

  def calculate_check_digit (summed_account_id)
    int_array = self.split_num(summed_account_id)
    10 - int_array.last
  end

  def split_num (integer)
    strings = integer.to_s.split('')
    int_array = strings.map {|string| string.to_i}
  end

end
