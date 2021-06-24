class Import < ApplicationRecord
  belongs_to :user

  enum status: {
    on_hold: 'on_hold',
    processing: 'processing',
    failed: 'failed',
    terminated: 'terminated'
  }, _default: :on_hold

  has_one_attached :file

  serialize :contacts, Array

  def processing!
    update(status: 'processing')
  end

  def failed!
    update(status: 'failed')
  end

  def terminated!
    update(status: 'terminated')
  end
end
