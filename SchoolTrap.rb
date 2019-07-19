use_bpm 145


#ARP AND CHORD
#ARP AND CHORD taken from a stock example, then expanded upon with some randomness and harmonic tension
#ARP AND CHORD
def sad_lfo
  (ring 0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8).tick
end

live_loop :arp do
  use_synth [:dsaw,:square].choose
  play (scale [:e2,:e3].choose, :minor_pentatonic).tick, cutoff: rrand(20,100), amp: rrand(0,0.7), release: rrand(0.1,1)
  play (scale [:e4,:e3,:e3].choose, :minor_pentatonic), amp: rrand(0.1,1), release: rrand(0.1,1), cutoff: rrand(20,100)
  sleep 0.5
end

#BASS
#BASS plays 3 simple patterns in a loop
#BASS
define :bassline do
  3.times do
    use_synth :tri
    sleep 4
    play 28, amp: 3, attack: 0, sustain: 0.4, release: 1
    sleep 4
  end
  1.times do
    use_synth :tri
    sleep 3
    play 28, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 5
  end
  
  3.times do
    use_synth :tri
    sleep 4
    play 24, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 4
  end
  
  1.times do
    use_synth :tri
    sleep 4
    play 24, amp: 3, attack: 0, sustain: 0.4, release: 1
    sleep 1.5
    play 24, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 2.5
  end
end


live_loop :bass1, delay: 64 do
  play bassline
  sleep 96
  play bassline
  play bassline
  sleep 128
end



#KICKS
#KICKS has a 2nd accent loop that randomly plays with a 1 in 3 chance
#KICKS
def kick1(v)
  sample :bd_haus, amp: v, rate: 1.0
end

live_loop :kicks1, delay: 16 do
  kick1(2)
  sleep 3
  kick1(2)
  sleep 5
end

live_loop :kicks2, delay: 16 do
  sync :kicks1
  k = [0,0,1].choose
  case k
  when 0
    8.times do
      sleep 1
    end
  when 1
    1.times do
      sleep 0.5
      kick1(1.5)
      sleep 1.5
    end
  end
end

#SNARES
#SNARES defines multiple 8-beat loops as functions and then plays a repeating pattern of them
#SNARES
def snar(v)
  sample :drum_snare_hard, rate: 2, amp: v, attack: 0, decay: 0.3, sustain: 0, release: 0
  sample :drum_snare_soft, rate: [1.3,1.4,1.5].choose, amp: v
end

define :s0 do
  2.times do
    sleep 2
    snar(2)
    sleep 2
  end
end

define :s1 do
  1.times do
    sleep 2
    snar(2)
    sleep 1.5
    snar(1.5)
    sleep 2.5
    snar(2)
    sleep 2
  end
end

define :s2 do
  1.times do
    sleep 2
    snar(2)
    sleep 1.5
    snar(1.5)
    sleep 2.5
    snar(2)
    sleep 0.5
    snar(1)
    sleep 1.5
  end
end

define :s3 do
  1.times do
    sleep 2
    snar(2)
    sleep 1.5
    snar(1.5)
    sleep 1.5
    snar(1.2)
    sleep 0.5
    snar(1.5)
    sleep 2.5
  end
end

live_loop :snares1, delay: 32 do
  play [s0,s0,s1,s3,s0,s0,s1,s2]
end

#HI HATS
#HI HATS plays 1 of 4 patterns on a random basis with a straight 8th note pattern being the most likely.
#HI HATS has a rough triplet pattern and a 1/32 note pattern rith randomized pitch (rate) for a glitch effect
def hat(v,d,r)
  sample :drum_cymbal_closed, rate: r, amp: v, attack: 0, decay: d, sustain: 0, release: 0
end

live_loop :hats, delay: 64 do
  trips = [0,0,1,2,3].choose
  case trips
  when 0
    8.times do
      hat(1.4,0.04,1)
      sleep 0.5
    end
  when 1
    4.times do
      hat(1.2,0.02,1)
      sleep 0.25
      hat(1.3,0.01,1)
      sleep 0.25
    end
  when 2
    4.times do
      hat(1,0.01,rrand(0,1))
      sleep 0.125
      hat(0.8,0.02,rrand(0,1))
      sleep 0.125
    end
  when 3
    2.times do
      hat(1.3,0.03,1)
      sleep 0.32
      hat(1.4,0.01,1)
      sleep 0.32
      hat(1.3,0.02,1)
      sleep 0.36
    end
  end
end

#WEIRD ROLL
#WEIRD ROLL
#WEIRD ROLL
#with_fx :echo do
live_loop :weirdroll do
  sleep 144
  sample :drum_roll, rate: 3
  sleep 2
  sample :drum_roll, rate: 3
  sleep 2
  sample :drum_roll, rate: 3
  sleep 12
end
#end
