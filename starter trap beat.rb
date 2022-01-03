use_bpm 650

live_loop :snare do
  sleep 8
  sample :sn_dolf, rate: 1.7
  sleep 8
end

live_loop :hats do
  32.times do
    sample :drum_cymbal_closed, rate: 1.5
    sleep 2
  end
  32.times do
    sample :drum_cymbal_closed, rate: 1.6
    sleep 2
  end
end

live_loop :hats2 do
  if one_in(8)
    sample :drum_cymbal_closed, rate: 1.55, amp: 0.7
  end
  sleep 1
end


define :kick do
  sample :bd_haus
  play 33, release: 15
end

live_loop :kicker do
  kick
  sleep 20
  kick
  sleep 6
  kick
  sleep 6
end
