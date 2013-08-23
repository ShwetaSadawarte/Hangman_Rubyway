class Hangman
  attr_reader :counter, :word_placeholder, :missed_counter, :repeated_choices #, :wrong_choices
  attr_accessor :guess_input

   def initialize(word)
     @word = word
     @counter = 0
     @word_placeholder = ['_']*@word.length
     @missed_counter = 0
     #@wrong_choices = []
     @repeated_choices = []
   end

  def play_game
    #puts "give input char"
    #guess_input = gets.chomp
    if @repeated_choices.index(@guess_input).nil? && !(@guess_input.match(/^[[:alpha:]]+$/).nil?)
      @repeated_choices.push(@guess_input)

      if @guess_input.length > 1
        if @word == @guess_input
          @counter = @word.length
         # result
        else
          @missed_counter += 1
          @repeated_choices.push(@guess_input)
        end
      else
        wordString = @word.split("")
        position = wordString.each_index.select{|i| wordString[i].casecmp(@guess_input) == 0}
        if position.length > 0
          @counter += position.length
          position.each do |index|
            word_placeholder[index]= @guess_input
          end
        else
          @missed_counter += 1
        end
      end
    else
      puts 'You already entered that before'
    end
  end

  def game_start
    while @counter < @word.length && @missed_counter < 7 do
      print 'Word to guess =>'
      #puts "Word to guess => #{(@word_placeholder = ['_']*@word.length).join ' '}"
      @word_placeholder.each do |u|
        print u + ' '
      end
      print "\nwrong choice counter = #{@missed_counter.to_s}"
      print "\nEnter character =>"
      @guess_input = (gets.chomp).downcase
      play_game
      result
    end
  end

  def result
     if @counter == @word.length
       puts 'Congrats'
     end
     if @missed_counter == 6
       puts 'Sorry...'
     end
   end
end

Hangman.new('elephantisis').game_start