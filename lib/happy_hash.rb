require 'string'

class Hash

  def happy_hash(down_case=false)
    sym_keys(self, down_case)
  end


  def sym_keys(hash, down_case=false)
    hash.inject({}) { |result, (key, value)|
      new_key = case key
                when String then (down_case ? key.to_sym : key.underscore.to_sym)
                else key
                end
    new_value = case value
                when Hash then sym_keys(value, down_case)
                when Array then sym_array(value, down_case)
                else value
                end

    result[new_key] = new_value

    result
    }
  end

  private
  def sym_array(array, down_case=false)
    array.map do |value|
      case value
      when Hash then sym_keys(value, down_case)
      when Array then sym_array(value, down_case)
      else
        value
      end
    end
  end

end

