excluded_words = ["about","above","after","again","against","ago","all","am","an","and","are","as", "asked", "at","back","be","because","been","before","behind","between","both","but","by","can","could","did", "didn", "do","does","doesn","don","down","during","each","few","for","from","get","go", "going", "got","gotten","had", "hadn", "has","have","he","her","here","hers", "herself", "him","his", "himself", "how", "if","in","into","is","isn","it","its","last","less","let","like","little","ll","long","made","make","many","mine","more","much","must","my","need","needed","next","no", "not", "of","off","often","old","on","once","only","or","other","our","ours","out","over","part","put","re","said","same","say","she","should","since","so","some","soon","such","take","tell","than","that","the","their","theirs","them","then","there","these","they","this","through","to","told","too","took","under","until","up","upon","us","ve", "was", "wasn", "we","were","what","when","where","which","who","why","will","with","without","won","would","yes","you","your","yours"]

text = "Lorem ipsum dolor sit amet."

# ----------------------------------------------------------------------------------------------------
# DON'T MAKE ANY CHANGES BELOW THIS LINE
# ----------------------------------------------------------------------------------------------------

clean_text = text.gsub(/[^a-zA-ZÀ-ÖØ-öø-ÿ]/, ' ').delete(",").gsub(/\b[a-zA-Z]\b/, ' ') #removes all special characters, commas, and standalone letters, respectively.

words = clean_text.downcase.split.each_with_object(Hash.new(0)) do |word, count| 
  count[word] += 1 unless excluded_words.include? word
end

crutch_words = words.sort_by {|k, v| -v}.delete_if{|key,value| value <= 3}

puts(crutch_words.map{|k,v| k.to_s + ": " + v.to_s})
