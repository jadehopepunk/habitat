class Array
  def flatten_once
    inject([]) { |v, e| v.concat(e)}
  end
  
  def to_hash
    Hash[*self.flatten_once]
  end
  
  def to_db_string
    '(' + map do |value|
      ActiveRecord::Base.connection.quote(value.to_s)
    end.join(',') + ')'
  end
  
  def tally
    results = {}
    each do |value|
      results[value] ||= 0
      results[value] += 1
    end
    results
  end
end