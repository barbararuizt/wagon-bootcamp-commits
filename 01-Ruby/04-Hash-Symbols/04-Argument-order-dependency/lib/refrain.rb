def refrain(lyrics, number_of_times = 1, vibrato = 0, strong = false)
  song_refrain = [] # reates new array
  lyrics += lyrics[lyrics.size - 1] * vibrato # takes last item and multiplies it
  lyrics.upcase! if strong # upcases if strong is true

  number_of_times.times do # multiplies the whole thing, iterates the amount of times
    song_refrain << lyrics
  end

  song_refrain.join(" ") # joins array into string
end

def better_refrain(lyrics, options = { vibrato: 0, number_of_times: 1, strong: false })
  # TODO: implement this better version which breaks argument order dependency
  song = []
  lyrics += lyrics[-1] * options[:vibrato]
  lyrics.upcase! if options[:strong]

  options[:number_of_times].times { song << lyrics }

  song.join(" ")
end
