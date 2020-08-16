require "yaml"
require 'pry'

def load_library(path)
  emoticons_library = YAML.load_file('lib/emoticons.yml')
  result = {}
  emoticons_library.each do |key, value|
    result[key] = {
      :english => value[0],
      :japanese => value[1]
    }
  end
  result
end

def get_japanese_emoticon(path, emoticon)
  emoticons_hash = load_library(path)

  emoticons_hash.each do |emoticon_name, result|
    result.each do |key, value|
      if emoticon == value
        return result[:japanese]
      end
    end
  end
p "Sorry, that emoticon was not found"
end
  

def get_english_meaning(path, emoticon)
  emoticons_hash = load_library(path)
  
  emoticons_hash.each do |emoticon_name, result|
    result.each do |key, value|
      if emoticon == value
        return emoticon_name
      end
    end
  end
  p "Sorry, that emoticon was not found"
end