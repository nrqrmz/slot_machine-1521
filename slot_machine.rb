class SlotMachine
  def initialize(reels = [])
    @reels = reels
  end

  POINTS = {
    'joker' => 50,
    'star' => 40,
    'bell' => 30,
    'seven' => 20,
    'cherry' => 10
  }

  def play
    @reels = []

    3.times do
      @reels << POINTS.keys.sample
    end

    @reels
  end

  def score
    if three_identical?
      POINTS[@reels[0]]
    elsif two_and_at_least_a_joker?
      POINTS[@reels.sort[1]] / 2
    else
      0
    end

    # three_identical? ? POINTS[@reels[0]] : two_and_at_least_a_joker? ? POINTS[@reels.sort[1]] / 2 : 0
  end

  private

  def three_identical?
    @reels.uniq.count == 1
  end

  def two_and_at_least_a_joker?
    @reels.include?('joker') && @reels.uniq.count == 2
  end
end
