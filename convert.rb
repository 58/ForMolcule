# coding:utf-8

require 'csv'

csv_data = CSV.read('element_table.tsv', col_sep: "\t", headers: false)
csv_data.each do |row|
  File.open('aw.txt', 'a') do |text|
    symbol = row[1]
    aw = row[3].slice(/\d+\.?\d*+/)
    code = <<-"TOAW"
  if symbol == '#{symbol}' then
    return #{aw}
  end
    TOAW
    text.puts(code)
   end
end
