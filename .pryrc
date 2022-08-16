Pry.config.prompt_name = "Harbor #{Rails.env.upcase}"

eval(File.open(".irbrc").read)
