class Hangman
  attr_reader :counter, :word_placeholder, :missed_counter, :wrong_choices

   def initialize(word)
     @word = word
     @counter = 0
     @word_placeholder = ['_']*word.length
     @missed_counter = 0
     @wrong_choices = []
   end

end