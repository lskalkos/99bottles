class Bottles
  UNIQUE_VERSES = [2, 1, 0]

  def song
    verses(99, 0)
  end

  def verses(verse_a, verse_b)
    range = (verse_b..verse_a).to_a.reverse
    range.map do |n|
      verse(n)
    end.join("\n")
  end

  def verse(number)
    unique_verse?(number) ? send("verse_#{number}") : default_case(number)
  end

  def verse_2
    <<-VERSE
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
    VERSE
  end

  def verse_1
    <<-VERSE
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
  end

  def verse_0
    <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end

  def default_case(number)
    <<-VERSE
#{number} bottles of beer on the wall, #{number} bottles of beer.
Take one down and pass it around, #{number-1} bottles of beer on the wall.
    VERSE
  end

  private
  def unique_verse?(number)
    UNIQUE_VERSES.include?(number)
  end
end
