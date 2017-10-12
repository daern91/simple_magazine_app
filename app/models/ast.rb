class Ast < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :tag, optional: true
  belongs_to :subtag, optional: true
end
