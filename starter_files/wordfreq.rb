class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    contents = File.read(filename).downcase.gsub("--", " ")
    @contents = contents.gsub(/[^a-z0-9\s]/i, '')
    wordArray = @contents.split(" ") - STOP_WORDS

    @words ={}

    wordArray.each do |word|
      if @words.include?(word)
        @words[word] += 1
      else
        @words[word] =1
    end
  end
end

  def frequency(word)
     @words[word]
    # p word
    # pattern = /\s#{word}\s/i
    # @contents.scan(pattern).count
  end

  def frequencies
    @words
  #   patternfreq = /\s#{frequencies}\s/i
  #  @contents.scan(patternfreq)
  end

  def top_words(number)
    @words.sort_by {|word, count| count}.reverse.take(5)
  end

  def print_report
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
