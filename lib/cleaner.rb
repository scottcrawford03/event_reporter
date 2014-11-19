class Cleaner
  def clean(data)
    if data.nil?
      'XXX'
    else
      data.to_s.downcase
    end
  end

  def clean_phone_number(phone)
    phone.to_s.gsub(/\D/,"").match(/^1?(\d{3})(\d{3})(\d{4})/)
    [$1,$2,$3].join("-")
  end

  def clean_zip_code(zip)
    if zip.nil?
      'XXX'
    else
      zip.to_s.rjust(5, '0')
    end
  end
end
