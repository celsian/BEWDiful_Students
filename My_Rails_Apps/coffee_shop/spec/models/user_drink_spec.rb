require 'spec_helper'

describe UserDrink do
  it { should belong_to(:user) }
  it { should belong_to(:drink) }

end