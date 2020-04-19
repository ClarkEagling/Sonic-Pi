use_bpm 666 #I chose 666 bpm just cause it was easy for my math-bad brain to
#split into 3rds for triplets. wasn't trying to be edgy. sry 2 anyone who cares.
use_debug false

with_fx :compressor, mix:0.6 do
  in_thread do
    live_loop :kicker do
      16.times do
        sample :bd_haus, rate: rrand(0.9,1.1), lpf: rrand(40,110)
        sleep 12
      end
      64.times do
        a = [2,4,6,8].choose
        sample :bd_haus, rate: rrand(0.9,1.1), lpf: rrand(50,110)
        sleep a
      end
    end
    
    with_fx :pitch_shift, pitch: 12, mix: 0.23 do
      
      live_loop :snare, delay: 64 do #delay 64
        16.times do
          sleep 8
          sample :sn_dolf, rate: rrand(1.9,2.1), lpf: rrand(90,130)
          sample :sn_dub, rate: 2, lpf: rrand(30,120)
          sleep 8
        end
        8.times do
          sleep 8
          sample :sn_dolf, rate: rrand(1.9,2.1), lpf: rrand(90,130)
          sample :sn_dub, rate: 2, lpf: rrand(30,120)
          sleep 16
          sample :sn_dolf, rate: rrand(1.9,2.1), lpf: rrand(90,130)
          sample :sn_dub, rate: rrand(1.9,2.1), lpf: rrand(30,120)
          sleep 6
          sample :sn_dolf, rate: rrand(1.9,2.1), lpf: rrand(90,130)
          sample :sn_dub, rate: rrand(1.9,2.1), lpf: rrand(30,120)
          sleep 2
        end
        8.times do
          sleep 8
          sample :sn_dolf, rate: rrand(1.9,2.1), lpf: rrand(90,130)
          sample :sn_dub, rate: rrand(1.9,2.1), lpf: rrand(30,120)
          sleep 8
        end
        8.times do
          sleep 16
        end
      end
      
      live_loop :chick do
        sample :elec_snare, rate: 3, attack:0.2, amp: [1,0].choose
        sleep 4
        sample :elec_snare, rate: 2.85, attack:0.1, amp: 0.8
        sleep 4
      end
      
      live_loop :chick2 do
        sleep 2
        sample :elec_fuzz_tom, rate: 3, attack:0.2
        sleep 4
        sample :elec_fuzz_tom, rate: 2.85, attack:0.1, amp: [0.7,0].choose
        sleep 2
      end
      
      
      live_loop :hat, delay: 512 do
        256.times do
          sample :drum_cymbal_closed, rate: 6, pan: -0.3,  amp: [0.3,0.6,1].choose
          sleep 1
          sample :drum_cymbal_closed, rate: 5.85, pan: -0.3, amp: 0.8
          sleep 1
        end
        sleep 512
      end
      
      live_loop :hat2, delay: 512 do
        512.times do
          sample :drum_cymbal_closed, rate: 5, attack:0.02,  pan: -0.3
          sleep 1
          sample :drum_cymbal_closed, rate: 4.85, attack:0.02, pan: -0.3,  amp: [0,0.4,0.7].choose
          sleep 1
        end
        sleep 256
      end
      
      use_random_seed 2222
      
      with_fx :reverb, room:1, mix: 0.5 do
        live_loop :beat_slicer, delay: 128 do #delay 128
          slice_idx = rand_i(64)
          slice_size = 0.015625
          s = slice_idx * slice_size
          f = s + slice_size
          sample "C:/Users/Clark/Documents/Sonic Pi/Nanoloop Samples/NanoPi2.wav", start: s, finish: f, rate: [0.5,0.75,1,1.5].choose, amp: rrand(0.5,1), attack: rrand(0,0.2), pan: rrand(-1,1), lpf: rrand(40,130)
          sleep [8,16,24,32].choose
          #sleep sample_duration "C:/Users/Clark/Documents/Sonic Pi/Nanoloop Samples/NanoPi2.wav", start: s, finish: f
        end
      end
      
      use_random_seed 3030
      
      live_loop :beat_slicer2, delay: 64 do #delay 64
        slice_idx = rand_i(64)
        slice_size = 0.015625
        s = slice_idx * slice_size
        f = s + slice_size
        with_fx :gverb, room:rrand(1,100), mix: 0.5 do #The ever-changing room size on this reverb is probably my fave discovery in making this patch
          with_fx :wobble, phase:rrand(0.03,0.66) do
            sample "C:/Users/Clark/Documents/Sonic Pi/Nanoloop Samples/NanoPi2.wav", start: s, finish: f, rate: [0.5,0.75,1].choose, amp: rrand(0.5,0.8), attack: rrand(0,0.2), pan: rrand(-1,1), hpf: rrand(40,119)
            sleep [12,16,20,24,28,40].choose
            #sleep sample_duration "C:/Users/Clark/Documents/Sonic Pi/Nanoloop Samples/NanoPi2.wav", start: s, finish: f
          end
        end
      end
      
    end
    
    use_random_seed 1221
    with_fx :reverb, room:0.8, mix: 0.4 do
      live_loop :bass303, delay: 256 do #delay 256
        use_synth :tb303
        sleep 4
        18.times do
          use_synth_defaults wave: [0,1].choose #This chooses between a square and saw wave on this 303 emulation
          if one_in(2)
            play choose([:Ds1, :Fs2, :Gs1, :F2]), cutoff: rrand(55,70), amp: 1, release: rrand(2, 4)
            sleep [2,4].choose
            play choose([:Ds2, :Fs1, :Gs2, :F1]), cutoff: rrand(70,88), amp: 1, release: rrand(2, 4) if one_in(2)
            sleep [2,4,6].choose
            play choose([:Ds1, :Fs2, :Gs1, :Ds2]), cutoff: rrand(66,80), amp: 1, release: 6
            sleep 4
          else
            play choose([:F1, :As1, :C2, :Cs1]), cutoff: rrand(55,70), amp: 1, release: rrand(1.5, 4)
            sleep 2
            play choose([:F1, :Ds2, :C1, :Cs2]), cutoff: rrand(66,80), amp: 1, release: rrand(2, 6) if one_in(2)
            sleep [2,4].choose
            play choose([:F1, :As0, :C1, :Cs2]), cutoff: rrand(77,100), amp: 1, release: 4 if one_in(2)
            sleep [2,4,6].choose
            play choose([:F1, :As0, :C1]), cutoff: rrand(77,100), amp: 1, release: 4 if one_in(2)
          end
          sleep [2,6,8,12,16,24,32].choose
        end
        sample :elec_cymbal, rate: 0.9, cutoff: 110
        sleep 256
      end
    end
  end 
end

#that's all, folks. It's working on randomization and random choice from arrays,
#so it'll keep doing weird shit for forever.
#anyway, this is less than 110 lines of code. made it in probably an hour and a half
#today. Plus the time spent on generating sounds in Nanoloop, which was like 10 minutes while falling asleep.
#anyone looking into learning coding, I'd highly recommend Sonic Pi as a good start.