class Scrabble

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score(word)
    word = word_exploder(word)
    sum(word)
  end

  def word_exploder(word)
    if word.nil?
      word = []
    else
      word = word.chars.map do |letter|
        point_values[letter.upcase]
      end
    end
  end

  def sum(word)
    word.sum
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)
    multiplied = []
    word_exploder(word).each_with_index do |letter, i|
      multiplied << letter * letter_multiplier[i]
    end
    if word_exploder(word).length > 6
      (multiplied.sum + 10) * word_multiplier
    else
      multiplied.sum * word_multiplier
    end
  end
end
