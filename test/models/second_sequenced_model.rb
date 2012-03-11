class SecondSequencedModel
  include Mongoid::Document
  include Mongoid::Sequence

  field :auto_increment, :type => Integer
  sequence :auto_increment
end
