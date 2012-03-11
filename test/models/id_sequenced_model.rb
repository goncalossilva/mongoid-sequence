class IdSequencedModel
  include Mongoid::Document
  include Mongoid::Sequence

  sequence :_id
end
