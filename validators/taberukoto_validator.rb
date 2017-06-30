class TaberukotoValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /食べる/
      record.errors[attribute] << (options[:message] || "食べる、っていれてください")
    end
  end
end
