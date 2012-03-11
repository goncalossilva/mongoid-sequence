require "test_helper"

class UniquenessTest < BaseTest
  def test_single_sequence_uniqueness
    n = 200

    n.times do
      FirstSequencedModel.create
    end

    assert_equal FirstSequencedModel.only(:auto_increment).uniq.size, n
  end

  def test_id_sequence_uniqueness
    n = 200

    n.times do
      IdSequencedModel.create
    end

    assert_equal IdSequencedModel.only(:id).uniq.size, n
  end

  def test_double_sequence_uniqueness
    n = 100

    n.times do
      FirstSequencedModel.create
      SecondSequencedModel.create
    end

    assert_equal FirstSequencedModel.only(:auto_increment).uniq.size, n
    assert_equal SecondSequencedModel.only(:auto_increment).uniq.size, n
  end
end
