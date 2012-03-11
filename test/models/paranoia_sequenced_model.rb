class ParanoiaSequencedModel
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Sequence

  field :auto_increment, :type => Integer
  sequence :auto_increment
end
