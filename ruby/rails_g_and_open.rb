#!/usr/bin/ruby

require 'pty'

def extract_created_files(lines)
  created_items = lines.map do |line|
    command, file = colorless(line).split
    file if command == "create"
  end.compact

  created_files =
    created_items.reject { |file| File.directory?(file) }

  created_files.reverse
end

def colorless(str)
  str.gsub /\033\[\d+m/, ""
end

command = "rails generate #{$*.join(" ")}"
lines = []

# Use PTY to force Thor to output coloured text
PTY.spawn(command) do |r, w, pid|
  begin
    while line = r.readline
      puts line
      lines << line
    end
  rescue EOFError
    # noop
  end
end

files = extract_created_files(lines)

if files.any?
  puts "\nOpening files #{files.join(", ")}..."
  # exec("'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl' #{files.join(" ")}")
  exec("subl #{files.join(" ")}")
end
