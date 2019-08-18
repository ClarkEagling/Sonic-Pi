# THE LFOs
# THE LFOs
# THE LFOs

def sad_lfo
  (ring 0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8).tick
end
def sad_lfo2
  (ring 0.15,0.25,0.35,0.45,0.55,0.65,0.75,0.85,0.95).tick
end
def sad_lfo3
  (ring 0.015,0.025,0.035,0.045,0.055,0.065,0.075,0.085,0.095,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1).tick
end

#THE BEAT LOOPS
#THE BEAT LOOPS
#THE BEAT LOOPS

with_fx :bitcrusher, bits:8, pre_amp:1.5 do
  live_loop :LFOhat do
    sample :drum_cymbal_closed, rate: sad_lfo, amp: sad_lfo2, attack: 0, decay: sad_lfo3, sustain: 0, release: 0
    sleep 0.25
  end
  live_loop :LFOhat2, delay:32 do
    sleep 0.125
    sample :drum_cymbal_closed, rate: sad_lfo2, amp: sad_lfo, attack: 0, decay: sad_lfo3, sustain: 0, release: 0
    sleep 0.125
  end
  
  live_loop :kick do
    sample :bd_haus, amp: (ring 0.5, 1).tick
    sleep 0.5
  end
  
  live_loop :kickAccent do
    sleep 1.9
    sample :bd_haus, amp: (ring 0.5, 0.6).tick(:slo)
    sleep 0.05
    sample :bd_haus, amp: (ring 0.0, 0.4).tick(:fas), rate: 2
    sleep 0.05
  end
  with_fx :hpf, cutoff: 90 do
    live_loop :hatsY do
      sleep 0.3
      sample :elec_plip, amp: sad_lfo, rate: 1.2, pan: 0.5
      sleep 0.7
    end
    
    live_loop :hatsAccent do
      sleep 0.25
      sample :elec_tick, rate: 1, amp: sad_lfo, pan: -0.5
      sleep 0.25
    end
  end
end


#THE BASS
#THE BASS
#THE BASS
define :bassline do
  2.times do
    use_synth :dsaw
    sleep 6
    play 30, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 8
    play 30, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 8
    play 30, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 6
    play 30, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 12
  end
  
  3.times do
    use_synth :dtri
    sleep 6
    play 24, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 8
    play 24, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 2
  end
  
  2.times do
    use_synth :dtri
    sleep 4
    play 24, amp: 3, attack: 0, sustain: 0.4, release: 1
    sleep 1.5
    play 24, amp: 3, attack: 0, sustain: 0.4, release: 1.5
    sleep 2.5
  end
end

with_fx :distortion, pre_amp:1.7, distort:0.6, amp: 0.2 do
  with_fx :bitcrusher, bits: 2, pre_amp: 2 do
    live_loop :bass1, delay: 32 do
      play bassline
      sleep 32
      
    end
  end
end
