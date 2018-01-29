require 'pry'
class PigLatinizer

  def initialize
  end

  def piglatinize(word)
    @word = word.downcase
    first = word[0]

    if @word.length == 1 || @word.match(/^[aeiouAEIOU]/)
      word + "way"
    elsif word[1].match(/[aeiouAEIOU]/)
       word.gsub(/^[bcdfghjklmnpqrstvxywBCDFGHJKLMNPQRSTVXYW]/, "") + first + "ay"
    elsif word[2].match(/[aeiouAEIOU]/)
       word.gsub(word[0..1], "") + (word[0..1]).downcase + "ay"
     else
       word.gsub(word[0..2], "") + (word[0..2]).downcase + "ay"
    end
  end

  def to_pig_latin(string)
    words = string.split(" ")

    sentence = words.collect do |word|
      piglatinize(word)
    end

    sentence.join(" ")
  end

end
