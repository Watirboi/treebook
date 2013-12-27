module ApplicationHelper

  def flash_class(type)
    case type
      when :danger
        "alert-error"
      when :notice
        "alert-success"
      else
        ""
    end
  end
end
