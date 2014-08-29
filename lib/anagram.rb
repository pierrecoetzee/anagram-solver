class Anagram

  def initialize
  	@sorted_anagram = nil
  	@words = nil
    load_words
    @word_hash = load_hash
  end

  def run
  	while true
  	  print "Enter word: "
  	  anagram = gets.chomp
  	  sorted_anagram = anagram.split('').sort!.join('')
  	  puts sorted_anagram
  	  p  @words[sorted_anagram]
  	end
  end

  private

  def load_hash
  	if File.exists?('#{Rails.root}/lib/marshaled_hash.txt')
  	  return File.open("#{Rails.root}/lib/word_hash.txt",'r'){|f| @words = Marshal.load(f) }
  	end 
  	nil
  end

  def load_words

  	return if File.exists?("#{Rails.root}/lib/word_hash.txt")

  	@words = Hash.new([])

  	File.open("#{Rails.root.to_s}/lib/words.txt", "r") do |file|
  	  while line = file.gets
  	    word = line.chomp
  	    @words[word.split('').sort!.join('')] += [word]
  	  end
  	end

  	File.open("#{Rails.root.to_s}/lib/marshaled_hash.txt", "w") do |file|
  	  Marshal.dump(@words, file)
  	end
  end
end 