use_bpm 665

with_fx :reverb, mix: 0.6 do
  live_loop :rightHand do
    use_synth :piano
    
    #play (ring , ).tick, release: 10 #this switches the first note every loop
    
    play_pattern_timed [:gb4,:a4,:cs5,:a4,:gb4,:d4,:d4,:d4],[4,2,4,4,2,2,2,10]#, sustain:0.3
    play_pattern_timed [:db4,:d4,:gb4,:a4,:cs5,:a4,:gb4,:e5,:ds5,:d5],[2,2,2,2,4,4,2,6,2,8]#, sustain:0.3
    play_pattern_timed [:gs4,:cs5,:gb4,:cs5,:gs4,:cs5,:g4,:gb4,:e4],[4,2,4,4,4,4,2,4,4]#, sustain:0.3
    2.times do
      3.times do
        play [:c3,:e4], release: 10, amp: 1.7 #this plays the chord at the end of the loop
        sleep 2
      end
      sleep 6
    end
    play_pattern_timed [:ds4,:d4],[4,4]
    
    play_pattern_timed [:cs4, :a4,:cs5,:a4,:gb4,:d4,:d4,:d4],[4,2,4,4,2,2,2,10]#, sustain:0.3
    play_pattern_timed [:db4,:d4,:gb4,:a4,:cs5,:a4,:gb4,:cs5,:b4],[2,2,2,2,4,4,2,8,8]#, sustain:0.3
    play_pattern_timed [:b4,:g4,:d4,:cs4,:b4,:g4,:cs4,:a4,:gb4,:c4,:b3,:f4,:d4,:b3],[2,2,2,4,2,2,2,2,2,2,4,2,2,2]
    3.times do
      play [:cs4,:e4], release: 10, amp: 1.7 #this plays the chord at the end of the loop
      sleep 2
    end
    sleep 8
    play_pattern_timed [:as4,:b4,:cs5,:d5,:gb5,:a5],[2,2,2,2,2,8]
  end
  
  live_loop :rhAccents do
    use_synth :piano
    sleep 152
    play_pattern_timed [:e5,:e5,:e5],[2,2,2]
    sleep 152
  end
end

live_loop :kick do
  sample :bd_klub
  sleep 6
  sample :bd_klub
  sleep 6
  sample :bd_klub
  sleep 6
  sample :bd_klub
  sleep 6
  sample :bd_klub
  sleep 4
  sample :bd_klub
  sleep 4
end

live_loop :snare do
  sleep 8
  sample :sn_dolf, rate: 2.6
  sleep 8
end

#end
#end
#end
#end

live_loop :metronome do
  sample :elec_plip, rate: 2
  sleep 4
  sample :elec_plip, rate: 1
  sleep 4
  sample :elec_plip, rate: 1
  sleep 4
  sample :elec_plip, rate: 1
  sleep 4
end

with_fx :bpf, centre:100 do
  live_loop :metronome2 do
    sleep 2
    sample :elec_plip, rate: 2
    sleep 4
    sample :elec_plip, rate: 1
    sleep 4
    sample :elec_plip, rate: 1
    sleep 4
    sample :elec_plip, rate: 1
    sleep 2
  end
end
