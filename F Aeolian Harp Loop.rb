# This loop selects notes from the F Aeolian mode to be played by 3 instances of a harp-like plucking FM synth
# The harp phrases are 3/4 "triplets" over a 4/4 beat

#reverb on the whole loop
use_bpm 64
with_fx :reverb, room:1, pre_amp:2 do
  #three part string pluck harmony
  in_thread(name: :barny) do
    loop do
      8.times do
        sleep 1
      end
      
      8.times do
        use_synth :pluck
        
        if one_in(2)
          play choose([:Ds4, :Fs4, :Gs4, :F4]), pan: rrand(-0.7,-0.1)
          sleep 0.165
          play choose([:Ds4, :Fs4, :Gs4, :F4]), pan: rrand(-0.7,-0.1)
          sleep 0.165
          play choose([:Ds4, :Fs4, :Gs4, :F4]), pan: rrand(-0.7,-0.1)
          sleep 0.33
          play choose([:Ds4, :Fs4, :Gs4, :F4]), pan: rrand(-0.7,-0.1)if one_in(2)
            sleep 0.34
            
          else
            
            play choose([:F3, :As4, :C4, :Cs4]), pan: rrand(-0.7,-0.1)
            sleep 0.33
            play choose([:F3, :As4, :C4, :Cs4]), pan: rrand(-0.7,-0.1)
            sleep 0.165
            play choose([:F3, :As4, :C4, :Cs4]), pan: rrand(-0.7,-0.1)
            sleep 0.165
            play choose([:F3, :As4, :C4, :Cs4]), pan: rrand(-0.7,-0.1) if one_in(2)
            sleep 0.34
          end
          sleep [1,2,4].choose
        end
      end
      
    end
    
    in_thread(name: :barny2) do
      loop do
        12.times do
          sleep 1
        end
        
        12.times do
          use_synth :pluck
          
          if one_in(2)
            play choose([:Ds5, :Fs5, :Gs5, :F5]), amp: 1.3, pan: rrand(0.7,0.1)
            sleep 0.165
            play choose([:Ds4, :Fs4, :Gs4, :F4]), amp: 1.3, pan: rrand(0.7,0.1)
            sleep 0.165
            play choose([:Ds5, :Fs5, :Gs5, :F5]), amp: 1.3, pan: rrand(0.7,0.1)
            sleep 0.33
            play choose([:Ds4, :Fs4, :Gs4, :F4]), amp: 1.3, pan: rrand(0.7,0.1) if one_in(2)
            sleep 0.34
            
          else
            
            play choose([:F4, :As5, :C5, :Cs5]), amp: 1.3, pan: rrand(0.7,0.1)
            sleep 0.33
            play choose([:F3, :As4, :C4, :Cs4]), amp: 1.3, pan: rrand(0.7,0.1)
            sleep 0.165
            play choose([:F4, :As5, :C5, :Cs5]), amp: 1.3, pan: rrand(0.7,0.1)
            sleep 0.165
            play choose([:F3, :As4, :C4, :Cs4]), amp: 1.3, pan: rrand(0.7,0.1) if one_in(2)
            sleep 0.34
          end
          sleep 1
          #sleep [1,3].choose #CHANGING BACK TO ONE GETS RID OF A LOT OF THE RANDOM FEEL
        end
      end
    end
    
    #this highest octave can play runs beyond the others
    
    in_thread(name: :barny3) do
      loop do
        12.times do
          sleep 1
        end
        
        8.times do
          use_synth :blade
          a=1.4
          
          if one_in(2)
            sleep 0.5 if one_in(2)
            play choose([:Ds6, :Fs6, :Gs6, :F6]), amp: a, pan: rrand(-0.5,0.5)
            sleep 0.165
            play choose([:Ds6, :Fs6, :Gs6, :F6]), amp: a, pan: rrand(-0.5,0.5)
            sleep 0.165
            play choose([:Ds6, :Fs6, :Gs5, :F5]), amp: a, pan: rrand(-0.5,0.5)
            sleep 0.33
            play choose([:Ds5, :Fs5, :Gs6, :F6]), amp: a, pan: rrand(-0.5,0.5) if one_in(2)
            sleep 0.34
            
          else
            sleep 0.5 if one_in(2)
            play choose([:F5, :As6, :C6, :Cs6]), amp: a, pan: rrand(-0.5,0.5)
            sleep 0.33
            play choose([:F5, :As6, :C5, :Cs5]), amp: a, pan: rrand(-0.5,0.5)
            sleep 0.165
            play choose([:F5, :As6, :C6, :Cs6]), amp: a, pan: rrand(-0.5,0.5)
            sleep 0.165
            play choose([:F6, :As6, :C5, :Cs5]), amp: a, pan: rrand(-0.5,0.5) if one_in(2)
            sleep 0.34
          end
          sleep [1,2,4].choose
        end
      end
    end
    
    
    #Bassline with quasi-random pause between phrases
    
    in_thread(name: :barnybass) do
      loop do
        8.times do
          use_synth :chipbass
          3.times do
            if one_in(2)
              play choose([:Ds3, :Fs3, :Gs2, :F3]), cutoff: 55, amp: 1, release: rrand(0.45, 0.55)
              sleep 0.5
              play choose([:Ds3, :Fs2, :Gs3, :F2]), cutoff: 60, amp: 1, release: rrand(0.45, 0.55)
              sleep 0.5
              play choose([:Ds2, :Fs3, :Gs2, :F2]), cutoff: 44, amp: 1, release: 0.7 if one_in(2)
              sleep 0.5
            else
              
              play choose([:F3, :As2, :C3, :Cs2]), cutoff: 44, amp: 1, release: rrand(0.45, 0.55)
              sleep 0.5
              play choose([:F3, :As3, :C2, :Cs3]), cutoff: 55, amp: 1, release: rrand(0.45, 0.55)
              sleep 0.5
              play choose([:F3, :As2, :C3, :Cs3]), cutoff: 66, amp: 1, release: 0.7 if one_in(2)
              sleep 0.5
            end
            if one_in(2)
              sleep 0.5
            else
              sleep 1
              
            end
            
          end
          sleep 2
        end
        8.times do
          use_synth :tb303
          3.times do
            sleep 0.5
            if one_in(2)
              play choose([:Ds2, :Fs3, :Gs1, :F3]), cutoff: 55, amp: 0.3, release: rrand(0.45, 0.55)
              sleep 0.5
              play choose([:Ds3, :Fs2, :Gs3, :F2]), cutoff: 60, amp: 0.25, release: rrand(0.45, 0.55)
              sleep 0.5
              play choose([:Ds2, :Fs3, :Gs2, :F2]), cutoff: 44, amp: 0.3, release: 0.7 if one_in(2)
              sleep 0.5
            else
              
              play choose([:F2, :As1, :C3, :Cs2]), cutoff: 44, amp: 0.3, release: rrand(0.45, 0.55)
              sleep 0.5
              play choose([:F2, :As3, :C2, :Cs3]), cutoff: 55, amp: 0.25, release: rrand(0.45, 0.55)
              sleep 0.5
              play choose([:F2, :As2, :C2, :Cs2]), cutoff: 66, amp: 0.25, release: 0.7 if one_in(2)
              sleep 0.5
            end
            if one_in(2)
              sleep 0.5
            else
              sleep 1
              
            end
            
          end
          sleep 2.5
        end
      end
    end
    
    #simple beat
    
    in_thread(name: :bdbeat) do
      loop do
        32.times do
          sleep 1
        end
        24.times do
          sample :bd_fat, amp:3.5
          sleep 0.33
          sample :bd_fat, amp:2
          sleep 0.33
          sample :bd_fat, amp:1
          sleep 0.34
          sample :bd_fat, amp:1
          sleep 0.33
          sample :bd_fat, amp:3.5
          sleep 0.33
          sample :bd_fat, amp:1.5
          sleep 0.34
        end
        
      end
    end
    
    in_thread(name: :bboom) do
      loop do
        24.times do
          sleep 1
        end
        20.times do
          sleep 0.33
          sample :bd_boom, rate: 0.945, amp: 1 #Big Boom Kick
          sleep 1.67
        end
        
      end
    end
    
    in_thread(name: :snare) do
      loop do
        16.times do
          sleep 1
        end
        56.times do
          sleep 1
          sample :drum_snare_soft, amp:3
          sleep 0.33
          # sample :drum_snare_soft, amp:0.5
          sleep 0.33
          sample :drum_snare_soft, amp:0.5
          sleep 0.34
        end
      end
    end
    
    #cymbals that wait to come in
    in_thread(name: :tickz) do
      loop do
        8.times do
          sleep 4
        end
        16.times do
          sample :drum_cymbal_soft, amp: 0.5, pan: -0.4
          sleep 0.5
          sample :drum_cymbal_soft, amp: 0.6, pan: -0.4
          sleep 0.5
          
        end
        16.times do
          sample :drum_cymbal_soft, amp: 0.5, pan: -0.4
          sleep 0.33
          sample :drum_cymbal_soft, amp: 0.5, pan: -0.4
          sleep 0.33
          sample :drum_cymbal_soft, amp: 0.5, pan: -0.4
          sleep 0.34
        end
        
      end
    end
    #HI HATS
    #HI HATS plays 1 of 4 patterns on a random basis with a straight 8th note pattern being the most likely.
    #HI HATS has a rough triplet pattern and a 1/32 note pattern rith randomized pitch (rate) for a glitch effect
    def hat(v,d,r)
      sample :drum_cymbal_closed, rate: r, amp: v, attack: 0, decay: d, sustain: 0, release: 0
    end
    
    live_loop :hats, delay: 128 do
      trips = [0,1,2,3,4].choose
      case trips
      when 0
        8.times do
          hat(1,rrand(0.01,0.05),rrand(0.8,1.1))
          sleep 0.5
        end
      when 1
        4.times do
          hat(1,0.02,1)
          sleep 0.35
          hat(0.9,0.01,1)
          sleep 0.15
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
          hat(1,0.03,rrand(0.8,1.1))
          sleep 0.33
          hat(1.1,0.01,rrand(0.8,1.1))
          sleep 0.33
          hat(1,0.02,rrand(0.8,1.1))
          sleep 0.34
        end
        
      when 4
        1.times do
          hat(1,rrand(0.01,0.05),rrand(0.8,1.1))
          sleep 2
        end
      end
      
    end
    
    
    #WEIRD ROLL
    #WEIRD ROLL
    #WEIRD ROLL
    with_fx :echo do
      live_loop :weirdroll do
        sleep 144
        sample :drum_roll, rate: 3
        sleep 2
        sample :drum_roll, rate: 3
        sleep 14
      end
    end
  end