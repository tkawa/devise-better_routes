class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable
end
class RailsProgrammer < User; end
class Programmer < User; end
class Engineer < User; end
