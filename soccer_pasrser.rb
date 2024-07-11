def get_data_from_file(filename)
  input_file = File.open(filename, 'r'){ |f| f.read }
  input_file.lines.map(&:split).reject(&:empty?).reject { |c| c[0].include? 'pre>' }
end

def find_smallest_diff(data)
  # remove the header
  data.shift
  data.reject! { |el| el[1].nil? }
  data.map { |el| [el[1], el[6].to_i - el[8].to_i] }.min_by { |_team, diff| diff }[0]
end

soccer_data = get_data_from_file 'soccer.dat'
team = find_smallest_diff soccer_data
p team
