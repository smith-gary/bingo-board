require "prawn"

def align(num)
    if num < 10
        "  #{num}"
    else
        " #{num}"
    end
end

b_col = (1..15).to_a.sample(5)
i_col = (16..30).to_a.sample(5)
n_col = (31..45).to_a.sample(4)
g_col = (46..60).to_a.sample(5)
o_col = (61..75).to_a.sample(5)

bingo_card = <<-BINGO
+-----+-----+-----+-----+-----+
|  B  |  I  |  N  |  G  |  O  |
+-----+-----+-----+-----+-----+
| #{align(b_col[0])} | #{align(i_col[0])} | #{align(n_col[0])} | #{align(g_col[0])} | #{align(o_col[0])} |
+-----+-----+-----+-----+-----+
| #{align(b_col[1])} | #{align(i_col[1])} | #{align(n_col[1])} | #{align(g_col[1])} | #{align(o_col[1])} |
+-----+-----+-----+-----+-----+
| #{align(b_col[2])} | #{align(i_col[2])} |  F  | #{align(g_col[2])} | #{align(o_col[2])} |
+-----+-----+-----+-----+-----+
| #{align(b_col[3])} | #{align(i_col[3])} | #{align(n_col[2])} | #{align(g_col[3])} | #{align(o_col[3])} |
+-----+-----+-----+-----+-----+
| #{align(b_col[4])} | #{align(i_col[4])} | #{align(n_col[3])} | #{align(g_col[4])} | #{align(o_col[4])} |
+-----+-----+-----+-----+-----+
BINGO

puts b_col.inspect
puts i_col.inspect
puts n_col.inspect
puts g_col.inspect
puts o_col.inspect

puts bingo_card

header = ["B", "I", "N", "G", "O"]
n_col.insert(2, "F")

Prawn::Document.generate("bingo.pdf") do
    define_grid(columns: 5, rows: 6)
    
    header.each_with_index do |char, i|
        grid(0,i).bounding_box do
            stroke_bounds
            text char, align: :center, valign: :center, size: 50, style: :bold
        end
    end  
    
    b_col.each_with_index do |num, i|
        grid((i+1), 0).bounding_box do
            stroke_bounds
            text num.to_s, align: :center, valign: :center, size: 50
        end
    end

    i_col.each_with_index do |num, i|
        grid((i+1), 1).bounding_box do
            stroke_bounds
            text num.to_s, align: :center, valign: :center, size: 50
        end
    end

    n_col.each_with_index do |num, i|
        grid((i+1), 2).bounding_box do
            stroke_bounds
            text num.to_s, align: :center, valign: :center, size: 50
        end
    end

    g_col.each_with_index do |num, i|
        grid((i+1), 3).bounding_box do
            stroke_bounds
            text num.to_s, align: :center, valign: :center, size: 50
        end
    end

    o_col.each_with_index do |num, i|
        grid((i+1), 4).bounding_box do
            stroke_bounds
            text num.to_s, align: :center, valign: :center, size: 50
        end
    end
end