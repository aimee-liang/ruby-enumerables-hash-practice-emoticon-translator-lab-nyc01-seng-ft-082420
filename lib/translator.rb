require "yaml"

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
  emoticons_library = load_library(path)

  emoticons_library.select.do |key, value|
    if emoticon == value[:english]
      return value[:japanese]
    end
  end
  unless emoticons_library.include? (emoticon)
    return "Sorry, that emoticon was not found"
  end
end
  

def get_english_meaning(path, emoticon)
  emoticons_library = load_library(path)

  emoticons_library.select.do |key, value|
    if emoticon == value[:japanese]
      return key
    end
  end
  unless emoticons_library.include?(emoticon)
    return "Sorry, that emoticon was not found"
  end
end