require "yaml"
require 'pry'


def load_library (file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  emoticons.each do |emoticon, translation|
     new_hash["get_meaning"][translation[1]] = emoticon
     new_hash["get_emoticon"][translation[0]] = translation[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, the_emoticon)
  sorry_message = "Sorry, that emoticon was not found"
  translation_hash = load_library(file_path)
  if translation_hash["get_emoticon"][the_emoticon].nil?
    return sorry_message
  else
    return translation_hash["get_emoticon"][the_emoticon]
  end
end

def get_english_meaning(file_path, the_emoticon)
  sorry_message = "Sorry, that emoticon was not found"
  translation_hash = load_library(file_path)
  if translation_hash["get_meaning"][the_emoticon].nil?
    return sorry_message
  else 
    return translation_hash["get_meaning"][the_emoticon]
  end
end