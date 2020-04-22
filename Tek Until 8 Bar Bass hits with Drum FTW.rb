#Global Variables for instruments and note arrays can be created and accessed with "set" and "get"

use_bpm 500
use_random_seed 2099


#Snare
#Snare
#Snare

define :snareMaker do
  a=[0,0.7,1]
  b=a.choose
  c=a.choose
  d=a.choose
  e=a.choose
  snareline=[b,c,d,e]
  
  
  2.times do
    4.times do
      #print timeFixer
      x=snareline.tick(:tickd)
      sleep 4
      sample :sn_dolf, amp:x, rate: rrand(1.9,2.2)
      sample :sn_generic, amp:x*0.4, rate: rrand(1.9,2.2)
      sleep 4
    end
  end
end

live_loop :snarePlayer do
  snareMaker
end

#Kick and Bassline
#Kick and Bassline
#Kick and Bassline


define :kickMaker do
  a=[4,8,2]
  timeFixer = 0
  until timeFixer == 32
    b=a.choose
    c=a.choose
    d=a.choose
    e=a.choose
    f=a.choose
    g=a.choose
    h=a.choose
    timeFixer=b+c+d+e+f+g+h
  end
  kickline=[b,c,d,e,f,g,h]
  
  aa = [24,26,28,29,31,33,35,
        36,38,40,41,43,45,47,
        48,50,52,53,55]
  ba=aa.choose
  ca=aa.choose
  da=aa.choose
  ea=aa.choose
  fa=aa.choose
  ga=aa.choose
  ha=aa.choose
  bassline=[ba,ca,da,ea,fa,ga,ha]
  
  
  4.times do
    
    7.times do
      with_fx :distortion, amp: 0.8 do
        #print timeFixer
        xx=bassline.tick(:ticka)
        rel = rrand(0.7,2.7)
        use_synth :beep
        play xx, release: rel
        use_synth :pulse
        use_synth_defaults pulse_width: rrand(0.1,1), cutoff: rrand(85,105)
        play xx, release: rel
      end
      
      x=kickline.tick(:tickc)
      sample :bd_tek, cutoff: rrand(100,130)
      sleep x
    end
  end
end


live_loop :kickPlayer do
  1.times do
    sleep 64
  end
  3.times do
    kickMaker
  end
  if one_in(2)
    sleep 64
  end
end


#Piano CHORDS
#Piano CHORDS
#Piano CHORDS
#name chords as variables, then make an array of all the variables,then choose 'em
define :chordMaker do
  
  #chord arrays
  b=[72,77,79]#cfg
  c=[84,89,92]#cfg2
  
  d=[74,76,81] #dea
  e=[86,88,93]#dea2
  
  f=[74,79,81]#dga
  g=[86,91,93]#dga2
  
  h=[72,77,79,83]#cfgb
  i=[84,89,91,95]#cfgb
  
  chordSet=[b,d,f,h,c,e,g,i]
  
  #chord riff chooser
  j=chordSet.choose
  k=chordSet.choose
  l=chordSet.choose
  m=chordSet.choose
  n=chordSet.choose
  o=chordSet.choose
  p=chordSet.choose
  q=chordSet.choose
  chordrun=[j,k,l,m,n,o,p,q]
  
  #note on or off
  r=[1,0,0,0,0].choose
  s=[1,1,0,0,0].choose
  t=[1,1,0,0,0].choose
  u=[1,1,0,0,0].choose
  v=[1,0,0,0,0].choose
  w=[1,1,0,0,0].choose
  x=[1,1,0,0,0].choose
  y=[1,0,0,0,0].choose
  amperage=[r,s,t,u,v,w,x,y]
  slp=[0.25,1,2,3].choose
  
  16.times do
    xx=chordrun.tick(:tickd)
    yy=amperage.tick(:ticke)
    
    use_synth :piano
    use_synth_defaults pan: 0.5, release: 8, cutoff: rrand(80,100)
    play xx, amp: yy
    sleep slp
    play xx, amp: yy
    use_synth :pluck
    use_synth_defaults pan: 0.25, release: 8, cutoff: rrand(80,100)
    play xx, amp: yy
    sleep 8-slp
  end
end

with_fx :hpf, pre_amp:8, cutoff: 100, amp: 0.7 do
  with_fx :reverb, room:0.8, mix: 0.7 do
    live_loop :chordPlayer do
      3.times do
        chordMaker
      end
      if one_in(2)
        sleep 128
      end
    end
  end
end


#Subtle Chks
#Subtle Chks
#Subtle Chks


with_fx :hpf, cutoff: 120 do
  with_fx :distortion, distort: 0.8, amp:0.8 do
    live_loop :chick do
      sample :elec_hi_snare, pan: -0.4, rate: 3, attack:0.2, amp: [1,1,0].choose
      sleep 2
      sample :elec_hi_snare, pan: -0.4, rate: 2.85, attack:0.2, amp: 0.8
      sleep 2
    end
    
    live_loop :chick2 do
      sleep 1
      sample :elec_mid_snare, pan: -0.4, rate: 4, attack:0.2
      sleep 2
      sample :elec_mid_snare, pan: -0.4, rate: 3.5, attack:0.2, amp: [1,0].choose
      sleep 1
    end
  end
end

#Mid-high Arpeggios
#Mid-high Arpeggios
#Mid-high Arpeggios


define :arpMaker do
  #note chooser
  a = [60,62,64,65,67,69,71,
       72,74,76,77,78,81,83]
  b=a.choose
  c=a.choose
  d=a.choose
  e=a.choose
  f=a.choose
  g=a.choose
  h=a.choose
  i=a.choose
  arpline=[b,c,d,e,f,g,h,i]
  
  #note on or off
  
  2.times do
    j=[1,1,0,0,0].choose
    k=[1,1,0,0,0].choose
    l=[1,1,0,0,0].choose
    m=[1,1,0,0,0].choose
    n=[1,1,0,0,0].choose
    o=[1,1,0,0,0].choose
    p=[1,1,0,0,0].choose
    q=[1,1,0,0,0].choose
    amperage=[j,k,l,m,n,o,p,q]
    div = [2,2,1.5].choose
    128.times do
      x=arpline.tick(:ticka)
      y=amperage.tick(:tickb)
      rel = rrand(0.4,2)
      atk = rrand(0,0.5)
      use_synth :fm
      play x+12, amp:y*0.3, pan: rrand(-1,0.5), attack:atk, release: rel, divisor:div
      use_synth :pulse
      use_synth_defaults pulse_width: rrand(0.01,1), cutoff: rrand(80,100)
      play x, amp: y*0.4, pan: rrand(-1,0.5), attack:atk,  release: rel
      sleep 1
    end
  end
  1.times do
    sleep 128
  end
end

with_fx :reverb, room: 0.1, mix: 0.7 do
  with_fx :distortion, amp: 0.4  do
    live_loop :arpPlayer, delay: 256 do
      arpMaker
    end
  end
end

#Sample Scanner Percussion
#Sample Scanner Percussion
#Sample Scanner Percussion

live_loop :perc_4, delay: 384 do
  #this is a 4th percussion element that plays rapid hi pitched samples that fade in and out
  ampLfo = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1].ring
  rat = 3
  sus = 0.01
  sam = [:elec_bong, :elec_chime, :elec_twang, :elec_wood, :elec_pop, :elec_beep, :elec_blip, :elec_triangle,
         :drum_cymbal_soft, :drum_splash_hard, :drum_splash_soft, :drum_cymbal_open, :drum_cymbal_closed,
         :drum_cymbal_pedal, :drum_cymbal_hard, :perc_snap, :elec_flip]
  sam1 = sam.choose
  sam2 = sam.choose
  128.times do
    sample sam.choose, rate: rat, sustain: sus, amp: ampLfo.tick
    sleep 1
  end
  1.times do
    sleep 128
  end
  64.times do
    sample sam1, rate: rat, sustain: sus-0.006, amp: ampLfo.tick
    sleep 1
    sample sam2, rate: rat, sustain: sus-0.006, amp: ampLfo.tick
    sleep 1
  end
  1.times do
    sleep 128
  end
end

#this is one of the first times i've created genuinely original systems on my own in code. in the past, i've stolen techniques and modified or repurposed 'em but never really felt like i was figuring out something brand new on my own. 
#well, this "come up with a new riff every 4 or 8 bars" system is all mine. i needed to do that because things get accepted as sounding "on purpose" when they're repeated. That holds true for improv jazz & guitar solos as much as algorithmic music.
#i'm sure there's a more elegant way of doing it instead of assigning values to variables from an array and then using those variables in a 2nd array, but this works just fine.
#up next is taking all the synths and samples and sets of notes and sets of timings and turning those into global variables so i can switch them out and make different sounding patches without having to totally rewrite the systems.
#up next is also a better system for randomizing the FX and the mix in a controlled fashion.
#i gotta give thanks to William Fields, whose 24-hour FieldsOS project showed me that algorithmic music could be a lot better than anything I'd heard or made, and could do a lot more shapeshifting than I thought it could. It just takes more robust systems and more "pre-production" and curation of the sound.
#trust, me, i realize this isn't coming close to FieldsOS in terms of variety of sound/feel, but, to give myself credit, this is after a few hours spread out over 2 days and I'm approaching the challenge using very different tools. Maybe a control surface sending OSC messages is next?
