# frozen_string_literal: true

class ValidatesIdentity
  module ClRut
    class Validator
      VALIDATION_REGULAR_EXPRESSION = /^(\d{2})\.?(\d{3})\.?(\d{3})-?(\d{1}|K|k)$/.freeze

      attr_reader :value

      def initialize(value)
        @value = value
      end

      def valid?
        return true if value.blank?
        return false if number.nil?

        verifier_digit == calculated_verifier_digit
      end

      def formatted
        return if result.nil?

        "#{result[1]}.#{result[2]}.#{result[3]}-#{result[4].upcase}"
      end

      private

      def result
        @result ||= VALIDATION_REGULAR_EXPRESSION.match(value)
      end

      def number
        return if result.nil?

        @number ||= "#{result[1]}#{result[2]}#{result[3]}"
      end

      def verifier_digit
        result[4].to_s.upcase
      end

      def calculated_verifier_digit
        sum = multiply_and_sum([3, 2, 7, 6, 5, 4, 3, 2], number)
        rest = sum % 11
        difference = 11 - rest

        case difference
        when 11 then '0'
        when 10 then 'K'
        else difference.to_s
        end
      end

      def multiply_and_sum(array, number)
        multiplied = []
        number.scan(/\d{1}/).each_with_index { |e, i| multiplied[i] = e.to_i * array[i] }
        multiplied.inject { |s, e| s + e }
      end
    end
  end
end
