class DateValidator < ActiveModel::EachValidator

  def validate_each(object, attribute, value)
    return unless value
    if options[:after]
      after_value = options[:after][:value].call(object)
      object.errors[attribute] << "#{options[:after][:message]}" if after_value && value < after_value
    end
  end
  
end