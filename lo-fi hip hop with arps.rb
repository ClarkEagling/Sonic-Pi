#SLEEPY ARPS
#SLEEPY ARPS
#SLEEPY ARPS

with_fx :hpf, cutoff: 70 do
  live_loop :blag, delay:16 do
    with_synth :dsaw do
      s = play 60, amp: 0.8, release: 5, cutoff: rrand(1,100), note_slide: 0.1
      sleep 0.5
      control s, note: [62,63].choose
      sleep 0.5
      control s, note: [62,63].choose
      sleep 0.5
      control s, note: 67
      sleep 0.5
    end
  end
  
  live_loop :blag2, delay:32 do
    sync :blag
    with_synth :dpulse do
      if one_in(2)
        s = play 60, amp: 0.6, release: 5, cutoff: rrand(1,90), note_slide: 0.1
        sleep 0.5
        control s, note: 65
        sleep 1
        control s, note: 70
        sleep 0.5
      else
        sleep 2
      end
      
    end
  end
end

#CYMBALS
#CYMBALS
#CYMBALS

with_fx :hpf, cutoff: 60 do
  live_loop :cym do
    sample [:drum_cymbal_hard,:drum_cymbal_soft].choose, rate: rrand(0.95,1.05), amp: rrand(0.4,0.8), attack: 0, decay: rrand(0.1,1), sustain: 0, release: 0
    sleep [0.125,0.25].choose
  end
  live_loop :cym2 do
    sample [:drum_cymbal_hard,:drum_cymbal_soft].choose, rate: rrand(0.95,1.05), amp: rrand(0.3,0.6), attack: 0, decay: rrand(0.1,1), sustain: 0, release: 0
    sleep [0.25,0.5,0.75].choose
  end
end

#KICKS
#KICKS
#KICKS

live_loop :kickerz do
  sync :blag
  sample :bd_fat, amp: 2.5
  sample :bd_boom, rate: 0.9
  sleep [0.5,0.75].choose
  sample :bd_fat, amp: 2
  sleep 0.5
end

#SNARES
#SNARES
#SNARES

live_loop :snarez do
  sleep 1
  sample :drum_snare_hard, rate: 1.5, amp: 2
  sample :drum_snare_soft, amp: 3
  sleep 1
end

live_loop :snarezAccent1 do
  if one_in(3)
    sleep 3.75
    sample :drum_snare_soft, amp: 3
    sleep 0.25
  else
    sleep 4
  end
end
live_loop :snarezAccent2 do
  if one_in(3)
    sleep 3.25
    sample :drum_snare_soft, amp: 3
    sleep 0.75
  else
    sleep 4
  end
end
