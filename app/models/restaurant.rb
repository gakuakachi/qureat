 class Restaurant < ActiveRecord::Base

  has_many :reviews
  belongs_to :category
  validates_presence_of :name
  validates_presence_of :description
  # validates_presence_of :address1
  # validates_presence_of :address2
  validates_presence_of :city
  # validates_presence_of :state
  # validates_presence_of :zipcode
  # validates_presence_of :phone
  # validates_presence_of :email
  # validates_presence_of :category_id

  geocoded_by :full_address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  def full_address
    [address1, address2, city, state, zipcode].join(', ')
  end

  def self.search(params)
    restaurants = Restaurant.where(category_id: params[:category].to_i)
    restaurants = restaurants.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    restaurants = restaurants.near(params[:location], 20) if params[:location].present?
    restaurants
  end
end