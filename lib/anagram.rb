class Anagram
  
  @@word_hash = nil

  def initialize
    @sorted_anagram = nil
  	@words = nil
    load_words{ cache_words } if @@word_hash.nil?
    @@word_hash ||= load_hash
  end

  def get_anagram word_given

  	  anagram = word_given.chomp
  	  sorted_anagram = anagram.split('').sort!.join('')
  	  @result = @@word_hash[sorted_anagram].reject{|k|k.eql?(word_given)}
      { word_given =>  @result }
      
  end

  private

    def load_words &block

      return if File.exists?("#{Rails.root}/lib/marshaled_hash.txt")

      @words = Hash.new([])

      File.open("#{Rails.root.to_s}/lib/words.txt", "r") do |file|
        while line = file.gets
          word = line.chomp
          @words[word.split('').sort!.join('')] += [word]
        end
      end
    
      yield if block_given?

    end

    def cache_words
      File.open( "#{Rails.root}/lib/marshaled_hash.txt" , "w"){|f| Marshal.dump(@words, f) }
    end

    def load_hash
      File.open( "#{Rails.root}/lib/marshaled_hash.txt" ,'r'){|f| @words = Marshal.load(f) } if File.exists?( "#{Rails.root}/lib/marshaled_hash.txt" )
    end    
end 
