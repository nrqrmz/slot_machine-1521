require_relative '../slot_machine'

def test_scenario(reels, amount)
  it "returns #{amount} for #{reels.join(' | ')}" do
    machine = SlotMachine.new(reels)
    score = machine.score
    expect(score).to eq(amount)
  end
end

describe SlotMachine do
  describe '#score' do
    it 'returns 0 for three different symbols bell | cherry | joker ' do
      machine = SlotMachine.new(%w[bell cherry joker])
      score = machine.score
      expect(score).to eq(0)
    end

    test_scenario(%w[joker joker joker], 50)
    test_scenario(%w[star star star], 40)
    test_scenario(%w[bell bell bell], 30)
    test_scenario(%w[seven seven seven], 20)
    test_scenario(%w[cherry cherry cherry], 10)

    test_scenario(%w[joker joker star], 25)
    test_scenario(%w[joker joker bell], 25)
    test_scenario(%w[joker joker seven], 25)
    test_scenario(%w[joker joker cherry], 25)

    test_scenario(%w[star star joker], 20)
    test_scenario(%w[star joker star], 20)
    test_scenario(%w[joker star star], 20)
    test_scenario(%w[bell bell joker], 15)
    test_scenario(%w[seven seven joker], 10)
    test_scenario(%w[cherry cherry joker], 5)
  end
end
