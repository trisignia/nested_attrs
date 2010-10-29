module ActiveRecord
  module Associations
    class HasManyThroughAssociation < HasManyAssociation
protected
      def construct_join_attributes(associate)
          # TODO: revist this to allow it for deletion, supposing dependent option is supported
          raise ActiveRecord::HasManyThroughCantAssociateThroughHasOneOrManyReflection.new(@owner, @reflection) if [:has_one, :has_many].include?(@reflection.source_reflection.macro)
          join_attributes = construct_owner_attributes(@reflection.through_reflection).merge(@reflection.source_reflection.primary_key_name => associate.id)
          if @reflection.options[:source_type]
            join_attributes.merge!(@reflection.source_reflection.options[:foreign_type] => associate.class.base_class.name.to_s)
          end
          join_attributes.merge!({:role_id => @reflection.options[:conditions][1]}) if 'players'.to_sym == @reflection.name
          join_attributes
      end
    end
  end
end

class Team < ActiveRecord::Base
    role = Role.find_or_create_by_name('player')
    has_many :interactions

    has_many :users, :through => :interactions
    has_many :players,
             :through    => :interactions,
             :source     => :user,
             :conditions => ["interactions.role_id = ?", role.id]

    accepts_nested_attributes_for :users, :players
end

