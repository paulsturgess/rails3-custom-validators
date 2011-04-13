class DateValidator < ActiveModel::EachValidator

  def validate_each(object, attribute, value)
    return unless value
    if options[:after]
      after_value = options[:after][:value].call(object)
      object.errors[attribute] << "#{options[:after][:message]}" if after_value && (value <= after_value)
    end
    if options[:on_or_after]
      on_or_after_value = options[:on_or_after][:value].call(object)
      object.errors[attribute] << "#{options[:on_or_after][:message]}" if on_or_after_value && (value < on_or_after_value)
    end
    if options[:before]
      before_value = options[:before][:value].call(object)
      object.errors[attribute] << "#{options[:before][:message]}" if before_value && (value >= before_value)
    end
    if options[:on_or_before]
      on_or_before_value = options[:on_or_before][:value].call(object)
      object.errors[attribute] << "#{options[:on_or_before][:message]}" if on_or_before_value && (value > on_or_before_value)
    end
  end
  
end