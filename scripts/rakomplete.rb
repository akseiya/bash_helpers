#!/usr/bin/env ruby
# Rake task/namespace autocompletion for bash.

# To plug it into bash, add the following file to ~/.bashrc
# complete -C path/to/script -o default rake

# Nicholas Seckar
# Saimon Moore (http://www.webtypes.com/2006/03/31/rake-completion-script-that-handles-namespaces)
# Michał Lech - preventing rake namespace1:namespace1:task1 issue, Rubyisms,
#               removing args



exit 0 unless File.file?(File.join(Dir.pwd, 'Rakefile'))
exit 0 unless /^rake\b/ =~ ENV["COMP_LINE"]
after_match = $'
task_match = nil
task_match = after_match.split.last \
    unless after_match.empty? || after_match =~ /\s$/
tasks = `rake --silent --tasks`.split("\n")
tasks.map! { |line| line.split[1].split('[').first }                            # extract [namespace:]task, skip args
tasks.reject! { |t| not /^#{Regexp.escape task_match }/ =~ t } if task_match    # select matching ones
# handle namespaces
if task_match =~ /^([-\w:]+:)/
    upto_last_colon = $1
    after_match = $'
    colons = task_match.count ':'
    tasks.map! { |t| t.split(':')[colons..-1].join(':') }
end
puts tasks
exit 0 