require 'yaml'

def load_library(file_path = 'lib/emoticons.yml')
  emoticons = YAML.load_file(file_path)
  return_hash = { "get_meaning" => {}, "get_emoticon" => {} }
  
  emoticons.each do |meaning, translations|
    return_hash["get_meaning"][translations[1]] = meaning
    return_hash["get_emoticon"][translations[0]] = translations[1]
  end
  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library('lib/emoticons.yml')
  emoticons["get_emoticon"].each do |english_emoticon, japanese_emoticon|
    if emoticon == english_emoticon
      return japanese_emoticon
    end
  end
  return "Sorry that emoticon was not found"
end