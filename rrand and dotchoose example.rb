use_bpm 300

with_fx :reverb, room: 1, mix: 1 do
  #.CHOOSE EXAMPLE -- this chooses from a list of notes and synths
  live_loop :notes do
    64.times do
      use_synth [:blade, :piano, :fm, :dsaw].choose
      play [:c3, :c4, :e3, :e4, :g3, :g4, :b4].choose, attack: rrand(0,3)
      sleep rrand(0.1,3)
    end
    64.times do
      use_synth [:blade, :piano, :fm, :dsaw].choose
      play [:f3, :f4, :a3, :a4, :c3, :c4, :e4].choose, attack: rrand(0,3)
      sleep rrand(0.1,3)
    end
  end
end

#RRAND EXAMPLE -- this makes wind chime sounds
live_loop :weirdBells do
  sample [:drum_cymbal_open, :drum_splash_soft].choose, rate: rrand(-2,2), pan: rrand(-1,1)
  sleep [1,2,4,8].choose
end



#drum beat
#drum beat
#drum beat

live_loop :weirdBells do
  sample [:drum_cymbal_hard,:drum_cymbal_closed].choose, rate: rrand(0.5,2), pan: rrand(-1,1)
  sleep [1,2,4].choose
end

live_loop :kick do
  sample :bd_808, amp: 10
sleep 4 end

live_loop :snar, delay: 32 do
  4.times do
    sleep 6
    sample :sn_dolf, rate: 2, amp: 10
    sleep 2
  end
  sleep 32
end

live_loop :metronome do
  sample :elec_plip, rate: 2
  sleep 2
  sample :elec_plip, rate: 1
  sleep 2
  sample :elec_plip, rate: 1
  sleep 2
  sample :elec_plip, rate: 1
  sleep 2
end

with_fx :bpf, centre:100 do
  live_loop :metronome2 do
    sleep 1
    sample :elec_plip, rate: 2, amp: 0.7
    sleep 2
    sample :elec_plip, rate: 1
    sleep 2
    sample :elec_plip, rate: 1
    sleep 2
    sample :elec_plip, rate: 1
    sleep 1
  end
end


#Things to remember:

# rrand needs a (number range)
# .choose needs an [array]
