class Report < ApplicationRecord
  belongs_to :user
s belongs_to :reportable, polymorphic: true

end
