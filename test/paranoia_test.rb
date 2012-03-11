require "test_helper"

class ParanoiaTest < BaseTest
  def test_paranoia_doesnt_affect_sequence
    m1 = ParanoiaSequencedModel.create
    m2 = ParanoiaSequencedModel.create

    assert_equal m1.auto_increment, 1
    assert_equal m2.auto_increment, 2

    m2.destroy
    m3 = ParanoiaSequencedModel.create

    assert_equal m3.auto_increment, 3

    m3.destroy!
    m4 = ParanoiaSequencedModel.create

    assert_equal m4.auto_increment, 4
  end
end
