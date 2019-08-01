require

describe mage do
  it 'find token' do
    mage = Mage.new(:find)
    expect(mage).to be_find
  end
end
context 'when thw mage find token' do
  context 'then the token  activate' do
    it 'reduce the health of the mage' do
      mage = Mage.new(:find)
      token = Token.new(:activate)
      mage.discovers(token)
      expect(mage).to be_damage
    end
  end
end
context 'when the mage find a token' do
  context 'when the token is inactive' do
    it 'does not affect the health of mage' do
      mage = Mage.new(:find)
      token = Token.new(:inactive)
      mage.discovers(token)
      expect(mage).to be_fine
    end
  end
end

describe token do
  it 'it create a token inactive' do
    token = Token.new(:inactive)
    expect(token).to be_inactive
  end
end
context 'when the token changes status from inactive to active' do
  it 'it does affect all the mages to find the token' do
    mage = Mage.new(:find)
    token = Token.new(:inactive)
    mage.discovers(token)
    expect(mage).to be_fine
    token.cursed?
    expect(token).to be_active
    expect(mage).to be_damage
  end
end
