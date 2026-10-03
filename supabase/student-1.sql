-- Replace STUDENT_USER_UUID with this student's ID from Authentication > Users.
-- Run only in the Supabase SQL Editor after schema.sql. No passwords go in SQL.
insert into public.student_spaces (user_id, display_name, content)
values ('STUDENT_USER_UUID'::uuid, 'Lauren', $content${
  "version": 1,
  "pending": false,
  "level": "Primary 4 · CHIJ Our Lady of the Nativity (OLN) · 2026",
  "subjects": [
    {
      "id": "maths",
      "name": "Mathematics",
      "symbol": "÷",
      "line": "A little practice adds up.",
      "tags": "Maths exam · 27 October 2026"
    },
    {
      "id": "science",
      "name": "Science",
      "symbol": "✳",
      "line": "Stay curious about the world.",
      "tags": "Science exam · 29 October 2026"
    }
  ],
  "topics": [
    {
      "id": "m0",
      "name": "Numbers to 100 000",
      "subject": "maths"
    },
    {
      "id": "m1",
      "name": "Factors & multiples",
      "subject": "maths"
    },
    {
      "id": "m2",
      "name": "Four operations of whole numbers",
      "subject": "maths"
    },
    {
      "id": "m3",
      "name": "Tables & line graphs",
      "subject": "maths"
    },
    {
      "id": "m4",
      "name": "Fractions",
      "subject": "maths"
    },
    {
      "id": "m5",
      "name": "Angles",
      "subject": "maths"
    },
    {
      "id": "m6",
      "name": "Rectangles & squares",
      "subject": "maths"
    },
    {
      "id": "m7",
      "name": "Decimals",
      "subject": "maths"
    },
    {
      "id": "m8",
      "name": "The four operations of decimals",
      "subject": "maths"
    },
    {
      "id": "m9",
      "name": "Pie charts",
      "subject": "maths"
    },
    {
      "id": "m10",
      "name": "Area & perimeter",
      "subject": "maths"
    },
    {
      "id": "m11",
      "name": "Nets",
      "subject": "maths"
    },
    {
      "id": "m12",
      "name": "Symmetry",
      "subject": "maths"
    },
    {
      "id": "m13",
      "name": "Problem solving & heuristic skills: internal & external transfer",
      "subject": "maths"
    },
    {
      "id": "s0",
      "name": "Diversity of living and non-living things",
      "subject": "science",
      "theme": "Diversity",
      "level": "P3"
    },
    {
      "id": "s1",
      "name": "Materials",
      "subject": "science",
      "theme": "Diversity",
      "level": "P3"
    },
    {
      "id": "s2",
      "name": "Life cycles in plants and animals",
      "subject": "science",
      "theme": "Cycles",
      "level": "P3"
    },
    {
      "id": "s3",
      "name": "Matter",
      "subject": "science",
      "theme": "Cycles",
      "level": "P4"
    },
    {
      "id": "s4",
      "name": "Plant parts and functions",
      "subject": "science",
      "theme": "System",
      "level": "P4"
    },
    {
      "id": "s5",
      "name": "Digestive system",
      "subject": "science",
      "theme": "System",
      "level": "P4"
    },
    {
      "id": "s6",
      "name": "Magnets",
      "subject": "science",
      "theme": "Interactions",
      "level": "P3"
    },
    {
      "id": "s7",
      "name": "Heat",
      "subject": "science",
      "theme": "Energy",
      "level": "P4"
    },
    {
      "id": "s8",
      "name": "Light",
      "subject": "science",
      "theme": "Energy",
      "level": "P4"
    }
  ],
  "cards": [
    {
      "id": "m1",
      "subject": "maths",
      "topic": "Fractions",
      "question": "You spend 2/5 of your money and save 1/4 of it. What fraction is left?",
      "answer": "7/20 is left.",
      "why": "Use a common denominator: 2/5 = 8/20 and 1/4 = 5/20. Then 20/20 − 8/20 − 5/20 = 7/20."
    },
    {
      "id": "m2",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 42 cm and a length of 13 cm. What is its area?",
      "answer": "104 cm².",
      "why": "Length + width = 42 ÷ 2 = 21 cm. Width = 21 − 13 = 8 cm. Area = 13 × 8 = 104 cm²."
    },
    {
      "id": "m3",
      "subject": "maths",
      "topic": "Decimals",
      "question": "A 5 m ribbon is cut into three pieces of 0.85 m each. How much ribbon is left?",
      "answer": "2.45 m.",
      "why": "The pieces use 3 × 0.85 = 2.55 m. The remaining length is 5.00 − 2.55 = 2.45 m."
    },
    {
      "id": "m4",
      "subject": "maths",
      "topic": "Factors & multiples",
      "question": "Two lights flash every 6 seconds and 8 seconds. They flash together now. When will they next flash together?",
      "answer": "In 24 seconds.",
      "why": "Multiples of 6: 6, 12, 18, 24. Multiples of 8: 8, 16, 24. The first shared multiple is 24."
    },
    {
      "id": "m5",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles make a straight line. One is 68°. How large is the other?",
      "answer": "112°.",
      "why": "Angles on a straight line add up to 180°. So 180° − 68° = 112°."
    },
    {
      "id": "m6",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop packs 1,248 pencils into boxes of 12. It sells 39 boxes. How many boxes are left?",
      "answer": "65 boxes.",
      "why": "1,248 ÷ 12 = 104 boxes. Then 104 − 39 = 65 boxes."
    },
    {
      "id": "m7",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "Half a pie chart represents pupils who walk to school. If 120 pupils were surveyed, how many walk?",
      "answer": "60 pupils.",
      "why": "One half of 120 is 120 ÷ 2 = 60. Check what the whole chart represents before calculating a part."
    },
    {
      "id": "m8",
      "subject": "maths",
      "topic": "Symmetry",
      "question": "How many lines of symmetry does a rectangle have if it is not a square?",
      "answer": "Two.",
      "why": "One passes through the middle horizontally, the other vertically. Its diagonals are not lines of symmetry."
    },
    {
      "id": "m9",
      "subject": "maths",
      "topic": "Nets",
      "question": "A cube net has how many faces, and what shape is each face?",
      "answer": "Six equal squares.",
      "why": "A cube has six square faces. The squares must be arranged so they fold into a cube without overlapping."
    },
    {
      "id": "m10",
      "subject": "maths",
      "topic": "Problem solving",
      "question": "Three notebooks and a $2 pen cost $17. Each notebook costs the same. How much is one notebook?",
      "answer": "$5.",
      "why": "Work backwards: $17 − $2 = $15 for three notebooks. $15 ÷ 3 = $5 each."
    },
    {
      "id": "s1",
      "subject": "science",
      "topic": "Heat",
      "question": "A metal spoon and a wooden spoon are in the same hot water. Why does the metal handle get hot faster?",
      "answer": "Metal conducts heat better than wood.",
      "why": "Heat moves from the hotter water along the spoon towards the cooler handle. Metal transfers that heat faster."
    },
    {
      "id": "s2",
      "subject": "science",
      "topic": "Light",
      "question": "A torch, an opaque object and a screen stay in a straight line. What happens to the shadow when the object moves closer to the torch?",
      "answer": "The shadow becomes larger, with the torch and screen fixed.",
      "why": "The object blocks a wider spread of light rays before they reach the screen."
    },
    {
      "id": "s3",
      "subject": "science",
      "topic": "Matter",
      "question": "A sealed syringe contains air. Why can you push the plunger in a little?",
      "answer": "Air can be compressed.",
      "why": "Air is a gas. Its volume can decrease when it is compressed; it still has mass and occupies space."
    },
    {
      "id": "s4",
      "subject": "science",
      "topic": "Magnets",
      "question": "A bar repels one end of a known magnet. What can you conclude about the bar?",
      "answer": "The bar is also a magnet.",
      "why": "Repulsion is evidence of two like magnetic poles. Attraction alone could also happen with an unmagnetised magnetic material."
    },
    {
      "id": "s5",
      "subject": "science",
      "topic": "Materials",
      "question": "Why is “waterproof” a useful property for a raincoat, but not for the absorbent part of a towel?",
      "answer": "A raincoat should keep water out; a towel should absorb it.",
      "why": "Choose a material by matching its properties to the job it needs to do."
    },
    {
      "id": "s6",
      "subject": "science",
      "topic": "Digestive system",
      "question": "Where are most digested nutrients absorbed into the blood?",
      "answer": "The small intestine.",
      "why": "Digestion breaks food down into simpler substances. Absorption moves digested nutrients into the blood."
    },
    {
      "id": "s7",
      "subject": "science",
      "topic": "Plant parts",
      "question": "What are two functions of a plant’s roots?",
      "answer": "They absorb water and mineral salts, and anchor the plant.",
      "why": "Do not confuse water absorption with food-making: green leaves make food using light."
    },
    {
      "id": "s8",
      "subject": "science",
      "topic": "Life cycles",
      "question": "How is a butterfly’s life cycle different from a grasshopper’s?",
      "answer": "A butterfly has a pupa stage; a grasshopper does not.",
      "why": "Butterfly: egg → larva → pupa → adult. Grasshopper: egg → nymph → adult."
    },
    {
      "id": "s9",
      "subject": "science",
      "topic": "Living things",
      "question": "A toy car moves when switched on. Does movement alone prove that it is alive?",
      "answer": "No.",
      "why": "Use several characteristics of living things, such as growth and reproduction. Non-living objects can move too."
    },
    {
      "id": "s10",
      "subject": "science",
      "topic": "Heat",
      "question": "An ice cube melts in your hand. Does cold move from the ice into your hand?",
      "answer": "No. Heat moves from your warmer hand to the colder ice.",
      "why": "The ice gains heat and melts. Your hand loses heat and feels colder."
    },
    {
      "id": "daily-m-area-0",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 34 cm and a length of 12 cm. Find its width and area.",
      "answer": "5 cm; 60 cm².",
      "why": "Half the perimeter is 17 cm. Subtract 12 cm to get the width, then multiply length by width."
    },
    {
      "id": "daily-m-fraction-0",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 60 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "25 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 60 by 12 and multiply by 5."
    },
    {
      "id": "daily-m-money-0",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.25 each. You pay $10. What is your change?",
      "answer": "$6.25.",
      "why": "The total cost is $3.75. Subtract this from $10.00."
    },
    {
      "id": "daily-m-angle-0",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 42°. How much larger is the other angle?",
      "answer": "96° larger.",
      "why": "The other angle is 180° − 42° = 138°. The difference is 138° − 42°."
    },
    {
      "id": "daily-m-boxes-0",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 192 pencils in boxes of 8. It sells 9 full boxes. How many pencils remain?",
      "answer": "120 pencils.",
      "why": "There were 24 boxes. After selling 9, 15 boxes remain. Multiply by 8."
    },
    {
      "id": "daily-m-pie-0",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 80 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "20 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 80 is 20."
    },
    {
      "id": "daily-m-table-0",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 20 books borrowed on Monday, 35 on Tuesday and 29 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "14 books.",
      "why": "Add Monday and Wednesday: 20 + 29 = 49. Then subtract Tuesday's 35."
    },
    {
      "id": "daily-m-area-1",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 38 cm and a length of 13 cm. Find its width and area.",
      "answer": "6 cm; 78 cm².",
      "why": "Half the perimeter is 19 cm. Subtract 13 cm to get the width, then multiply length by width."
    },
    {
      "id": "daily-m-fraction-1",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 72 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "30 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 72 by 12 and multiply by 5."
    },
    {
      "id": "daily-m-money-1",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.40 each. You pay $10. What is your change?",
      "answer": "$5.80.",
      "why": "The total cost is $4.20. Subtract this from $10.00."
    },
    {
      "id": "daily-m-angle-1",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 50°. How much larger is the other angle?",
      "answer": "80° larger.",
      "why": "The other angle is 180° − 50° = 130°. The difference is 130° − 50°."
    },
    {
      "id": "daily-m-boxes-1",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 252 pencils in boxes of 9. It sells 10 full boxes. How many pencils remain?",
      "answer": "162 pencils.",
      "why": "There were 28 boxes. After selling 10, 18 boxes remain. Multiply by 9."
    },
    {
      "id": "daily-m-pie-1",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 96 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "24 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 96 is 24."
    },
    {
      "id": "daily-m-table-1",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 23 books borrowed on Monday, 39 on Tuesday and 31 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "15 books.",
      "why": "Add Monday and Wednesday: 23 + 31 = 54. Then subtract Tuesday's 39."
    },
    {
      "id": "daily-m-area-2",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 42 cm and a length of 14 cm. Find its width and area.",
      "answer": "7 cm; 98 cm².",
      "why": "Half the perimeter is 21 cm. Subtract 14 cm to get the width, then multiply length by width."
    },
    {
      "id": "daily-m-fraction-2",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 84 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "35 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 84 by 12 and multiply by 5."
    },
    {
      "id": "daily-m-money-2",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.55 each. You pay $10. What is your change?",
      "answer": "$5.35.",
      "why": "The total cost is $4.65. Subtract this from $10.00."
    },
    {
      "id": "daily-m-angle-2",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 58°. How much larger is the other angle?",
      "answer": "64° larger.",
      "why": "The other angle is 180° − 58° = 122°. The difference is 122° − 58°."
    },
    {
      "id": "daily-m-boxes-2",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 320 pencils in boxes of 10. It sells 11 full boxes. How many pencils remain?",
      "answer": "210 pencils.",
      "why": "There were 32 boxes. After selling 11, 21 boxes remain. Multiply by 10."
    },
    {
      "id": "daily-m-pie-2",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 112 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "28 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 112 is 28."
    },
    {
      "id": "daily-m-table-2",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 26 books borrowed on Monday, 43 on Tuesday and 33 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "16 books.",
      "why": "Add Monday and Wednesday: 26 + 33 = 59. Then subtract Tuesday's 43."
    },
    {
      "id": "daily-m-area-3",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 46 cm and a length of 15 cm. Find its width and area.",
      "answer": "8 cm; 120 cm².",
      "why": "Half the perimeter is 23 cm. Subtract 15 cm to get the width, then multiply length by width."
    },
    {
      "id": "daily-m-fraction-3",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 96 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "40 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 96 by 12 and multiply by 5."
    },
    {
      "id": "daily-m-money-3",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.70 each. You pay $10. What is your change?",
      "answer": "$4.90.",
      "why": "The total cost is $5.10. Subtract this from $10.00."
    },
    {
      "id": "daily-m-angle-3",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 66°. How much larger is the other angle?",
      "answer": "48° larger.",
      "why": "The other angle is 180° − 66° = 114°. The difference is 114° − 66°."
    },
    {
      "id": "daily-m-boxes-3",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 396 pencils in boxes of 11. It sells 12 full boxes. How many pencils remain?",
      "answer": "264 pencils.",
      "why": "There were 36 boxes. After selling 12, 24 boxes remain. Multiply by 11."
    },
    {
      "id": "daily-m-pie-3",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 128 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "32 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 128 is 32."
    },
    {
      "id": "daily-m-table-3",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 29 books borrowed on Monday, 47 on Tuesday and 35 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "17 books.",
      "why": "Add Monday and Wednesday: 29 + 35 = 64. Then subtract Tuesday's 47."
    },
    {
      "id": "daily-m-area-4",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 50 cm and a length of 16 cm. Find its width and area.",
      "answer": "9 cm; 144 cm².",
      "why": "Half the perimeter is 25 cm. Subtract 16 cm to get the width, then multiply length by width."
    },
    {
      "id": "daily-m-fraction-4",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 108 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "45 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 108 by 12 and multiply by 5."
    },
    {
      "id": "daily-m-money-4",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.85 each. You pay $10. What is your change?",
      "answer": "$4.45.",
      "why": "The total cost is $5.55. Subtract this from $10.00."
    },
    {
      "id": "daily-m-angle-4",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 74°. How much larger is the other angle?",
      "answer": "32° larger.",
      "why": "The other angle is 180° − 74° = 106°. The difference is 106° − 74°."
    },
    {
      "id": "daily-m-boxes-4",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 480 pencils in boxes of 12. It sells 13 full boxes. How many pencils remain?",
      "answer": "324 pencils.",
      "why": "There were 40 boxes. After selling 13, 27 boxes remain. Multiply by 12."
    },
    {
      "id": "daily-m-pie-4",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 144 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "36 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 144 is 36."
    },
    {
      "id": "daily-m-table-4",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 32 books borrowed on Monday, 51 on Tuesday and 37 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "18 books.",
      "why": "Add Monday and Wednesday: 32 + 37 = 69. Then subtract Tuesday's 51."
    },
    {
      "id": "daily-m-area-5",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 54 cm and a length of 17 cm. Find its width and area.",
      "answer": "10 cm; 170 cm².",
      "why": "Half the perimeter is 27 cm. Subtract 17 cm to get the width, then multiply length by width."
    },
    {
      "id": "daily-m-fraction-5",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 120 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "50 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 120 by 12 and multiply by 5."
    },
    {
      "id": "daily-m-money-5",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $2.00 each. You pay $10. What is your change?",
      "answer": "$4.00.",
      "why": "The total cost is $6.00. Subtract this from $10.00."
    },
    {
      "id": "daily-m-angle-5",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 82°. How much larger is the other angle?",
      "answer": "16° larger.",
      "why": "The other angle is 180° − 82° = 98°. The difference is 98° − 82°."
    },
    {
      "id": "daily-m-boxes-5",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 572 pencils in boxes of 13. It sells 14 full boxes. How many pencils remain?",
      "answer": "390 pencils.",
      "why": "There were 44 boxes. After selling 14, 30 boxes remain. Multiply by 13."
    },
    {
      "id": "daily-m-pie-5",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 160 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "40 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 160 is 40."
    },
    {
      "id": "daily-m-table-5",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 35 books borrowed on Monday, 55 on Tuesday and 39 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "19 books.",
      "why": "Add Monday and Wednesday: 35 + 39 = 74. Then subtract Tuesday's 55."
    },
    {
      "id": "daily-s-1",
      "subject": "science",
      "topic": "Living things",
      "question": "A seed is not moving. Is that enough evidence to call it non-living?",
      "answer": "No.",
      "why": "A viable seed is living even when dormant. Visible movement alone cannot distinguish living from non-living things."
    },
    {
      "id": "daily-s-2",
      "subject": "science",
      "topic": "Living things",
      "question": "A flame grows and moves. Does that make it a living thing?",
      "answer": "No. A flame is non-living.",
      "why": "Classify using the full set of characteristics of living things, not just one similar behaviour."
    },
    {
      "id": "daily-s-3",
      "subject": "science",
      "topic": "Living things",
      "question": "A bat flies. Should it be classified as a bird?",
      "answer": "No. A bat is a mammal.",
      "why": "Bats have hair and feed their young with milk. Flying is not a feature unique to birds."
    },
    {
      "id": "daily-s-4",
      "subject": "science",
      "topic": "Living things",
      "question": "A mushroom does not make its own food. Is it therefore an animal?",
      "answer": "No. It is a fungus.",
      "why": "Fungi are a separate group of living things. One shared feature does not make two things members of the same group."
    },
    {
      "id": "daily-s-5",
      "subject": "science",
      "topic": "Living things",
      "question": "An animal has six legs, three main body parts and a pair of feelers. Which group does it belong to?",
      "answer": "Insects.",
      "why": "Use the combination of body features. A spider has eight legs and is not an insect."
    },
    {
      "id": "daily-s-6",
      "subject": "science",
      "topic": "Materials",
      "question": "Why might glass be used for a window but fabric for a curtain?",
      "answer": "Glass lets us see through; curtain fabric can block the view.",
      "why": "Choose a material by its properties and the purpose of the object."
    },
    {
      "id": "daily-s-7",
      "subject": "science",
      "topic": "Materials",
      "question": "Two strips have the same size but different materials. How could you compare their flexibility fairly?",
      "answer": "Apply the same bending force and compare how much each bends.",
      "why": "Keep the dimensions and method the same so the material is the factor being compared."
    },
    {
      "id": "daily-s-8",
      "subject": "science",
      "topic": "Materials",
      "question": "Why is a paper towel useful for wiping a spill but unsuitable as a reusable raincoat?",
      "answer": "It absorbs water instead of keeping it out.",
      "why": "The same property can be useful for one purpose and unsuitable for another."
    },
    {
      "id": "daily-s-9",
      "subject": "science",
      "topic": "Materials",
      "question": "A ruler is made of plastic. Is plastic the object or the material?",
      "answer": "Plastic is the material; the ruler is the object.",
      "why": "Different objects can be made from the same material, and rulers can be made from different materials."
    },
    {
      "id": "daily-s-10",
      "subject": "science",
      "topic": "Materials",
      "question": "Why is a stretchy rubber band more suitable than a rigid wooden strip for holding a bundle of cards?",
      "answer": "The rubber band stretches around the bundle and can return towards its original shape.",
      "why": "Its elasticity helps it grip the cards. A rigid strip cannot wrap around them in the same way."
    },
    {
      "id": "daily-s-11",
      "subject": "science",
      "topic": "Life cycles",
      "question": "Put these stages in order: adult butterfly, pupa, egg, caterpillar.",
      "answer": "Egg → caterpillar → pupa → adult butterfly.",
      "why": "A caterpillar is the larval stage. Adult butterflies can lay eggs to begin the next generation."
    },
    {
      "id": "daily-s-12",
      "subject": "science",
      "topic": "Life cycles",
      "question": "A young grasshopper looks like a smaller adult without fully developed wings. What stage is it?",
      "answer": "The nymph stage.",
      "why": "Grasshoppers have a three-stage life cycle: egg, nymph and adult. There is no pupa stage."
    },
    {
      "id": "daily-s-13",
      "subject": "science",
      "topic": "Life cycles",
      "question": "What three conditions does a typical seed need to germinate?",
      "answer": "Water, oxygen and a suitable temperature.",
      "why": "Light is not usually required for germination, though a growing green seedling needs light to make food."
    },
    {
      "id": "daily-s-14",
      "subject": "science",
      "topic": "Life cycles",
      "question": "A seedling has roots and a few leaves but no flowers. Is it already an adult flowering plant?",
      "answer": "No. It is still a young plant.",
      "why": "The plant must develop further before it can flower and produce seeds."
    },
    {
      "id": "daily-s-15",
      "subject": "science",
      "topic": "Life cycles",
      "question": "Why is an adult plant producing seeds part of a cycle?",
      "answer": "The seeds can grow into new plants that later produce more seeds.",
      "why": "A life cycle describes the sequence that repeats across generations."
    },
    {
      "id": "daily-s-16",
      "subject": "science",
      "topic": "Magnets",
      "question": "A magnet attracts a steel paper clip. Does this prove the paper clip is itself a magnet?",
      "answer": "No.",
      "why": "An unmagnetised magnetic material can also be attracted. Repulsion with a known magnet is stronger evidence."
    },
    {
      "id": "daily-s-17",
      "subject": "science",
      "topic": "Magnets",
      "question": "The north pole of one magnet faces the south pole of another. What happens?",
      "answer": "They attract.",
      "why": "Unlike magnetic poles attract; like poles repel."
    },
    {
      "id": "daily-s-18",
      "subject": "science",
      "topic": "Magnets",
      "question": "Two north poles face each other. Will they attract or repel?",
      "answer": "Repel.",
      "why": "Like poles repel. Each magnet pushes the other away."
    },
    {
      "id": "daily-s-19",
      "subject": "science",
      "topic": "Magnets",
      "question": "Where does a bar magnet usually attract the most paper clips?",
      "answer": "Near its two poles.",
      "why": "The magnetic pull is strongest at the poles, rather than at the middle of the bar."
    },
    {
      "id": "daily-s-20",
      "subject": "science",
      "topic": "Magnets",
      "question": "A magnet attracts an iron nail but not an aluminium can. Are all metals magnetic?",
      "answer": "No.",
      "why": "Being a metal does not guarantee attraction to a magnet. Test the material instead of assuming."
    },
    {
      "id": "daily-s-21",
      "subject": "science",
      "topic": "Matter",
      "question": "Water is poured from a narrow cup into a wide bowl without spilling. What changes and what stays the same?",
      "answer": "Its shape changes; its volume stays the same.",
      "why": "A liquid takes the shape of its container but has a definite volume."
    },
    {
      "id": "daily-s-22",
      "subject": "science",
      "topic": "Matter",
      "question": "An inflated balloon is squeezed into a different shape. Has the air stopped occupying space?",
      "answer": "No. The air still occupies space.",
      "why": "A change of shape is not evidence that the air disappeared."
    },
    {
      "id": "daily-s-23",
      "subject": "science",
      "topic": "Matter",
      "question": "Why does an empty-looking bottle still contain matter?",
      "answer": "It contains air, which has mass and occupies space.",
      "why": "Matter does not have to be visible. Gases are matter too."
    },
    {
      "id": "daily-s-24",
      "subject": "science",
      "topic": "Matter",
      "question": "A stone moves from a box into a bowl. Does it take the shape of the bowl?",
      "answer": "No. It keeps its own shape.",
      "why": "A solid has a definite shape and volume unless it is changed by a force or another process."
    },
    {
      "id": "daily-s-25",
      "subject": "science",
      "topic": "Matter",
      "question": "Two sealed syringes contain equal volumes: one of air and one of water. Which is easier to compress?",
      "answer": "The one containing air.",
      "why": "Gases are much more easily compressed than liquids. Keep the syringe sizes and applied force comparable."
    },
    {
      "id": "daily-s-26",
      "subject": "science",
      "topic": "Plant parts",
      "question": "Which plant part mainly absorbs water from the soil?",
      "answer": "The roots.",
      "why": "The stem transports water to other parts; it is not the main part that absorbs water from soil."
    },
    {
      "id": "daily-s-27",
      "subject": "science",
      "topic": "Plant parts",
      "question": "Why does a plant with badly damaged roots often wilt even if its leaves are intact?",
      "answer": "Its roots may no longer absorb enough water.",
      "why": "Plant parts work together. Leaves still depend on water absorbed by roots and transported through the stem."
    },
    {
      "id": "daily-s-28",
      "subject": "science",
      "topic": "Plant parts",
      "question": "What are two jobs of a plant stem?",
      "answer": "Support the plant and transport substances between its parts.",
      "why": "The stem holds leaves and flowers up and provides transport pathways, including for water."
    },
    {
      "id": "daily-s-29",
      "subject": "science",
      "topic": "Plant parts",
      "question": "A green leaf receives sunlight. What important function can it carry out?",
      "answer": "Make food for the plant.",
      "why": "Roots absorb water and mineral salts; they do not absorb ready-made food from soil."
    },
    {
      "id": "daily-s-30",
      "subject": "science",
      "topic": "Plant parts",
      "question": "Why is it incorrect to say fertiliser is the food that roots drink?",
      "answer": "Roots absorb water and mineral salts; green leaves make the plant’s food.",
      "why": "Mineral salts support healthy growth but are not the food made by the plant."
    },
    {
      "id": "daily-s-31",
      "subject": "science",
      "topic": "Light",
      "question": "Can we see a book in a completely dark room without any light source?",
      "answer": "No.",
      "why": "Light must reach the book and reflect from it into our eyes."
    },
    {
      "id": "daily-s-32",
      "subject": "science",
      "topic": "Light",
      "question": "Is a mirror a light source just because it looks bright in sunlight?",
      "answer": "No. It reflects light.",
      "why": "A light source produces its own light. A mirror redirects light from another source."
    },
    {
      "id": "daily-s-33",
      "subject": "science",
      "topic": "Light",
      "question": "Why does an opaque object form a shadow when placed between a torch and a screen?",
      "answer": "It blocks light from reaching part of the screen.",
      "why": "Light travels in straight lines, so the blocked region receives less light."
    },
    {
      "id": "daily-s-34",
      "subject": "science",
      "topic": "Light",
      "question": "With a torch and screen fixed, an object moves towards the screen. What usually happens to its shadow size?",
      "answer": "The shadow becomes smaller.",
      "why": "Moving the object away from the torch means it blocks a narrower spread of rays at the screen."
    },
    {
      "id": "daily-s-35",
      "subject": "science",
      "topic": "Light",
      "question": "Clear glass and cardboard are placed in front of the same torch. Which usually makes a darker shadow?",
      "answer": "Cardboard.",
      "why": "Opaque cardboard blocks light; clear glass allows most of the light through."
    },
    {
      "id": "daily-s-36",
      "subject": "science",
      "topic": "Heat",
      "question": "A warm cup is left in a cooler room. In which direction is heat transferred?",
      "answer": "From the warmer cup to the cooler surroundings.",
      "why": "Heat transfers from a region of higher temperature to one of lower temperature."
    },
    {
      "id": "daily-s-37",
      "subject": "science",
      "topic": "Heat",
      "question": "Why is a wooden handle useful on a metal cooking pot?",
      "answer": "Wood is a poorer conductor of heat than metal.",
      "why": "Less heat is conducted along the wooden handle over the same time. It can still become hot, so care is needed."
    },
    {
      "id": "daily-s-38",
      "subject": "science",
      "topic": "Heat",
      "question": "Does wrapping a cool bottle in a towel create cold inside it?",
      "answer": "No. The towel slows heat transfer from warmer surroundings.",
      "why": "An insulating material slows heat transfer; it does not produce cold."
    },
    {
      "id": "daily-s-39",
      "subject": "science",
      "topic": "Heat",
      "question": "Two cups start with equally hot water. One has a lid. Why may that cup cool more slowly?",
      "answer": "The lid reduces heat loss from the water surface.",
      "why": "Compare the same water volumes, cup types and starting temperatures for a fair test."
    },
    {
      "id": "daily-s-40",
      "subject": "science",
      "topic": "Heat",
      "question": "A metal spoon and a wooden spoon have been in the same room for hours. The metal feels cooler. Must it have a lower temperature?",
      "answer": "No. They may be at the same room temperature.",
      "why": "Metal conducts heat away from your hand faster, so touch alone can mislead you about temperature."
    }
  ],
  "resources": [
    {
      "id": "free-money-estimation",
      "subject": "maths",
      "title": "Money problems: estimate and explain",
      "provider": "Math Mammoth",
      "url": "https://www.mathmammoth.com/practice/estimating-money",
      "topics": "Decimals · Money · Estimation",
      "focus": "Choose Not timed and 10 questions. The website checks estimates, rather than exact totals. Dollar examples are not specifically Singapore prices.",
      "task": "Complete 10 questions. For 3 of them, also calculate the exact answer on paper and explain whether your estimate is above or below it.",
      "difficulty": "Word problems",
      "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
    },
    {
      "id": "free-decimal-picture",
      "subject": "maths",
      "title": "Decimals: uncover the hidden picture",
      "provider": "Math Mammoth",
      "url": "https://www.mathmammoth.com/practice/mystery-picture-decimals",
      "topics": "Decimals · Addition & subtraction",
      "focus": "Choose two decimal places and practise both addition and subtraction. Use place value carefully.",
      "task": "Finish a picture. Write out 5 calculations, then check each answer using the inverse operation.",
      "difficulty": "Challenge practice",
      "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
    },
    {
      "id": "free-factor-hunt",
      "subject": "maths",
      "title": "Factors: find every pair",
      "provider": "Math Mammoth",
      "url": "https://www.mathmammoth.com/practice/factorfind",
      "topics": "Factors & multiples · Whole numbers",
      "focus": "Set a minimum of 20 and a maximum of 100. Find all factors, not just one factor pair.",
      "task": "Complete 10 questions. List factor pairs systematically and explain how you know you have not missed any.",
      "difficulty": "Challenge practice",
      "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
    },
    {
      "id": "free-fraction-mix",
      "subject": "maths",
      "title": "Fractions: add, subtract and simplify",
      "provider": "Math Mammoth",
      "url": "https://www.mathmammoth.com/practice/add-subtract-fractions",
      "topics": "Fractions · Mixed numbers",
      "focus": "Choose two fractions, denominators 2,3,4,6,8,12, and Not timed. Start with same denominators; try related unlike denominators when ready.",
      "task": "Complete 10 questions. Show equivalent fractions in your working and simplify each answer. Ask your tutor before using the harder mixed-number options.",
      "difficulty": "Challenge practice",
      "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
    },
    {
      "id": "free-angle-match",
      "subject": "maths",
      "title": "Angles: turn it around",
      "provider": "Math Mammoth",
      "url": "https://www.mathmammoth.com/practice/angles-matching",
      "topics": "Angles · Estimating angle measures",
      "focus": "Choose 18 tiles and multiple orientations for a harder matching game. Rotation does not change an angle.",
      "task": "Complete a round. Sketch 3 angles and use a protractor to check your estimates. Explain why turning the drawing does not change its size.",
      "difficulty": "Challenge practice",
      "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
    },
    {
      "id": "free-area-builder",
      "subject": "maths",
      "title": "Area & perimeter: build a solution",
      "provider": "Math Mammoth",
      "url": "https://www.mathmammoth.com/practice/area-builder",
      "topics": "Area & perimeter · Rectangles & squares",
      "focus": "Open the game and work with squares and rectangles. Use the exploration area to compare shapes; skip triangle extensions.",
      "task": "Solve 5 challenges. Then build two different shapes with the same area but different perimeters, and record both measurements.",
      "difficulty": "Spatial reasoning",
      "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
    },
    {
      "id": "light",
      "subject": "science",
      "title": "Light & shadows: explain what changes",
      "provider": "MCQ.SG",
      "url": "https://mcq.sg/science-mcq/light",
      "topics": "Light (P4)",
      "focus": "Use diagrams to reason about shadows and how light reaches our eyes.",
      "access": "Public practice questions with answer checks; extra features may require an account.",
      "difficulty": "Diagram reasoning",
      "task": "Complete the public questions. For two answers, explain why your chosen option is correct and why one other option is wrong."
    },
    {
      "id": "heat",
      "subject": "science",
      "title": "Heat: compare experimental setups",
      "provider": "MCQ.SG",
      "url": "https://mcq.sg/science-mcq/heat-and-temperature",
      "topics": "Heat (P4) · Materials",
      "focus": "Compare heat transfer in different setups and apply ideas about conductors.",
      "access": "Public practice questions with answer checks; extra features may require an account.",
      "difficulty": "Application",
      "task": "Complete the public questions. Choose one experimental setup and explain the direction of heat transfer."
    },
    {
      "id": "matter",
      "subject": "science",
      "title": "Matter: use evidence to decide",
      "provider": "MCQ.SG",
      "url": "https://mcq.sg/science-mcq/matter",
      "topics": "Matter (P4)",
      "focus": "Apply ideas about mass, volume and the properties of solids, liquids and gases.",
      "access": "Public practice questions with answer checks; extra features may require an account.",
      "difficulty": "Application",
      "task": "Complete the public questions and explain two answers using the words mass, volume, shape or space where appropriate."
    },
    {
      "id": "magnets",
      "subject": "science",
      "title": "Magnets: attraction or repulsion?",
      "provider": "MCQ.SG",
      "url": "https://mcq.sg/science-mcq/magnets",
      "topics": "Magnets (P3) · Materials",
      "focus": "Reason about magnetic materials and poles. Skip electromagnet extensions beyond the supplied scope.",
      "access": "Public practice questions with answer checks; extra features may require an account.",
      "difficulty": "Reasoning",
      "task": "Try the questions about magnetic materials and poles. Explain what repulsion tells you about two objects."
    }
  ],
  "exams": {
    "maths": {
      "marks": 100,
      "lines": [
        "Examination: 27 October 2026.",
        "Paper 1: 15 MCQs (30 marks), 15 short-answer questions (30 marks).",
        "Paper 2: 12 long-answer questions (40 marks)."
      ],
      "reminder": "Remember your protractor and set square."
    },
    "science": {
      "marks": 100,
      "lines": [
        "Examination: 29 October 2026.",
        "Section A: 30 MCQs (60 marks).",
        "Section B: 11 open-ended questions (40 marks).",
        "Labelled “new format” in the supplied syllabus."
      ]
    }
  },
  "focusPrompt": "Choose a topic you are still learning. Try a few questions, then explain your method or reasoning."
}$content$::jsonb)
on conflict (user_id) do update set display_name=excluded.display_name, content=excluded.content, updated_at=now();
