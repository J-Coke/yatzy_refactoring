class Yatzy
  def self.chance(*args)
    total = args.sum
    return total
  end

  def self.yatzy(dice)
    for i in 1..dice.size-1 do
      if dice[i] != dice[i-1]
        return 0
      end
    end
    return 50
  end

  def self.singles(num, *args)
    sum = 0
    args.each { |n| if n == num then sum += num end }
    return sum
  end

  def self.ones( d1,  d2,  d3,  d4,  d5)
    num = 1
    self.singles(num, d1,  d2,  d3,  d4,  d5)
  end

  def self.twos( d1,  d2,  d3,  d4,  d5)
    num = 2
    self.singles(num, d1,  d2,  d3,  d4,  d5)
  end

  def self.threes( d1,  d2,  d3,  d4,  d5)
    num = 3
    self.singles(num, d1,  d2,  d3,  d4,  d5)
  end

  def initialize(*args)
    @dice = args
  end

  def fours
    sum = 0
    for at in Array 0..4
      if (@dice[at] == 4)
        sum += 4
      end
    end
    return sum
  end

  def fives()
    s = 0
    i = 0
    for i in (Range.new(0, @dice.size))
      if (@dice[i] == 5)
        s = s + 5
      end
    end
    s
  end

  def sixes
    sum = 0
    for at in 0..@dice.length
      if (@dice[at] == 6)
        sum = sum + 6
      end
    end
    return sum
  end

  def self.score_pair( d1,  d2,  d3,  d4,  d5)
    counts = [0]*6
    counts[d1-1] += 1
    counts[d2-1] += 1
    counts[d3-1] += 1
    counts[d4-1] += 1
    counts[d5-1] += 1
    at = 0
    (0...6).each do |at|
      if (counts[6-at-1] >= 2)
        return (6-at)*2
      end
    end
    return 0
  end

  def self.two_pair( d1,  d2,  d3,  d4,  d5)
    counts = [0]*6
    counts[d1-1] += 1
    counts[d2-1] += 1
    counts[d3-1] += 1
    counts[d4-1] += 1
    counts[d5-1] += 1
    n = 0
    score = 0
    for i in Array 0..5
      if (counts[6-i-1] >= 2)
        n = n+1
        score += (6-i)
      end
    end
    if (n == 2)
      return score * 2
    else
      return 0
    end
  end

  def self.four_of_a_kind( _1,  _2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[_1-1] += 1
    tallies[_2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    for i in (0..6)
      if (tallies[i] >= 4)
        return (i+1) * 4
      end
    end
    return 0
  end

  def self.three_of_a_kind( d1,  d2,  d3,  d4,  d5)
    t = [0]*6
    t[d1-1] += 1
    t[d2-1] += 1
    t[d3-1] += 1
    t[d4-1] += 1
    t[d5-1] += 1
    for i in [0,1,2,3,4,5]
      if (t[i] >= 3)
        return (i+1) * 3
      end
    end
    0
  end

  def self.smallStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    (tallies[0] == 1 and
      tallies[1] == 1 and
      tallies[2] == 1 and
      tallies[3] == 1 and
      tallies[4] == 1) ? 15 : 0
  end

  def self.largeStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    if (tallies[1] == 1 and tallies[2] == 1 and tallies[3] == 1 and tallies[4] == 1 and tallies[5] == 1)
      return 20
    end
    return 0
  end

  def self.fullHouse( d1,  d2,  d3,  d4,  d5)
    tallies = []
    _2 = false
    i = 0
    _2_at = 0
    _3 = false
    _3_at = 0

    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    for i in Array 0..5
      if (tallies[i] == 2)
        _2 = true
        _2_at = i+1
      end
    end

    for i in Array 0..5
      if (tallies[i] == 3)
        _3 = true
        _3_at = i+1
      end
    end

    if (_2 and _3)
      return _2_at * 2 + _3_at * 3
    else
      return 0
    end
  end
end
