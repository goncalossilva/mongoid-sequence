require "test_helper"

class SequenceTest < BaseTest
  def test_single_sequence_consistency
    n = 200

    n.times do
      FirstSequencedModel.create
    end

    assert_equal FirstSequencedModel.only(:auto_increment).map(&:auto_increment).sort, (1..n).to_a
  end

  def test_id_sequence_consistency
    n = 200

    n.times do
      IdSequencedModel.create
    end

    assert_equal IdSequencedModel.only(:id).map(&:id).sort, (1..n).to_a
  end

  def test_double_sequence_consistency
    n = 100

    n.times do
      FirstSequencedModel.create
      SecondSequencedModel.create
    end

    assert_equal FirstSequencedModel.only(:auto_increment).map(&:auto_increment).sort, (1..n).to_a
    assert_equal SecondSequencedModel.only(:auto_increment).map(&:auto_increment).sort, (1..n).to_a
  end
end
