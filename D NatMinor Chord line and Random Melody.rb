#Based on example code found at https://sonic-pi.mehackit.org/exercises/en/04-generate-sounds/04-chord-progressions.html
#Key of Dm
bmp = 123
use_bpm bmp
#use_random_seed ????

chords = [(chord :d, :minor7), (chord :G, :minor7), (chord :F, :major7), (chord :A, :minor7), (chord :Bb, :major7), (chord :G, :minor7), (chord :E, "m7-5"), (chord :F, :major7),
          (chord :d, :minor7), (chord :G, :minor7), (chord :F, :major7), (chord :A, :minor7), (chord :C, "7", num_octaves: 2), (chord :Bb, :major7), (chord :G, :minor7), (chord :F, :major7)].ring
c = chords[0] # take the first chord of the ring and save it to a variable
# this is going to be used in all the live_loops. It will be .ticked by the :bass loop

with_fx :reverb, mix:0.6, amp: 0.8 do
  with_fx :slicer, mix:0.5 do
    live_loop :melody, delay:20 do
      use_synth :blade
      r = [0.25, 0.25, 0.5, 1,2,3].choose #This is an array of different sleep and release times. the values are used for both.
      play c.choose, attack: 0, release: r #THIS LINE chooses a note in the current chord to play
      sleep r
    end
  end
end

with_fx :echo, phase:0.5, mix:0.3 do
  with_fx :compressor, threshold:0.1 do
    with_fx :wobble do #Credit to J. Daniel for finding the Wobble effect
      live_loop :keys, delay:4 do
        use_synth :piano
        use_synth_defaults amp: 1.2, pan: rrand(-0.5,0.5) #this pans the sound randomly between speakers
        play c #THIS LINE plays the current chord in the array
        sleep 1
      end
    end
  end
end

live_loop :bass do
  use_synth :fm
  use_octave -2
  3.times do
    play c[0] # play the first note of the chord
    sleep 1
  end
  play c[1,3].choose # play the third or 4th note of the chord
  sleep 0.5
  if one_in(2)
    play c[2,1].choose # play the second note of the chord
  else
    play c[0], amp: 0
  end
  
  sleep 0.5
  c = chords.tick #THIS LINE is what moves through the array of chords at the top of the code
end


#THE DRUM BEAT
#THE DRUM BEAT
#THE DRUM BEAT

live_loop :kicker, delay: 36 do
  use_bpm bmp*4 #I speed up the BPM x4 to make sleep time calculations easier
  32.times do
    sample :drum_splash_hard, sustain: 0.1, decay:0.1, amp: 0.6, pan: -0.5
    sample :bd_haus, amp: 1.5
    sleep 6
    sample :drum_splash_hard, sustain: 0.15, decay:0.1, amp: 0.6, pan: 0.5
    sample :bd_haus, amp: 1.5
    sleep 4
    sample :bd_haus
    sleep 3
    sample :bd_haus
    sleep 3
  end
  sleep 128
end

use_random_seed 50
live_loop :snare, delay: 68 do
  32.times do
    use_bpm bmp*4 #I speed up the BPM x4 to make sleep time calculations easier
    sleep 4
    sample :sn_dolf, rate: 1.2
    sleep 8
    sample :sn_dolf, rate: 1.2
    sleep 3
    if one_in(4)
      sample :sn_dolf, rate: 1.3  #this snare only has a 1 in 4 odds of playing
      sample :sn_dolf, rate: -2, amp: 0.6 #this snare only has a 1 in 4 odds of playing
    end
    sleep 1
  end
  sleep 128
end

live_loop :amenLoop, delay: 100 do
  sample :loop_amen, beat_stretch: 4, amp: 0.5, pan: rrand(-0.8,0.8), rate: [1,1,1,1,1,-1,1,1,1].choose #random pan, beat stretch ... this was lazy but it works
  sleep 4
end
