require './hangman'

describe Hangman do
  subject(:hangman) { Hangman.new('elephantisis') }
  it "should accept only 1 character"
  it "should accept only alphabet"

  context "#initialize" do
    it "counter should be zero" do
      expect(hangman.counter).to eq (0)
    end
    it "should not be writable" do
      expect{hangman.counter = 10}.to raise_error NoMethodError
    end
    it "word_placeholder should be array of '_'" do
       expect(hangman.word_placeholder).to eq (['_']*12)
    end
    it "word_placeholder length should be of the word" do
        expect(hangman.word_placeholder.length).to eq(12)
    end
    it "missed_counter should be 0" do
        expect(hangman.missed_counter).to eq(0)
    end
    it "wrong_choices should be empty array" do
      expect(hangman.wrong_choices).to eq([])
    end
  end
  context "for correct choice" do

  end

  context "for wrong choice" do

  end

  context "for repeated characters" do

  end

  context "result" do

    context "win" do

    end

    context "lose" do

    end
  end

end
