#https://github.com/samaaron/sonic-pi/blob/master/etc/doc/cheatsheets/synths.md
#https://github.com/samaaron/sonic-pi/blob/master/etc/doc/cheatsheets/fx.md
use_bpm 500
live_loop :foomp do
  co = (line 30, 130, steps: 16).tick
  with_fx :hpf, cutoff: 40 do
    with_fx :distortion do
      sample :drum_bass_hard, rate: rrand(1.81,1.11), cutoff: co
      sleep 6
      #sample :drum_bass_hard, rate: rrand(0.81,1.11), cutoff: co
      sleep 10
      sample :drum_bass_hard, rate: rrand(2.81,1.11), cutoff: co
      sleep 6
      sample :drum_bass_hard, rate: rrand(1.81,1.11), cutoff: co
      sleep 4
      sample :drum_bass_hard, rate: rrand(2.81,1.11), cutoff: co
      sleep 6
    end
  end
end

live_loop :kick do
  sample :bd_haus, rate: 1
  sleep 32
  sample :bd_haus, rate: 1
  sleep 16
  sample :bd_haus, rate: 1.5
  sleep 6
  sample :bd_haus, rate: 1.2
  sleep 4
  sample :bd_haus, rate: 0.8
  sleep 6
end

live_loop :snare, delay: 128 do
  sleep 8
  sample :sn_dolf, rate: 1.7
  sleep 16
  sample :sn_dolf, rate: 1.7
  sleep 16
  sample :sn_dolf, rate: 1.7
  sleep 16
  sample :sn_dolf, rate: 1.7
  sleep 4
  sample :sn_dolf, rate: 1.7
  sleep 4
end

live_loop :snarez do
  sleep 250
  sample :sn_dolf, rate: 1.7, amp: 0.5
  sleep 0.57
  sample :sn_dolf, rate: 1.7, amp: 0.5
  sleep 0.77
  sample :sn_dolf, rate: 1.7, amp: 0.5
  sleep 2.66
  sample :sn_dolf, rate: 1.7, amp: 0.5
  sleep 2
end

live_loop :pianosting do
  sync :foomp
  1.times do
    sleep 32
  end
  1.times do
    sleep 6
    with_fx :gverb do
      sample :bd_haus, rate: 1
    end
    sleep 26
  end
end

with_fx :bpf, res: 0.8, amp: 0.7 do
  live_loop :glitchbasso, delay:256 do
    16.times do
      cb = (line 30, 130, steps: 32).tick
      cd = (line -4, 4, steps: 16).tick
      cdd = (line 3, -2, steps: 10).tick
      use_synth_defaults cutoff: cb, decay: 0.5, amp: 0.75, depth: cd, divisor: cdd
      use_synth :fm
      play :e4
      sleep 5
      play :b3
      sleep 5
      play :c4
      sleep 3
      play :g3
      sleep 3
    end
    16.times do
      sleep 16
    end
  end
end

live_loop :bladers do
  2.times do
    sleep 256
  end
  6.times do
    with_fx :hpf, cutoff: 88 do
      with_fx :echo, mix: 0.5, phase: 6, decay:16 do
        with_fx :slicer, phase: 4 do
          with_fx :panslicer, wave: 2, phase: 12 do
            with_fx :reverb, room: 0.8 do
              use_synth :blade
              use_synth_defaults attack: rrand(8,16), sustain: 2, decay: rrand(2,6), release: rrand(2,6), vibrato_rate: rrand(1,12), vibrato_depth: rrand(0.15,1), amp: 0.5
              sleep 44
              play :a4
              sleep 2
              play :e5
              sleep 22
            end
          end
        end
      end
    end
  end
end

live_loop :wtd do
  1.times do
    sleep 512
  end
  32.times do
    use_sample_defaults amp: 0.3
    sample :elec_pop
    sleep 1
    sample :elec_beep
    sleep 1
    sample :elec_blip
    sleep 1
    sample :elec_flip
    sleep 1
    sample :elec_twip, rate: 1.5
    sleep 1
    sample :elec_plip
    sleep 1
  end
end

#The Sad Bit
#The Sad Bit
#The Sad Bit

with_fx :reverb, room: 1, amp: 0.8 do
  live_loop :melody do
    use_synth :piano
    2.times do
      play_pattern_timed [:e3, :b3, :g3, :d4,:e3, :b3, :g3, :d4, :f3], [8,4,4,16,8,4,4,12,4], attack: 1
    end
    sleep 96
  end
end

with_fx :reverb, room: 1, amp:0.25 do
  live_loop :melody2 do
    use_synth :dtri
    2.times do
      sleep 0.3
      play_pattern_timed [:e4, :b4, :c5, :d5,:e4, :b4, :e5, :d5, :f4], [8,4,4,16,8,4,4,12,4], decay: 0.2, sustain: 0.2, release: 1
    end
    sleep 95.7
  end
end

with_fx :echo, phase: 2.5, mix: 0.2 do
  with_fx :distortion, amp: 0.7 do
    live_loop :bass, delay: 128 do
      use_synth :fm
      32.times do
        play :e2, release: 2
        sleep 4
      end
      32.times do
        play :f2, release: 2
        sleep 4
      end
      26.times do
        play :a2, release: 2
        sleep 5
      end
      21.times do
        play :d2, release: 2
        sleep 6
      end
    end
  end
end

with_fx :reverb, room: 1, mix: 1 do
  with_fx :hpf, cutoff: 80 do
    live_loop :higher_thing do
      use_synth :piano
      sleep 66
      play_pattern_timed [:d4,:e4,:g4],[6,6,18], cutoff: 90, attack: 0.3
    end
  end
end

