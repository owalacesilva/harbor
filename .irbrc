def user_h3
  User.find(254)
end

def user_cnpj(cnpj)
  Emissor.com_cnpj(cnpj).first.user
end

def liga_log_debug
  $redis.set("rails:log:verbose", true)
  $redis.expire("rails:log:verbose", 30.minutes)
end

def desliga_log_debug
  $redis.del("rails:log:verbose")
end

Rails.logger.level = :debug