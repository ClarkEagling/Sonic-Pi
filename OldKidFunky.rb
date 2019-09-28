#https://github.com/samaaron/sonic-pi/blob/master/etc/doc/cheatsheets/synths.md
#https://github.com/samaaron/sonic-pi/blob/master/etc/doc/cheatsheets/fx.md
use_bpm 500
live_loop :foomp do
  co = (line 30, 130, steps: 16).tick
  with_fx :hpf, cutoff: 40 do
    with_fx :distortion do
      sample :drum_bass_hard, rate: rrand(0.81,1.11), cutoff: co
      sleep 6
      #sample :drum_bass_hard, rate: rrand(0.81,1.11), cutoff: co
      sleep 10
      sample :drum_bass_hard, rate: rrand(0.81,1.11), cutoff: co
      sleep 6
      sample :drum_bass_hard, rate: rrand(0.81,1.11), cutoff: co
      sleep 4
      sample :drum_bass_hard, rate: rrand(0.81,1.11), cutoff: co
      sleep 6
    end
  end
end

live_loop :kick do
  sample :bd_haus, rate: 1
  sleep 32
  sample :bd_haus, rate: 1
  sleep 16
  sample :bd_haus, rate: 1
  sleep 6
  sample :bd_haus, rate: 0.8
  sleep 4
  sample :bd_haus, rate: 0.8
  sleep 6
end

live_loop :snare do
  sync :foomp
  sleep 8
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

live_loop :bass, delay:256 do
  16.times do
    cb = (line 30, 130, steps: 32).tick
    cd = (line -4, 4, steps: 16).tick
    cdd = (line 3, -2, steps: 10).tick
    use_synth_defaults cutoff: cb, depth: cd, divisor: cdd
    use_synth :fm
    play :c3
    sleep 5
    play :c2
    sleep 5
    play :f3
    sleep 3
    play :f2
    sleep 3
  end
  16.times do
    sleep 16
  end
end

live_loop :bladers do
  2.times do
    sleep 256
  end
  4.times do
    with_fx :hpf, cutoff: 88 do
      with_fx :echo, mix: 0.5, phase: 6, decay:16 do
        with_fx :reverb, room: 0.8 do
          use_synth :blade
          use_synth_defaults attack: rrand(8,16), sustain: 2, decay: rrand(2,6), release: rrand(2,6), vibrato_rate: rrand(1,12), vibrato_depth: rrand(0.15,1), amp: 0.5
          sleep 44
          play :a4
          sleep 2
          play :e5
          sleep 18
        end
      end
    end
  end
end
