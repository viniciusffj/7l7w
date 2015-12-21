module ActAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include  InstanceMethods
    end
  end

  class CsvRow
    def initialize(headers, contents)
      @hash = {}
      contents.each_with_index {|c, i| @hash[headers[i]] = c}
    end

    def method_missing(name, *args)
      @hash[name.to_s]
    end
  end


  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      @rows = []

      file.each do |row|
        contents = row.chomp.split(', ')
        @rows << CsvRow.new(@headers, contents)
        @csv_contents << contents
      end
    end

    def each 
      @rows.each{|row| yield(row) }
    end

    attr_accessor :headers, :csv_contents;

    def initialize
      read
    end
  end
end

class RubyCsv
  include ActAsCsv
  acts_as_csv
end

m = RubyCsv.new

puts 'All languages'
m.each {|row| puts row.language}

puts 'All frameworks'
m.each {|row| puts row.framework}
