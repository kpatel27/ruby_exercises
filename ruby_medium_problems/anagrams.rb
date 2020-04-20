=begin
Write a program that, given a word and a list of possible anagrams, selects the
correct sublist that contains the anagrams of the word.

UNDERSTANDING THE PROBLEM
=========================
INPUT: String
OUTPUT: List of strings

Rules: Case insensitve and must be of equal length

DATA STRUCTURES
========================
Store anagrams in an array

ALGORITHM
=======================
INITIALIZE empty array set to the variable anagrams
ITERATE through each word in the list of possible anagrams
sort the word alphabetically and compare against the input sorted alphabetically
IF both values are equal, PUSH word to anagrams array
=end

class Anagram
  def initialize(string)
    @string = string
    @letters = string.downcase.chars.sort
  end

  def match(list_of_words)
    anagrams = []
    list_of_words.each do |word|
      if is_anagram?(word) && anagrams.map {|word| word.downcase}.include?(@string) == false
        anagrams << word
      end
    end
    anagrams.sort
  end

  def is_anagram?(word)
    return false if word.downcase == @string.downcase
    word.downcase.chars.sort == @letters
  end
end

require 'minitest/autorun'

class AnagramTest < Minitest::Test
  def test_no_matches
    detector = Anagram.new('diaper')
    assert_equal [], detector.match(%w(hello world zombies pants))
  end

  def test_detect_simple_anagram
    detector = Anagram.new('ant')
    anagrams = detector.match(%w(tan stand at))
    assert_equal ['tan'], anagrams
  end

  def test_detect_multiple_anagrams
    detector = Anagram.new('master')
    anagrams = detector.match(%w(stream pigeon maters))
    assert_equal %w(maters stream), anagrams.sort
  end

  def test_does_not_confuse_different_duplicates
    detector = Anagram.new('galea')
    assert_equal [], detector.match(['eagle'])
  end

  def test_identical_word_is_not_anagram
    detector = Anagram.new('corn')
    anagrams = detector.match %w(corn dark Corn rank CORN cron park)
    assert_equal ['cron'], anagrams
  end

  def test_eliminate_anagrams_with_same_checksum
    detector = Anagram.new('mass')
    assert_equal [], detector.match(['last'])
  end

  def test_eliminate_anagram_subsets
    detector = Anagram.new('good')
    assert_equal [], detector.match(%w(dog goody))
  end

  def test_detect_anagram
    detector = Anagram.new('listen')
    anagrams = detector.match %w(enlists google inlets banana)
    assert_equal ['inlets'], anagrams
  end

  def test_multiple_anagrams
    detector = Anagram.new('allergy')
    anagrams =
      detector.match %w( gallery ballerina regally clergy largely leading)
    assert_equal %w(gallery largely regally), anagrams.sort
  end

  def test_anagrams_are_case_insensitive
    detector = Anagram.new('Orchestra')
    anagrams = detector.match %w(cashregister Carthorse radishes)
    assert_equal ['Carthorse'], anagrams
  end
end
