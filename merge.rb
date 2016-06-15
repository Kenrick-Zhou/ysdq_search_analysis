# encoding: utf-8

class Search1d

end


DIR_PATH = '/Users/Kenrick/SVN-Repos/leic_pm/documents/数据分析/搜索量/data/*'
TEST_FILE = '/Users/Kenrick/SVN-Repos/leic_pm/documents/数据分析/搜索量/data/search_word_stat.2016-06-14.txt'

merge = Hash.new
dates = []
Dir[DIR_PATH].each do |file_path|
  # puts file_path
  date = /\d{4}-\d{2}-\d{2}/.match(file_path)[0]
  dates.push date

  file = File.open(file_path, 'r')
  file.each do |line|
    video_name = line.split("\t")[0]
    search_count = line.split("\t")[1].chop
    if merge.has_key? video_name
      merge[video_name][date] = search_count
    else
      search_counts = Hash.new
      search_counts[date] = search_count
      merge[video_name] = search_counts
    end
  end
end


# out = File.new('merge_date.csv', 'w+')
out = File.new('merge_date.txt', 'w+')
# puts merge
out.print 'name'
dates.each do |d|
  # out.print ",#{d}"
  out.print "\t#{d}"
end
out.puts

merge.keys.each do |name|
  # puts merge[k]
  out.print name
  dates.each do |date|
    if merge[name].has_key? date
      # out.print ",#{merge[name][date]}"
      out.print "\t#{merge[name][date]}"
    else
      # out.print ","
      out.print "\t"
    end
  end
  out.puts
end

# p '========================='
#
# file = File.open(TEST_FILE, 'r')
# line = file.readlines[0]
# p line
# p line.split("\t")
# p '-------------------------'
# file.each { |line| print "#{file.lineno}.", line}
# file.close
#
#
# p /\d{4}-\d{2}-\d{2}/.match(TEST_FILE)[0]
#
# data = []
# h = Hash.new
# h['name'] = line.split("\t")[0]
# h[/\d{4}-\d{2}-\d{2}/.match(TEST_FILE)[0]] = line.split("\t")[1].chop
# # hash = {name: line.split("\t")[0], line.split("\t")[1]}
# # data.push()
# data.push h
# puts h
# puts data
#
# puts h.has_key? 'name'
