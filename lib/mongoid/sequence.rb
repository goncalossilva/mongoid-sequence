# encoding: utf-8

require "active_support/concern"

module Mongoid
  module Sequence
    extend ActiveSupport::Concern

    included do
      set_callback :create, :before, :set_sequence
    end

    module ClassMethods
      attr_accessor :sequence_fields

      def sequence(field)
        self.sequence_fields ||= []
        self.sequence_fields << field
      end
    end

    def set_sequence
      sequences = self.db.collection("__sequences")
      self.class.sequence_fields.each do |field|
        next_sequence = sequences.find_and_modify(:query  => {"_id" => "#{self.class.name.underscore}_#{field}"},
                                                  :update => {"$inc" => {"seq" => 1}},
                                                  :new    => true,
                                                  :upsert => true)

        self[field] = next_sequence["seq"]
      end if self.class.sequence_fields
    end
  end
end
