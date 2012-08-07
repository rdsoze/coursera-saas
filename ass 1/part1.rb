def palindrome?(string)
  string.downcase!
  string.gsub!(/(\W|\d)/,'')
  reverse = string.dup
  string.reverse == reverse
end

def count_words(string)
  words = string.downcase.split(/[^a-zA-Z]/)
  count = {}
  words.each do |w|
    count[w] = count.has_key?(w) ? (count[w] + 1) : 1
  end
  count
end