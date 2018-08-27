class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    binding.pry
    unless value =~ ::Regexp.union(/^(\+?1)?[2-9]\d{2}[2-9](?!11)\d{6}$/, /\A1\d{10}\z/)
      record.errors[attribute] << (options[:message] || "is not an phone number")
    end
  end
end