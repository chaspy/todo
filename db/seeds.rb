require "csv"

CSV.foreach('db/tag.csv') do |row|
  Tag.create(:name => row[0])
end
