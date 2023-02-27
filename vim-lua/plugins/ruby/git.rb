output = `git --no-pager diff -U0`

exit if output == ''

files = output.split('diff --git')[1..]

hunks = files.flat_map do |file|
  file_name = file.split("\n")[0].split[-1].gsub('b/', '')
  file.split('@@ -').filter_map do |hunk|
    next unless hunk.include? '@@'

    hunk_lines = hunk.split("\n")
    line_number = hunk.split[1].split(',')[0].to_i
    hunk_title = hunk_lines[1]
    if hunk_title.gsub('+', '').gsub(' ', ' ') == '' && hunk_lines.length >= 2
      hunk_title = hunk_lines[2]
      line_number += 1
    end

    {
      file_name: file_name,
      line_number: line_number,
      file: file,
      hunk: hunk,
      title: hunk_title
    }
  end
end

output = `git ls-files --others --exclude-standard`
untracked_files = output.split("\n").map do |file_name|
  {
    file_name: file_name,
    line_number: 1
  }
end

hunks += untracked_files

hunks.each do |hunk|
  # puts hunk[:file_name]
  puts "#{hunk[:file_name]}:#{hunk[:line_number]} #{hunk[:title]}"
end
