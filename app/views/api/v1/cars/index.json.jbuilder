


json.array! @cars do |car|
    json.extract! car, :id, :name
end