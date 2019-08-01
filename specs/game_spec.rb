require 'rspec'
require_relative '../cg/game'

describe Mage do
  context 'when the mage find token' do
    context 'then the token  activate' do
      it 'reduce the health of the mage' do
        mage  = Mage.new
        token = Token.new(cursed: true)
        mage.discovers(token)
        expect(mage.health).to eq(7)
      end
    end
  end
end

describe Demon do
  context 'when the demon find token' do
    context'then the token activate' do
      it 'increase the health of the demon' do
        demon = Demon.new
        token = Token.new(cursed: true)
        demon.discovers(token)
        expect(demon.health).to eq(13)
      end
    end
  end
end

describe Token do
  it 'can create a cursed token' do
    token = Token.new(cursed: true)
    expect(token).to be_cursed
  end

  it 'can create a non cursed token' do
    token = Token.new
    expect(token).not_to be_cursed
  end

  describe '#activate!' do
    it 'activates the token' do
      token = Token.new
      expect(token).not_to be_cursed

      token.activate!

      expect(token).to be_cursed
    end
  end

  it 'damages the mages health' do
    mage  = Mage.new
    token = Token.new
    mage.discovers(token)
    expect(mage.health).to eq(10)

    token.activate!
    expect(mage.health).to eq(7)
  end

  it 'increase the demons health' do
    demon = Demon.new
    token = Token.new
    demon.discovers(token)
    expect(demon.health).to eq(10)
    token.activate!
    expect(demon.health).to eq(13)
  end
end
