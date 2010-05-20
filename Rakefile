require 'rake'

task :default => :test

desc "Run the tests, set environment variable EXERCISE to run specific ex."
task :test do
  exercise = ENV['EXERCISE'] || '*'
  sh %Q{mit-scheme --batch-mode --eval "(set! load/suppress-loading-message? #t)" --load #{exercise}.scm --eval "(%exit (run-registered-tests))"}
end
