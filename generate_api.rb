#!/usr/bin/env ruby

require './styles'
require 'json'

index = []

STYLES.each do |style_group|
  style_group[:styles_attributes].each do |style|
    id = "#{style_group[:number]}#{style[:letter]}"
    style.delete(:letter)
    style[:id] = id
    index << style
    file = File.open("styles/#{id}.json", 'w')
    file.write(style.to_json)
    file.close
  end
end

file = File.open('styles/index.json', 'w')
file.write(index.to_json)
file.close
