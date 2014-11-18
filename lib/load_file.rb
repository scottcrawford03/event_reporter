require 'CSV'

class LoadFile
  def self.load_csv(file_name)
    file_name = File.join 'csv', file_name
    csv = CSV.table(file_name, :header_converters => :symbol, :converters => :all)
  end
end
