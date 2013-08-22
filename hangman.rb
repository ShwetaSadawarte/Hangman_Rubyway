class Hangman
  attr_reader :counter, :word_placeholder, :missed_counter, :repeated_choices #, :wrong_choices
  attr_accessor :guess_input

   def initialize(word)
     @word = word
     @counter = 0
     @word_placeholder = ['_']*word.length
     @missed_counter = 0
     #@wrong_choices = []
     @repeated_choices = []
   end

   def user_input

   end

=begin
   def play_game
     guess_input = gets.chomp
     @guess_input = guess_input

     if @guess_input=~ /^[a-zA-Z]$/

     end
     if @word.include? @guess_input
       if @guess_input.length > 1
         if (@guess_input == @word)
           @counter = @word.length
           result
         end

         position = @word.each_index.select{|i| convertWord[i].casecmp(guess_input) == 0}
         position.each do |tt|
           word_placeholder[tt] = guess_input
           @counter +=1
           end
         @repeated_choices[].push(@guess_input)
       end
     end
   end
=end
  def play_game
    #guess_input = gets.chomp
    #@guess_input = guess_input

    if @repeated_choices.index(@guess_input).nil? && !(@guess_input.match(/^[[:alpha:]]+$/).nil?)
      @repeated_choices.push(@guess_input)

      if @guess_input.length > 1
        if @word == @guess_input
          @counter = @word.length
          result
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
          puts word_placeholder
        else
          @missed_counter += 1
        end
      end
    else
      puts "You already entered that before"
    end
  end

   def result
     if @counter == @word.length
       puts "Win"
     end
     if @missed_counter == 6
       puts "Loss"
     end
   end
end