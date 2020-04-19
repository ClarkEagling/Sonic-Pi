use_debug false

use_bpm 400

live_loop :houseKick do
  sample :bd_tek
  sleep 4
end


define :snareMaker do
  a=[0,0.5,1]
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
      sample :sn_dolf, amp: x, rate: 2
      sample :sn_generic, amp: x * 0.5, rate: 3
      sleep 4
    end
  end
end

live_loop :snarePlayer do
  snareMaker
end

define :kickMaker do
  a=[4,8,12,6]
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
  
  
  2.times do
    7.times do
      #print timeFixer
      x=kickline.tick(:tickc)
      sample :bd_tek, rate: [3,3.25].choose, sustain:0.01, cutoff: rrand(100,130), amp: [0,0,1].choose * 0.5
      sleep x
    end
  end
end

live_loop :kickPlayer do
  kickMaker
end




#things to figure out and add
#sleep calc system for keeping timings within 1 bar -- DONE! WOO! USE UNTIL!
#system for determining whether a note will play or not -- DONE! WOO!

define :basslineMaker do
  #note chooser
  a = [24,26,28,29,31,33,35,
       36,38,40,41,43,45,47,
       48,50,52,53,55,57,59]
  b=a.choose
  c=a.choose
  d=a.choose
  e=a.choose
  f=a.choose
  g=a.choose
  h=a.choose
  i=a.choose
  bassline=[b,c,d,e,f,g,h,i]
  
  #note on or off
  j=[1,1,0,0,0].choose
  k=[1,1,1,0,0].choose
  l=[1,1,1,0,0].choose
  m=[1,1,1,0,0].choose
  n=[1,1,0,0,0].choose
  o=[1,1,1,0,0].choose
  p=[1,1,1,0,0].choose
  q=[1,1,0,0,0].choose
  amperage=[j,k,l,m,n,o,p,q]
  
  128.times do
    x=bassline.tick(:ticka)
    y=amperage.tick(:tickb)
    use_synth :beep
    play x, amp:y
    use_synth :pulse
    use_synth_defaults pulse_width: rrand(0.1,1), cutoff: 70
    play x, amp: y
    sleep 1
  end
end

with_fx :distortion, amp: 0.7  do
  live_loop :bassPlayer do
    basslineMaker
  end
end

#HIGHER CHORDS
#chords as variables, then array of variables,then choose 'em
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
  s=[1,0,0,0,0].choose
  t=[1,0,0,0,0].choose
  u=[1,0,0,0,0].choose
  v=[1,0,0,0,0].choose
  w=[1,0,0,0,0].choose
  x=[1,0,0,0,0].choose
  y=[1,0,0,0,0].choose
  amperage=[r,s,t,u,v,w,x,y]
  
  32.times do
    xx=chordrun.tick(:tickd)
    yy=amperage.tick(:ticke)
    use_synth :hoover
    use_synth_defaults release: 8, cutoff: rrand(80,100)
    play xx, amp: yy * 0.3
    use_synth :hollow
    use_synth_defaults release: 8, amp: 0.3, cutoff: rrand(80,100)
    play xx, amp: yy #* 0.25
    sleep 2
  end
end

with_fx :hpf, pre_amp:8, cutoff: 111, amp: 1 do
  with_fx :reverb, room:1, mix: 0.7 do
    live_loop :chordPlayer, delay: 64 do
      chordMaker
    end
  end
end


with_fx :hpf, cutoff: 120 do
  with_fx :distortion do
    live_loop :chick do
      sample :elec_hi_snare, rate: 3, attack:0.2, amp: [1,1,0].choose
      sleep 2
      sample :elec_hi_snare, rate: 2.85, attack:0.2, amp: 0.8
      sleep 2
    end
    
    live_loop :chick2 do
      sleep 1
      sample :elec_mid_snare, rate: 4, attack:0.2
      sleep 2
      sample :elec_mid_snare, rate: 3.5, attack:0.2, amp: [1,1,0].choose
      sleep 1
    end
  end
end


#well livestreaming is too much for this ol' computer, sound glitching out, thanks for joining me on this boring journey