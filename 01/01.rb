file_content = File.read "01.txt"

lines = file_content.split "\n"

elf_sums = []

value = 0
idx = 0

for line in lines do
	if line == ""
		idx = idx + 1

		elf_sums.push value

		value = 0
	else
		value += line.to_i
	end
end

elf_sums.sort_by! { |e| -e }

puts "best elf: #{elf_sums.at(0)}"

best_three = elf_sums.slice(0, 3).reduce { |a, e| a + e }

puts "best 3 sum: #{best_three}"