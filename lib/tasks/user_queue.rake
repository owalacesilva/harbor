namespace :queues do
  desc "Processing user spill queue"
  task :execute => :environment do
    counter = 0
    queue = UserQueue.not_spilled_by_old

    puts "Contas para serem processadas: #{queue.count}"
    queue.each do |user|
      service = UserQueueService.call(user)
      if service.success?
        puts "[success] User '#{service.result.user_id}' alright spilled"
      else
        puts "[failed] User '#{user.user_id}' does not spilled by **#{service.errors.to_json}**"
      end

      counter = counter + 1
    end

    puts "Contas processadas: #{counter}"
  end
end
