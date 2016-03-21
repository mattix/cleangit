#!/bin/ruby
protected_branches = [ 'master', 'develop', 'update-version' ]
branches = `git branch --merged`.sub('*', ' ').delete('  ').split("\n")
branches_to_delete = branches - protected_branches
if branches_to_delete.size > 0
  puts "Deleting following branches:"
  puts branches_to_delete
  puts "Proceed? [Y/N]"
  result = gets.chomp
  if result == "Y" or result == "y"
    branches_to_delete.each do |branch|
      `git branch -D #{branch}`
    end
    puts "Branches deleted"
  else
    puts "Aborted"
  end
else
  puts "No branches to delete"
end