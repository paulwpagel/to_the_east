module East
  class Dateitize
    def self.format(date)
      return "" if date && date.empty?
      return "#{Time.now.strftime("%Y%m%d%L")}_#{date}.rb"
    end
  end
end