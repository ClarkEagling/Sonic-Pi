# Welcome to Sonic Pi v3.1
#MIDI TRIGGERED PAD WITH RANDOM VOICES
#MIDI TRIGGERED PAD WITH RANDOM VOICES Sounds nice when trilled on 
#MIDI TRIGGERED PAD WITH RANDOM VOICES d,f,a,b,  then b,c, then g,a,c,e inverted chord
use_bpm 60
with_fx :reverb, room:0.5, pre_amp:1.5 do
  live_loop :midi_piano do
    use_real_time
    note, velocity = sync "/midi/mpkmini2/1/1/note_on"
    synth [:dsaw, :dpulse, :blade].choose, cutoff: rrand(80,120), note: note +[-12,0,12,24].choose, amp: velocity / 350.0, attack: 0.3, release: 3
    synth :piano, note: note+12, amp: velocity / 350.0, attack: 0.3
  end
  
  #DRUMS with MIDI CC CONTROLLED CUTOFF
  #DRUMS with MIDI CC CONTROLLED CUTOFF
  #DRUMS with MIDI CC CONTROLLED CUTOFF
  
  set :cutcc, 20
  live_loop :midi_cc do
    use_real_time
    _, amp = sync "/midi/mpkmini2/1/1/control_change"
    set :cutcc, amp
  end
  
  live_loop :snarem do
    use_real_time
    cutcc = get :cutcc
    sleep 0.5
    sample :drum_snare_soft, amp:3, rate:1.5, cutoff: cutcc
    sample :sn_dolf, amp:1, rate:1.5, cutoff: cutcc
    sleep 1.3
    sample :drum_snare_soft, amp:3, rate:1.5, cutoff: cutcc
    sleep 0.2
  end
  
  live_loop :kickem do
    sync :snarem
    use_real_time
    cutcc = get :cutcc
    sample :bd_haus, rate:1, amp:2, cutoff: cutcc
    sleep 1.5
    sample :bd_haus, rate:1, cutoff: cutcc
    sleep 0.5
  end
  
  def hat(v,d,r)
    use_real_time
    cutcc = get :cutcc
    sample :drum_cowbell, rate: r, amp: v, cutoff: cutcc, attack: 0, decay: d, sustain: 0, release: 0
  end
  
  live_loop :hats do
    sync :snarem
    
    trips = [0,1,2,3,4].choose
    case trips
    when 0
      8.times do
        hat(0.5,rrand(0.01,0.01),rrand(0.8,1.1))
        sleep 0.25
      end
    when 1
      4.times do
        hat(0.5,0.01,1)
        sleep 0.3
        hat(0.5,0.005,1)
        sleep 0.2
      end
    when 2
      4.times do
        hat(0.5,0.007,rrand(0.8,1))
        sleep 0.125
        hat(0.4,0.01,rrand(0.8,1))
        sleep 0.125
      end
    when 3
      2.times do
        hat(0.4,0.02,rrand(0.8,1.1))
        sleep 0.33
        hat(0.5,0.01,rrand(0.8,1.1))
        sleep 0.33
        hat(0.4,0.006,rrand(0.8,1.1))
        sleep 0.34
      end
      
    when 4
      1.times do
        hat(0.5,rrand(0.01,0.02),rrand(0.8,1.1))
        sleep 0.75
        hat(0.5,rrand(0.01,0.02),rrand(0.8,1.1))
        sleep 1.25
      end
    end
    
  end
  
end
