def caesar_cipher(text, shift)
  alphabet = ('a'..'z').to_a
  shifted_text = text.chars.map do |char|
    if alphabet.include?(char.downcase)
      is_uppercase = char == char.upcase
      shifted_char = alphabet[(alphabet.index(char.downcase) + shift.to_i) % 26]
      is_uppercase ? shifted_char.upcase : shifted_char
    else
      char
    end
  end
  shifted_text.join
end

# "Usage: ruby caesar_cipher.rb 'text here' 6"

# If running the script with arguments
if ARGV.length >= 2
  text = ARGV[0]
  shift = ARGV[1].to_i
  puts caesar_cipher(text, shift)
end
