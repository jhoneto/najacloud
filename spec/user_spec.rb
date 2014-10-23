class User
  def initialize
    @counter_for_attribute = Hash.new(0)
  end

  def name
    @name
  end

  def name=(name)
    @name = name.upcase
    increment_counter_for(:name)
  end

  def increment_counter_for(attribute)
    @counter_for_attribute[attribute] += 1
  end
end

describe User do
  it "should be instantiated" do
    expect(User.new).to be_an_instance_of(User)
  end

  describe '#initialize' do
    it "sets @counter_for_attribute to Hash.new(0)" do
      user = User.new
      counter_hash = user.instance_variable_get("@counter_for_attribute")
      expect(counter_hash[:attr_1]).to be(0)
      expect(counter_hash[:attr_2]).to be(0)
    end
  end

  specify '#name' do
    user = User.new
    user.instance_variable_set("@name", 'Vinicius')
    expect(user.name).to eq("Vinicius")
  end


  specify '#increment_counter_for' do
    user = User.new
    user.increment_counter_for(:test)
    user.increment_counter_for(:test)
    user.increment_counter_for(:test)
    user.increment_counter_for(:test)

    counter_hash = user.instance_variable_get("@counter_for_attribute")
    expect(counter_hash[:test]).to eq(4)
  end

  describe '#name=' do
    it "stores the assignment on @name" do
      user = User.new
      allow(user).to receive(:increment_counter_for)
      user.name = "Vinicius"
      name_value = user.instance_variable_get("@name")
      expect(name_value).to eq("VINICIUS")
    end

    it "increments the counter", focus: true do
      user = User.new
      expect(user).to receive(:increment_counter_for).with(:name)
      user.name = 'Novo nome'
    end
  end

end
