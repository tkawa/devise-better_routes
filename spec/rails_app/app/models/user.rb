class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable
end
class RailsProgrammer < User; end
class Programmer < User; end
class Engineer < User; end
