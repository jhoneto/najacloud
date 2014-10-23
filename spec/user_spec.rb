class User
  def initialize
    @number_of_changes_on_name = 0
  end

  def name
    @name
  end

  def name=(name)
    @name = name.upcase
    @number_of_changes_on_name += 1
  end
end

describe User do
  it "should be instantiated" do
    expect(User.new).to be_an_instance_of(User)
  end

  describe '#initialize' do
    it "sets @number_of_changes_on_name to 0" do
      user = User.new
      counter = user.instance_variable_get("@number_of_changes_on_name")
      expect(counter).to be(0)
    end
  end

  specify '#name' do
    user = User.new
    user.instance_variable_set("@name", 'Vinicius')
    expect(user.name).to eq("Vinicius")
  end

  describe '#name=' do
    it "stores the assignment on @name" do
      user = User.new
      user.name = "Vinicius"
      name_value = user.instance_variable_get("@name")
      expect(name_value).to eq("VINICIUS")
    end

    it "increments the @number_of_changes_on_name", focus: true do
      user = User.new
      counter = user.instance_variable_get("@number_of_changes_on_name")
      expect(counter).to be(0)
      user.name = 'teste'
      user.name = 'teste'
      user.name = 'teste4'
      counter = user.instance_variable_get("@number_of_changes_on_name")
      expect(counter).to be(3)

    end
  end

end
