require 'observer'
require 'byebug'

class Character
  BASE_HEALTH = 10

  attr_reader :health

  def initialize
    @health = BASE_HEALTH
  end

  def update
    raise 'Must implement in child class'
  end

  def discovers(token)
    update if token.cursed?
    token.add_observer(self)
  end
end

class Mage < Character
  def update
    damage
  end

  private

  def damage
    @health = @health - 3
  end
end

class Demon < Character
  def update(...)
    healing
  end

  private

  def healing
    @health = @health  +  3
  end
end

class Token
  include Observable

  def initialize(cursed: false)
    @cursed = cursed
  end

  def activate!
    @cursed = true
    changed
    notify_observers
  end

  def cursed?
    @cursed
  end
end
