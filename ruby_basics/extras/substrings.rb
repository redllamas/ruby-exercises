dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(word, dictionary, result = Hash.new(0))
  phrase = word.downcase

  dictionary.each do |w|
    count = phrase.scan(w).count
    result[w] = count if count > 0
  end

  result
end
