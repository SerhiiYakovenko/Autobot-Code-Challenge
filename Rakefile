task :run_first_task do
  ruby "solution/question_1.rb"
end

task :run_second_task do
  ruby "solution/question_2.rb"
  puts 'Starting unit testing'
  sh 'rspec spec/list_spec.rb'
end

task :run_both_tasks do
  %W[run_first_task run_second_task].each do |task_name|
    sh "rake #{task_name}"
  end
end