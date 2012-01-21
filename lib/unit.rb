# encoding: utf-8

class Unit
  COMMON_VOLUME_UNITS = %w(m^3 L gal)
  COMMON_WEIGHT_UNITS = %w(kg lb)
  CALENDAR_TIME_UNITS = %w(day week month year decade century)
  LAND_AREA_UNITS = ['m^2', 'feet^2', 'acres', 'hectares']
  COMMON_SMALL_LENGTH_UNITS = %w(cm m inches feet)

  SYSTEMS_OF_MEASURE = %w(metric US imperial)
  
  def self.format_unit(value)
    return nil if value.blank?
    value = value.gsub('^2', '²')
    value = value.gsub('^3', '³')
    value
  end
  
  def self.format_amount_and_unit(amount, unit, options = {})
    return nil if unit.blank? 
    if options[:hide_one] && amount == 1.0
      amount = nil
    else
      return nil if amount.blank? 
    end
    if amount.to_i.to_f == amount
      amount = amount.to_i
    end
    if options[:pluralize_unit] && amount && amount > 1
      unit = unit.pluralize
    end
    [amount, Unit.format_unit(unit)].reject(&:blank?).join(' ')
  end
end