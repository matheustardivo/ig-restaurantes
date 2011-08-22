class User < ActiveRecord::Base
  
  def pode_manter?(entidade)
    entidade.user.id == self.id
  end
  
end
