module ItemsHelper
  #def error_message obj, field
  #  if !obj.errors[field].empty?
  #   "#{field.capitalize} #{obj.errors[field].first}"
  #  end
  #end

  def error_message obj, field
    if message = obj.errors[field].first
      "#{field.capitalize} #{message}"                  
    end
  end
end
