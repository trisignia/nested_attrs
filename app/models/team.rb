class Team < ActiveRecord::Base
  has_many :interactions
  has_many :users, :through => :interactions
  role = Role.find_or_create_by_name('player')
  has_many  :players,
            :through    => :interactions, 
            :source     => :user, 
            :conditions => ["interactions.role_id = ?", role.id] do
              class_eval do
                define_method("<<") do |r|                                                             
                  Interaction.send(:with_scope, :create => {:role_id => role.id}) { self.concat r }
                end
              end
            end

  accepts_nested_attributes_for :players
end
