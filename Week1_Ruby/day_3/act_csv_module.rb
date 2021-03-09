#!/usr/bin/env ruby

# Act CSV files
module ActsAsCsv
  # Object for CSV rows
  class CsvRow
    def initialize(headers, contents)
      @headers = headers
      @contents = contents
    end

    # finds and returns FIELD data in ROW
    def method_missing(field)
      index = @headers.index(field.to_s)
      @contents[index] if index
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  # instance module
  # defines set of methods to manipulate a file
  module InstanceMethods
    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    # reads the contents of a file
    def read
      @csv_contents = []
      filename = File.dirname(__FILE__) + '/' + self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    # walk trough the contents and convert each row to the CsvRow object
    def each
      @csv_contents.each do |r|
        row = CsvRow.new(@headers, r)
        yield(row)
      end
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

# create an object
m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

# output file content
m.each { |row| puts "#{row.last} #{row.first} from #{row.country}" if row }
