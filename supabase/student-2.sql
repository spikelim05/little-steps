-- Replace STUDENT_USER_UUID with this student's ID from Authentication > Users.
-- Run only in the Supabase SQL Editor after schema.sql. No passwords go in SQL.
insert into public.student_spaces (user_id, display_name, content)
values ('STUDENT_USER_UUID'::uuid, 'Caleb', $content${
  "version": 1,
  "pending": false,
  "level": "Primary 4 · St. Stephen’s School · 2026",
  "subjects": [
    {
      "id": "maths",
      "name": "Mathematics",
      "symbol": "÷",
      "line": "Build confidence, chapter by chapter.",
      "tags": "14 chapters · End-year exam 3 Nov"
    },
    {
      "id": "science",
      "name": "Science",
      "symbol": "✳",
      "line": "Explore systems, light and heat.",
      "tags": "P4 chapters + P3 revision · Exam 2 Nov"
    }
  ],
  "topics": [
    {
      "id": "s2-m1",
      "name": "Numbers to 100 000",
      "subject": "maths",
      "chapter": 1,
      "level": "P4",
      "theme": "Term 1"
    },
    {
      "id": "s2-m2",
      "name": "Factors & Multiples",
      "subject": "maths",
      "chapter": 2,
      "level": "P4",
      "theme": "Term 1"
    },
    {
      "id": "s2-m3",
      "name": "Four Operations of Whole Numbers",
      "subject": "maths",
      "chapter": 3,
      "level": "P4",
      "theme": "Term 1"
    },
    {
      "id": "s2-m4",
      "name": "Tables and Line Graphs",
      "subject": "maths",
      "chapter": 4,
      "level": "P4",
      "theme": "Term 1"
    },
    {
      "id": "s2-m5",
      "name": "Fractions (I)",
      "subject": "maths",
      "chapter": 5,
      "level": "P4",
      "theme": "Term 2"
    },
    {
      "id": "s2-m6",
      "name": "Fractions (II)",
      "subject": "maths",
      "chapter": 6,
      "level": "P4",
      "theme": "Term 2"
    },
    {
      "id": "s2-m7",
      "name": "Angles",
      "subject": "maths",
      "chapter": 7,
      "level": "P4",
      "theme": "Term 2"
    },
    {
      "id": "s2-m8",
      "name": "Rectangles and Squares",
      "subject": "maths",
      "chapter": 8,
      "level": "P4",
      "theme": "Term 2"
    },
    {
      "id": "s2-m9",
      "name": "Decimals",
      "subject": "maths",
      "chapter": 9,
      "level": "P4",
      "theme": "Term 3"
    },
    {
      "id": "s2-m10",
      "name": "Four Operations of Decimals",
      "subject": "maths",
      "chapter": 10,
      "level": "P4",
      "theme": "Term 3"
    },
    {
      "id": "s2-m11",
      "name": "Pie Charts",
      "subject": "maths",
      "chapter": 11,
      "level": "P4",
      "theme": "Term 3"
    },
    {
      "id": "s2-m12",
      "name": "Area and Perimeter",
      "subject": "maths",
      "chapter": 12,
      "level": "P4",
      "theme": "Term 4"
    },
    {
      "id": "s2-m13",
      "name": "Nets",
      "subject": "maths",
      "chapter": 13,
      "level": "P4",
      "theme": "Term 4"
    },
    {
      "id": "s2-m14",
      "name": "Symmetry",
      "subject": "maths",
      "chapter": 14,
      "level": "P4",
      "theme": "Term 4"
    },
    {
      "id": "s2-s1",
      "name": "Plant System",
      "subject": "science",
      "chapter": 1,
      "level": "P4",
      "theme": "Terms 1–2"
    },
    {
      "id": "s2-s2",
      "name": "Human Systems",
      "subject": "science",
      "chapter": 2,
      "level": "P4",
      "theme": "Term 2"
    },
    {
      "id": "s2-s3",
      "name": "Matter",
      "subject": "science",
      "chapter": 3,
      "level": "P4",
      "theme": "Term 1"
    },
    {
      "id": "s2-s4",
      "name": "Light",
      "subject": "science",
      "chapter": 4,
      "level": "P4",
      "theme": "Term 2"
    },
    {
      "id": "s2-s5",
      "name": "Shadows",
      "subject": "science",
      "chapter": 5,
      "level": "P4",
      "theme": "Terms 2–3"
    },
    {
      "id": "s2-s6",
      "name": "Heat",
      "subject": "science",
      "chapter": 6,
      "level": "P4",
      "theme": "Term 3"
    },
    {
      "id": "s2-s7",
      "name": "Effects of Heat",
      "subject": "science",
      "chapter": 7,
      "level": "P4",
      "theme": "Terms 3–4"
    },
    {
      "id": "s2-p3-1",
      "name": "Living and Non-living Things and Classification",
      "subject": "science",
      "level": "P3",
      "theme": "End-year revision · MOE P3 scope"
    },
    {
      "id": "s2-p3-2",
      "name": "Materials",
      "subject": "science",
      "level": "P3",
      "theme": "End-year revision · MOE P3 scope"
    },
    {
      "id": "s2-p3-3",
      "name": "Life Cycles of Plants",
      "subject": "science",
      "level": "P3",
      "theme": "End-year revision · MOE P3 scope"
    },
    {
      "id": "s2-p3-4",
      "name": "Life Cycles of Animals",
      "subject": "science",
      "level": "P3",
      "theme": "End-year revision · MOE P3 scope"
    },
    {
      "id": "s2-p3-5",
      "name": "Magnets",
      "subject": "science",
      "level": "P3",
      "theme": "End-year revision · MOE P3 scope"
    }
  ],
  "cards": [
    {
      "id": "s2-m1",
      "subject": "maths",
      "topic": "Fractions",
      "question": "You spend 2/5 of your money and save 1/4 of it. What fraction is left?",
      "answer": "7/20 is left.",
      "why": "Use a common denominator: 2/5 = 8/20 and 1/4 = 5/20. Then 20/20 − 8/20 − 5/20 = 7/20."
    },
    {
      "id": "s2-m2",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 42 cm and a length of 13 cm. What is its area?",
      "answer": "104 cm².",
      "why": "Length + width = 42 ÷ 2 = 21 cm. Width = 21 − 13 = 8 cm. Area = 13 × 8 = 104 cm²."
    },
    {
      "id": "s2-m3",
      "subject": "maths",
      "topic": "Decimals",
      "question": "A 5 m ribbon is cut into three pieces of 0.85 m each. How much ribbon is left?",
      "answer": "2.45 m.",
      "why": "The pieces use 3 × 0.85 = 2.55 m. The remaining length is 5.00 − 2.55 = 2.45 m."
    },
    {
      "id": "s2-m4",
      "subject": "maths",
      "topic": "Factors & multiples",
      "question": "Two lights flash every 6 seconds and 8 seconds. They flash together now. When will they next flash together?",
      "answer": "In 24 seconds.",
      "why": "Multiples of 6: 6, 12, 18, 24. Multiples of 8: 8, 16, 24. The first shared multiple is 24."
    },
    {
      "id": "s2-m5",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles make a straight line. One is 68°. How large is the other?",
      "answer": "112°.",
      "why": "Angles on a straight line add up to 180°. So 180° − 68° = 112°."
    },
    {
      "id": "s2-m6",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop packs 1,248 pencils into boxes of 12. It sells 39 boxes. How many boxes are left?",
      "answer": "65 boxes.",
      "why": "1,248 ÷ 12 = 104 boxes. Then 104 − 39 = 65 boxes."
    },
    {
      "id": "s2-m7",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "Half a pie chart represents pupils who walk to school. If 120 pupils were surveyed, how many walk?",
      "answer": "60 pupils.",
      "why": "One half of 120 is 120 ÷ 2 = 60. Check what the whole chart represents before calculating a part."
    },
    {
      "id": "s2-m8",
      "subject": "maths",
      "topic": "Symmetry",
      "question": "How many lines of symmetry does a rectangle have if it is not a square?",
      "answer": "Two.",
      "why": "One passes through the middle horizontally, the other vertically. Its diagonals are not lines of symmetry."
    },
    {
      "id": "s2-m9",
      "subject": "maths",
      "topic": "Nets",
      "question": "A cube net has how many faces, and what shape is each face?",
      "answer": "Six equal squares.",
      "why": "A cube has six square faces. The squares must be arranged so they fold into a cube without overlapping."
    },
    {
      "id": "s2-m10",
      "subject": "maths",
      "topic": "Problem solving",
      "question": "Three notebooks and a $2 pen cost $17. Each notebook costs the same. How much is one notebook?",
      "answer": "$5.",
      "why": "Work backwards: $17 − $2 = $15 for three notebooks. $15 ÷ 3 = $5 each."
    },
    {
      "id": "s2-s1",
      "subject": "science",
      "topic": "Heat",
      "question": "A metal spoon and a wooden spoon are in the same hot water. Why does the metal handle get hot faster?",
      "answer": "Metal conducts heat better than wood.",
      "why": "Heat moves from the hotter water along the spoon towards the cooler handle. Metal transfers that heat faster."
    },
    {
      "id": "s2-s2",
      "subject": "science",
      "topic": "Shadows",
      "question": "A torch, an opaque object and a screen stay in a straight line. What happens to the shadow when the object moves closer to the torch?",
      "answer": "The shadow becomes larger, with the torch and screen fixed.",
      "why": "The object blocks a wider spread of light rays before they reach the screen."
    },
    {
      "id": "s2-s3",
      "subject": "science",
      "topic": "Matter",
      "question": "A sealed syringe contains air. Why can you push the plunger in a little?",
      "answer": "Air can be compressed.",
      "why": "Air is a gas. Its volume can decrease when it is compressed; it still has mass and occupies space."
    },
    {
      "id": "s2-s4",
      "subject": "science",
      "topic": "Magnets",
      "question": "A bar repels one end of a known magnet. What can you conclude about the bar?",
      "answer": "The bar is also a magnet.",
      "why": "Repulsion is evidence of two like magnetic poles. Attraction alone could also happen with an unmagnetised magnetic material."
    },
    {
      "id": "s2-s5",
      "subject": "science",
      "topic": "Materials",
      "question": "Why is “waterproof” a useful property for a raincoat, but not for the absorbent part of a towel?",
      "answer": "A raincoat should keep water out; a towel should absorb it.",
      "why": "Choose a material by matching its properties to the job it needs to do."
    },
    {
      "id": "s2-s7",
      "subject": "science",
      "topic": "Plant System",
      "question": "What are two functions of a plant’s roots?",
      "answer": "They absorb water and mineral salts, and anchor the plant.",
      "why": "Do not confuse water absorption with food-making: green leaves make food using light."
    },
    {
      "id": "s2-s8",
      "subject": "science",
      "topic": "Life cycles",
      "question": "How is a butterfly’s life cycle different from a grasshopper’s?",
      "answer": "A butterfly has a pupa stage; a grasshopper does not.",
      "why": "Butterfly: egg → larva → pupa → adult. Grasshopper: egg → nymph → adult."
    },
    {
      "id": "s2-s9",
      "subject": "science",
      "topic": "Living things",
      "question": "A toy car moves when switched on. Does movement alone prove that it is alive?",
      "answer": "No.",
      "why": "Use several characteristics of living things, such as growth and reproduction. Non-living objects can move too."
    },
    {
      "id": "s2-s10",
      "subject": "science",
      "topic": "Heat",
      "question": "An ice cube melts in your hand. Does cold move from the ice into your hand?",
      "answer": "No. Heat moves from your warmer hand to the colder ice.",
      "why": "The ice gains heat and melts. Your hand loses heat and feels colder."
    },
    {
      "id": "s2-p3-plant-cycle",
      "subject": "science",
      "topic": "Life Cycles of Plants (P3)",
      "question": "A seedling grows into an adult flowering plant. Why is this part of a life cycle rather than a process that ends with the adult?",
      "answer": "The adult plant can produce seeds, which can grow into new plants.",
      "why": "A life cycle repeats across generations. The new seeds start the cycle again."
    },
    {
      "id": "s2-table",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A line graph shows 48 visitors on Monday, 72 on Tuesday and 60 on Wednesday. What was the increase from Monday to Tuesday?",
      "answer": "24 visitors.",
      "why": "Compare the two relevant values: 72 − 48 = 24. The Wednesday value is not needed."
    },
    {
      "id": "s2-rect",
      "subject": "maths",
      "topic": "Rectangles and Squares",
      "question": "A shape has four right angles. Is it necessarily a square?",
      "answer": "No. It could be a rectangle with unequal adjacent sides.",
      "why": "A square needs four equal sides as well as four right angles."
    },
    {
      "id": "s2-number",
      "subject": "maths",
      "topic": "Numbers to 100 000",
      "question": "What is 76 485 rounded to the nearest thousand?",
      "answer": "76 000.",
      "why": "The hundreds digit is 4, so round down. The number is closer to 76 000 than to 77 000."
    },
    {
      "id": "s2-plant",
      "subject": "science",
      "topic": "Plant System",
      "question": "Why are roots and a stem both useful in getting water to a plant’s leaves?",
      "answer": "Roots absorb water; the stem transports water towards the leaves.",
      "why": "Different plant parts have different functions and work together as a system."
    },
    {
      "id": "s2-human",
      "subject": "science",
      "topic": "Human Systems",
      "question": "Why do we describe a group of organs as a system?",
      "answer": "The organs work together to carry out a function.",
      "why": "A system contains parts that interact. Revise the particular human systems taught in your textbook with your tutor."
    },
    {
      "id": "s2-shadow-test",
      "subject": "science",
      "topic": "Shadows",
      "question": "You want to test how object-to-torch distance affects shadow size. What should stay in the same position?",
      "answer": "The torch and screen should stay fixed; move only the object between them.",
      "why": "Keep the same object and light source too. Change the object’s position, then compare the shadows."
    },
    {
      "id": "s2-expansion",
      "subject": "science",
      "topic": "Effects of Heat",
      "question": "A metal lid is stuck on a glass jar. Why might warming only the lid help loosen it?",
      "answer": "The metal lid gains heat and expands.",
      "why": "Expansion can make the lid fit less tightly. This is a thinking question, not an instruction to handle hot water."
    },
    {
      "id": "s2-contract",
      "subject": "science",
      "topic": "Effects of Heat",
      "question": "A metal rod becomes slightly shorter as it cools. What has happened?",
      "answer": "It lost heat and contracted.",
      "why": "Cooling usually causes a metal to contract. Its shorter length does not mean some metal disappeared."
    },
    {
      "id": "s2-daily-m-area-0",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 34 cm and a length of 12 cm. Find its width and area.",
      "answer": "5 cm; 60 cm².",
      "why": "Half the perimeter is 17 cm. Subtract 12 cm to get the width, then multiply length by width."
    },
    {
      "id": "s2-daily-m-fraction-0",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 60 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "25 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 60 by 12 and multiply by 5."
    },
    {
      "id": "s2-daily-m-money-0",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.25 each. You pay $10. What is your change?",
      "answer": "$6.25.",
      "why": "The total cost is $3.75. Subtract this from $10.00."
    },
    {
      "id": "s2-daily-m-angle-0",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 42°. How much larger is the other angle?",
      "answer": "96° larger.",
      "why": "The other angle is 180° − 42° = 138°. The difference is 138° − 42°."
    },
    {
      "id": "s2-daily-m-boxes-0",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 192 pencils in boxes of 8. It sells 9 full boxes. How many pencils remain?",
      "answer": "120 pencils.",
      "why": "There were 24 boxes. After selling 9, 15 boxes remain. Multiply by 8."
    },
    {
      "id": "s2-daily-m-pie-0",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 80 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "20 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 80 is 20."
    },
    {
      "id": "s2-daily-m-table-0",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 20 books borrowed on Monday, 35 on Tuesday and 29 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "14 books.",
      "why": "Add Monday and Wednesday: 20 + 29 = 49. Then subtract Tuesday's 35."
    },
    {
      "id": "s2-daily-m-area-1",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 38 cm and a length of 13 cm. Find its width and area.",
      "answer": "6 cm; 78 cm².",
      "why": "Half the perimeter is 19 cm. Subtract 13 cm to get the width, then multiply length by width."
    },
    {
      "id": "s2-daily-m-fraction-1",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 72 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "30 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 72 by 12 and multiply by 5."
    },
    {
      "id": "s2-daily-m-money-1",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.40 each. You pay $10. What is your change?",
      "answer": "$5.80.",
      "why": "The total cost is $4.20. Subtract this from $10.00."
    },
    {
      "id": "s2-daily-m-angle-1",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 50°. How much larger is the other angle?",
      "answer": "80° larger.",
      "why": "The other angle is 180° − 50° = 130°. The difference is 130° − 50°."
    },
    {
      "id": "s2-daily-m-boxes-1",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 252 pencils in boxes of 9. It sells 10 full boxes. How many pencils remain?",
      "answer": "162 pencils.",
      "why": "There were 28 boxes. After selling 10, 18 boxes remain. Multiply by 9."
    },
    {
      "id": "s2-daily-m-pie-1",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 96 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "24 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 96 is 24."
    },
    {
      "id": "s2-daily-m-table-1",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 23 books borrowed on Monday, 39 on Tuesday and 31 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "15 books.",
      "why": "Add Monday and Wednesday: 23 + 31 = 54. Then subtract Tuesday's 39."
    },
    {
      "id": "s2-daily-m-area-2",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 42 cm and a length of 14 cm. Find its width and area.",
      "answer": "7 cm; 98 cm².",
      "why": "Half the perimeter is 21 cm. Subtract 14 cm to get the width, then multiply length by width."
    },
    {
      "id": "s2-daily-m-fraction-2",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 84 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "35 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 84 by 12 and multiply by 5."
    },
    {
      "id": "s2-daily-m-money-2",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.55 each. You pay $10. What is your change?",
      "answer": "$5.35.",
      "why": "The total cost is $4.65. Subtract this from $10.00."
    },
    {
      "id": "s2-daily-m-angle-2",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 58°. How much larger is the other angle?",
      "answer": "64° larger.",
      "why": "The other angle is 180° − 58° = 122°. The difference is 122° − 58°."
    },
    {
      "id": "s2-daily-m-boxes-2",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 320 pencils in boxes of 10. It sells 11 full boxes. How many pencils remain?",
      "answer": "210 pencils.",
      "why": "There were 32 boxes. After selling 11, 21 boxes remain. Multiply by 10."
    },
    {
      "id": "s2-daily-m-pie-2",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 112 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "28 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 112 is 28."
    },
    {
      "id": "s2-daily-m-table-2",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 26 books borrowed on Monday, 43 on Tuesday and 33 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "16 books.",
      "why": "Add Monday and Wednesday: 26 + 33 = 59. Then subtract Tuesday's 43."
    },
    {
      "id": "s2-daily-m-area-3",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 46 cm and a length of 15 cm. Find its width and area.",
      "answer": "8 cm; 120 cm².",
      "why": "Half the perimeter is 23 cm. Subtract 15 cm to get the width, then multiply length by width."
    },
    {
      "id": "s2-daily-m-fraction-3",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 96 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "40 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 96 by 12 and multiply by 5."
    },
    {
      "id": "s2-daily-m-money-3",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.70 each. You pay $10. What is your change?",
      "answer": "$4.90.",
      "why": "The total cost is $5.10. Subtract this from $10.00."
    },
    {
      "id": "s2-daily-m-angle-3",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 66°. How much larger is the other angle?",
      "answer": "48° larger.",
      "why": "The other angle is 180° − 66° = 114°. The difference is 114° − 66°."
    },
    {
      "id": "s2-daily-m-boxes-3",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 396 pencils in boxes of 11. It sells 12 full boxes. How many pencils remain?",
      "answer": "264 pencils.",
      "why": "There were 36 boxes. After selling 12, 24 boxes remain. Multiply by 11."
    },
    {
      "id": "s2-daily-m-pie-3",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 128 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "32 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 128 is 32."
    },
    {
      "id": "s2-daily-m-table-3",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 29 books borrowed on Monday, 47 on Tuesday and 35 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "17 books.",
      "why": "Add Monday and Wednesday: 29 + 35 = 64. Then subtract Tuesday's 47."
    },
    {
      "id": "s2-daily-m-area-4",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 50 cm and a length of 16 cm. Find its width and area.",
      "answer": "9 cm; 144 cm².",
      "why": "Half the perimeter is 25 cm. Subtract 16 cm to get the width, then multiply length by width."
    },
    {
      "id": "s2-daily-m-fraction-4",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 108 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "45 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 108 by 12 and multiply by 5."
    },
    {
      "id": "s2-daily-m-money-4",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $1.85 each. You pay $10. What is your change?",
      "answer": "$4.45.",
      "why": "The total cost is $5.55. Subtract this from $10.00."
    },
    {
      "id": "s2-daily-m-angle-4",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 74°. How much larger is the other angle?",
      "answer": "32° larger.",
      "why": "The other angle is 180° − 74° = 106°. The difference is 106° − 74°."
    },
    {
      "id": "s2-daily-m-boxes-4",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 480 pencils in boxes of 12. It sells 13 full boxes. How many pencils remain?",
      "answer": "324 pencils.",
      "why": "There were 40 boxes. After selling 13, 27 boxes remain. Multiply by 12."
    },
    {
      "id": "s2-daily-m-pie-4",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 144 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "36 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 144 is 36."
    },
    {
      "id": "s2-daily-m-table-4",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 32 books borrowed on Monday, 51 on Tuesday and 37 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "18 books.",
      "why": "Add Monday and Wednesday: 32 + 37 = 69. Then subtract Tuesday's 51."
    },
    {
      "id": "s2-daily-m-area-5",
      "subject": "maths",
      "topic": "Area & perimeter",
      "question": "A rectangle has a perimeter of 54 cm and a length of 17 cm. Find its width and area.",
      "answer": "10 cm; 170 cm².",
      "why": "Half the perimeter is 27 cm. Subtract 17 cm to get the width, then multiply length by width."
    },
    {
      "id": "s2-daily-m-fraction-5",
      "subject": "maths",
      "topic": "Fractions",
      "question": "There are 120 stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?",
      "answer": "50 stickers.",
      "why": "The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide 120 by 12 and multiply by 5."
    },
    {
      "id": "s2-daily-m-money-5",
      "subject": "maths",
      "topic": "Decimals",
      "question": "Three identical notebooks cost $2.00 each. You pay $10. What is your change?",
      "answer": "$4.00.",
      "why": "The total cost is $6.00. Subtract this from $10.00."
    },
    {
      "id": "s2-daily-m-angle-5",
      "subject": "maths",
      "topic": "Angles",
      "question": "Two adjacent angles form a straight line. One angle is 82°. How much larger is the other angle?",
      "answer": "16° larger.",
      "why": "The other angle is 180° − 82° = 98°. The difference is 98° − 82°."
    },
    {
      "id": "s2-daily-m-boxes-5",
      "subject": "maths",
      "topic": "Whole numbers",
      "question": "A shop has 572 pencils in boxes of 13. It sells 14 full boxes. How many pencils remain?",
      "answer": "390 pencils.",
      "why": "There were 44 boxes. After selling 14, 30 boxes remain. Multiply by 13."
    },
    {
      "id": "s2-daily-m-pie-5",
      "subject": "maths",
      "topic": "Pie charts",
      "question": "In a pie chart of 160 pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?",
      "answer": "40 pupils.",
      "why": "The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of 160 is 40."
    },
    {
      "id": "s2-daily-m-table-5",
      "subject": "maths",
      "topic": "Tables and Line Graphs",
      "question": "A table shows 35 books borrowed on Monday, 55 on Tuesday and 39 on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?",
      "answer": "19 books.",
      "why": "Add Monday and Wednesday: 35 + 39 = 74. Then subtract Tuesday's 55."
    },
    {
      "id": "s2-daily-s-1",
      "subject": "science",
      "topic": "Living things",
      "question": "A seed is not moving. Is that enough evidence to call it non-living?",
      "answer": "No.",
      "why": "A viable seed is living even when dormant. Visible movement alone cannot distinguish living from non-living things."
    },
    {
      "id": "s2-daily-s-2",
      "subject": "science",
      "topic": "Living things",
      "question": "A flame grows and moves. Does that make it a living thing?",
      "answer": "No. A flame is non-living.",
      "why": "Classify using the full set of characteristics of living things, not just one similar behaviour."
    },
    {
      "id": "s2-daily-s-3",
      "subject": "science",
      "topic": "Living things",
      "question": "A bat flies. Should it be classified as a bird?",
      "answer": "No. A bat is a mammal.",
      "why": "Bats have hair and feed their young with milk. Flying is not a feature unique to birds."
    },
    {
      "id": "s2-daily-s-4",
      "subject": "science",
      "topic": "Living things",
      "question": "A mushroom does not make its own food. Is it therefore an animal?",
      "answer": "No. It is a fungus.",
      "why": "Fungi are a separate group of living things. One shared feature does not make two things members of the same group."
    },
    {
      "id": "s2-daily-s-5",
      "subject": "science",
      "topic": "Living things",
      "question": "An animal has six legs, three main body parts and a pair of feelers. Which group does it belong to?",
      "answer": "Insects.",
      "why": "Use the combination of body features. A spider has eight legs and is not an insect."
    },
    {
      "id": "s2-daily-s-6",
      "subject": "science",
      "topic": "Materials",
      "question": "Why might glass be used for a window but fabric for a curtain?",
      "answer": "Glass lets us see through; curtain fabric can block the view.",
      "why": "Choose a material by its properties and the purpose of the object."
    },
    {
      "id": "s2-daily-s-7",
      "subject": "science",
      "topic": "Materials",
      "question": "Two strips have the same size but different materials. How could you compare their flexibility fairly?",
      "answer": "Apply the same bending force and compare how much each bends.",
      "why": "Keep the dimensions and method the same so the material is the factor being compared."
    },
    {
      "id": "s2-daily-s-8",
      "subject": "science",
      "topic": "Materials",
      "question": "Why is a paper towel useful for wiping a spill but unsuitable as a reusable raincoat?",
      "answer": "It absorbs water instead of keeping it out.",
      "why": "The same property can be useful for one purpose and unsuitable for another."
    },
    {
      "id": "s2-daily-s-9",
      "subject": "science",
      "topic": "Materials",
      "question": "A ruler is made of plastic. Is plastic the object or the material?",
      "answer": "Plastic is the material; the ruler is the object.",
      "why": "Different objects can be made from the same material, and rulers can be made from different materials."
    },
    {
      "id": "s2-daily-s-10",
      "subject": "science",
      "topic": "Materials",
      "question": "Why is a stretchy rubber band more suitable than a rigid wooden strip for holding a bundle of cards?",
      "answer": "The rubber band stretches around the bundle and can return towards its original shape.",
      "why": "Its elasticity helps it grip the cards. A rigid strip cannot wrap around them in the same way."
    },
    {
      "id": "s2-daily-s-11",
      "subject": "science",
      "topic": "Life cycles",
      "question": "Put these stages in order: adult butterfly, pupa, egg, caterpillar.",
      "answer": "Egg → caterpillar → pupa → adult butterfly.",
      "why": "A caterpillar is the larval stage. Adult butterflies can lay eggs to begin the next generation."
    },
    {
      "id": "s2-daily-s-12",
      "subject": "science",
      "topic": "Life cycles",
      "question": "A young grasshopper looks like a smaller adult without fully developed wings. What stage is it?",
      "answer": "The nymph stage.",
      "why": "Grasshoppers have a three-stage life cycle: egg, nymph and adult. There is no pupa stage."
    },
    {
      "id": "s2-daily-s-13",
      "subject": "science",
      "topic": "Life cycles",
      "question": "What three conditions does a typical seed need to germinate?",
      "answer": "Water, oxygen and a suitable temperature.",
      "why": "Light is not usually required for germination, though a growing green seedling needs light to make food."
    },
    {
      "id": "s2-daily-s-14",
      "subject": "science",
      "topic": "Life cycles",
      "question": "A seedling has roots and a few leaves but no flowers. Is it already an adult flowering plant?",
      "answer": "No. It is still a young plant.",
      "why": "The plant must develop further before it can flower and produce seeds."
    },
    {
      "id": "s2-daily-s-15",
      "subject": "science",
      "topic": "Life cycles",
      "question": "Why is an adult plant producing seeds part of a cycle?",
      "answer": "The seeds can grow into new plants that later produce more seeds.",
      "why": "A life cycle describes the sequence that repeats across generations."
    },
    {
      "id": "s2-daily-s-16",
      "subject": "science",
      "topic": "Magnets",
      "question": "A magnet attracts a steel paper clip. Does this prove the paper clip is itself a magnet?",
      "answer": "No.",
      "why": "An unmagnetised magnetic material can also be attracted. Repulsion with a known magnet is stronger evidence."
    },
    {
      "id": "s2-daily-s-17",
      "subject": "science",
      "topic": "Magnets",
      "question": "The north pole of one magnet faces the south pole of another. What happens?",
      "answer": "They attract.",
      "why": "Unlike magnetic poles attract; like poles repel."
    },
    {
      "id": "s2-daily-s-18",
      "subject": "science",
      "topic": "Magnets",
      "question": "Two north poles face each other. Will they attract or repel?",
      "answer": "Repel.",
      "why": "Like poles repel. Each magnet pushes the other away."
    },
    {
      "id": "s2-daily-s-19",
      "subject": "science",
      "topic": "Magnets",
      "question": "Where does a bar magnet usually attract the most paper clips?",
      "answer": "Near its two poles.",
      "why": "The magnetic pull is strongest at the poles, rather than at the middle of the bar."
    },
    {
      "id": "s2-daily-s-20",
      "subject": "science",
      "topic": "Magnets",
      "question": "A magnet attracts an iron nail but not an aluminium can. Are all metals magnetic?",
      "answer": "No.",
      "why": "Being a metal does not guarantee attraction to a magnet. Test the material instead of assuming."
    },
    {
      "id": "s2-daily-s-21",
      "subject": "science",
      "topic": "Matter",
      "question": "Water is poured from a narrow cup into a wide bowl without spilling. What changes and what stays the same?",
      "answer": "Its shape changes; its volume stays the same.",
      "why": "A liquid takes the shape of its container but has a definite volume."
    },
    {
      "id": "s2-daily-s-22",
      "subject": "science",
      "topic": "Matter",
      "question": "An inflated balloon is squeezed into a different shape. Has the air stopped occupying space?",
      "answer": "No. The air still occupies space.",
      "why": "A change of shape is not evidence that the air disappeared."
    },
    {
      "id": "s2-daily-s-23",
      "subject": "science",
      "topic": "Matter",
      "question": "Why does an empty-looking bottle still contain matter?",
      "answer": "It contains air, which has mass and occupies space.",
      "why": "Matter does not have to be visible. Gases are matter too."
    },
    {
      "id": "s2-daily-s-24",
      "subject": "science",
      "topic": "Matter",
      "question": "A stone moves from a box into a bowl. Does it take the shape of the bowl?",
      "answer": "No. It keeps its own shape.",
      "why": "A solid has a definite shape and volume unless it is changed by a force or another process."
    },
    {
      "id": "s2-daily-s-25",
      "subject": "science",
      "topic": "Matter",
      "question": "Two sealed syringes contain equal volumes: one of air and one of water. Which is easier to compress?",
      "answer": "The one containing air.",
      "why": "Gases are much more easily compressed than liquids. Keep the syringe sizes and applied force comparable."
    },
    {
      "id": "s2-daily-s-26",
      "subject": "science",
      "topic": "Plant System",
      "question": "Which plant part mainly absorbs water from the soil?",
      "answer": "The roots.",
      "why": "The stem transports water to other parts; it is not the main part that absorbs water from soil."
    },
    {
      "id": "s2-daily-s-27",
      "subject": "science",
      "topic": "Plant System",
      "question": "Why does a plant with badly damaged roots often wilt even if its leaves are intact?",
      "answer": "Its roots may no longer absorb enough water.",
      "why": "Plant parts work together. Leaves still depend on water absorbed by roots and transported through the stem."
    },
    {
      "id": "s2-daily-s-28",
      "subject": "science",
      "topic": "Plant System",
      "question": "What are two jobs of a plant stem?",
      "answer": "Support the plant and transport substances between its parts.",
      "why": "The stem holds leaves and flowers up and provides transport pathways, including for water."
    },
    {
      "id": "s2-daily-s-29",
      "subject": "science",
      "topic": "Plant System",
      "question": "A green leaf receives sunlight. What important function can it carry out?",
      "answer": "Make food for the plant.",
      "why": "Roots absorb water and mineral salts; they do not absorb ready-made food from soil."
    },
    {
      "id": "s2-daily-s-30",
      "subject": "science",
      "topic": "Plant System",
      "question": "Why is it incorrect to say fertiliser is the food that roots drink?",
      "answer": "Roots absorb water and mineral salts; green leaves make the plant’s food.",
      "why": "Mineral salts support healthy growth but are not the food made by the plant."
    },
    {
      "id": "s2-daily-s-31",
      "subject": "science",
      "topic": "Light",
      "question": "Can we see a book in a completely dark room without any light source?",
      "answer": "No.",
      "why": "Light must reach the book and reflect from it into our eyes."
    },
    {
      "id": "s2-daily-s-32",
      "subject": "science",
      "topic": "Light",
      "question": "Is a mirror a light source just because it looks bright in sunlight?",
      "answer": "No. It reflects light.",
      "why": "A light source produces its own light. A mirror redirects light from another source."
    },
    {
      "id": "s2-daily-s-33",
      "subject": "science",
      "topic": "Light",
      "question": "Why does an opaque object form a shadow when placed between a torch and a screen?",
      "answer": "It blocks light from reaching part of the screen.",
      "why": "Light travels in straight lines, so the blocked region receives less light."
    },
    {
      "id": "s2-daily-s-34",
      "subject": "science",
      "topic": "Light",
      "question": "With a torch and screen fixed, an object moves towards the screen. What usually happens to its shadow size?",
      "answer": "The shadow becomes smaller.",
      "why": "Moving the object away from the torch means it blocks a narrower spread of rays at the screen."
    },
    {
      "id": "s2-daily-s-35",
      "subject": "science",
      "topic": "Light",
      "question": "Clear glass and cardboard are placed in front of the same torch. Which usually makes a darker shadow?",
      "answer": "Cardboard.",
      "why": "Opaque cardboard blocks light; clear glass allows most of the light through."
    },
    {
      "id": "s2-daily-s-36",
      "subject": "science",
      "topic": "Heat",
      "question": "A warm cup is left in a cooler room. In which direction is heat transferred?",
      "answer": "From the warmer cup to the cooler surroundings.",
      "why": "Heat transfers from a region of higher temperature to one of lower temperature."
    },
    {
      "id": "s2-daily-s-37",
      "subject": "science",
      "topic": "Heat",
      "question": "Why is a wooden handle useful on a metal cooking pot?",
      "answer": "Wood is a poorer conductor of heat than metal.",
      "why": "Less heat is conducted along the wooden handle over the same time. It can still become hot, so care is needed."
    },
    {
      "id": "s2-daily-s-38",
      "subject": "science",
      "topic": "Heat",
      "question": "Does wrapping a cool bottle in a towel create cold inside it?",
      "answer": "No. The towel slows heat transfer from warmer surroundings.",
      "why": "An insulating material slows heat transfer; it does not produce cold."
    },
    {
      "id": "s2-daily-s-39",
      "subject": "science",
      "topic": "Heat",
      "question": "Two cups start with equally hot water. One has a lid. Why may that cup cool more slowly?",
      "answer": "The lid reduces heat loss from the water surface.",
      "why": "Compare the same water volumes, cup types and starting temperatures for a fair test."
    },
    {
      "id": "s2-daily-s-40",
      "subject": "science",
      "topic": "Heat",
      "question": "A metal spoon and a wooden spoon have been in the same room for hours. The metal feels cooler. Must it have a lower temperature?",
      "answer": "No. They may be at the same room temperature.",
      "why": "Metal conducts heat away from your hand faster, so touch alone can mislead you about temperature."
    }
  ],
  "resources": [
    {
      "id": "math-word-problems",
      "subject": "maths",
      "title": "Multi-step Maths practice",
      "provider": "Home Campus",
      "url": "https://my.homecampus.com.sg/Practice/Primary_4_Mathematics",
      "topics": "Whole numbers · Fractions · Decimals · Area & perimeter",
      "focus": "Choose Word Problems under whole numbers, fractions or decimals, or Composite Figures under measurement. Show every step of your working.",
      "access": "Topic practice index; a provider account or subscription may be required.",
      "difficulty": "Problem solving",
      "task": "Complete 5 word problems or composite-figure questions. Show your working on paper and explain one question you found difficult to your tutor."
    },
    {
      "id": "decimal-word-problems",
      "subject": "maths",
      "title": "Decimals in word problems",
      "provider": "IXL Singapore",
      "url": "https://sg.ixl.com/maths/primary-4/add-and-subtract-decimals-word-problems",
      "topics": "Decimals · Addition & subtraction · Problem solving",
      "focus": "Translate a word problem into calculations, keeping decimal places aligned.",
      "access": "Limited practice may be available; continued practice may require a subscription.",
      "difficulty": "Application",
      "task": "Try 5 questions, or as many as the free access allows. Record your working and any questions you want to review."
    },
    {
      "id": "light",
      "subject": "science",
      "title": "Light & shadows: explain what changes",
      "provider": "MCQ.SG",
      "url": "https://mcq.sg/science-mcq/light",
      "topics": "Ch 4: Light · Ch 5: Shadows",
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
      "topics": "Ch 6: Heat · Ch 7: Effects of Heat",
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
      "topics": "Ch 3: Matter",
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
        "End Year Exam: Wednesday, 28 October 2026.",
        "Assessment weighting: 60% of the year.",
        "All 14 chapters are included. The supplied plan does not give question counts or paper sections."
      ]
    },
    "science": {
      "marks": 100,
      "lines": [
        "End Year Examination: Thursday, 29 October 2026.",
        "Assessment weighting: 60% of the year.",
        "Chapters 1–7, plus topics learned from the P3 Inspiring Science Textbook and Activity Book.",
        "The supplied plan does not give question counts or paper sections."
      ]
    }
  },
  "contentNotice": "P3 Inspiring Science revision: living things and classification, materials, plant and animal life cycles, and magnets. The school’s 2026 booklist confirms Inspiring Science P3; these revision groups follow MOE’s 2023 P3 syllabus. They are not a separately verified school P3 assessment plan. Human Systems subtopics are not specified in the supplied school plan.",
  "assessments": [
    {
      "subject": "maths",
      "term": 1,
      "weight": 10,
      "marks": 50,
      "title": "Weighted Assessment 1",
      "dates": "23 February – 6 March 2026",
      "weeks": "Weeks 8–9",
      "scope": [
        "Ch 1: Numbers to 100 000",
        "Ch 2: Factors & Multiples",
        "Ch 3: Four Operations of Whole Numbers",
        "Ch 4: Tables and Line Graphs"
      ]
    },
    {
      "subject": "maths",
      "term": 2,
      "weight": 15,
      "marks": 50,
      "title": "Weighted Assessment 2",
      "dates": "11–22 May 2026",
      "weeks": "Weeks 8–9",
      "scope": [
        "Ch 5: Fractions (I)",
        "Ch 6: Fractions (II)",
        "Ch 7: Angles",
        "Ch 8: Rectangles and Squares"
      ]
    },
    {
      "subject": "maths",
      "term": 3,
      "weight": 15,
      "marks": 50,
      "title": "Weighted Assessment 3",
      "dates": "6–24 July 2026",
      "weeks": "Weeks 8–9 (as printed)",
      "scope": [
        "Ch 9: Decimals",
        "Ch 10: Four Operations of Decimals",
        "Ch 11: Pie Charts"
      ],
      "note": "The school sheet pairs Weeks 8–9 with 6–24 July. Confirm the timing with your tutor; both are transcribed as printed."
    },
    {
      "subject": "maths",
      "term": 4,
      "weight": 60,
      "marks": 100,
      "title": "End Year Exam",
      "dates": "28 October 2026 (Wednesday)",
      "weeks": "",
      "scope": [
        "Ch 1: Numbers to 100 000",
        "Ch 2: Factors & Multiples",
        "Ch 3: Four Operations of Whole Numbers",
        "Ch 4: Tables and Line Graphs",
        "Ch 5: Fractions (I)",
        "Ch 6: Fractions (II)",
        "Ch 7: Angles",
        "Ch 8: Rectangles and Squares",
        "Ch 9: Decimals",
        "Ch 10: Four Operations of Decimals",
        "Ch 11: Pie Charts",
        "Ch 12: Area and Perimeter",
        "Ch 13: Nets",
        "Ch 14: Symmetry"
      ]
    },
    {
      "subject": "science",
      "term": 1,
      "weight": 10,
      "marks": 15,
      "title": "Weighted Assessment 1",
      "dates": "23 February – 6 March 2026",
      "weeks": "Weeks 8–9",
      "scope": [
        "Ch 3: Matter"
      ]
    },
    {
      "subject": "science",
      "term": 2,
      "weight": 15,
      "marks": 15,
      "title": "Weighted Assessment 2",
      "dates": "11–22 May 2026",
      "weeks": "Weeks 8–9",
      "scope": [
        "Ch 1: Plant System",
        "Ch 2: Human Systems"
      ]
    },
    {
      "subject": "science",
      "term": 3,
      "weight": 15,
      "marks": 15,
      "title": "Weighted Assessment 3",
      "dates": "6–24 July 2026",
      "weeks": "Weeks 2–4",
      "scope": [
        "Ch 4: Light",
        "Ch 5: Shadows"
      ],
      "note": "Performance task with rubrics."
    },
    {
      "subject": "science",
      "term": 4,
      "weight": 60,
      "marks": 100,
      "title": "End Year Examination",
      "dates": "29 October 2026 (Thursday)",
      "weeks": "",
      "scope": [
        "Ch 1: Plant System",
        "Ch 2: Human Systems",
        "Ch 3: Matter",
        "Ch 4: Light",
        "Ch 5: Shadows",
        "Ch 6: Heat",
        "Ch 7: Effects of Heat"
      ],
      "note": "Also includes topics learned from the P3 Inspiring Science Textbook and Activity Book; P3 revision groups follow the MOE syllabus: living things and classification, materials, plant and animal life cycles, and magnets."
    }
  ],
  "focusPrompt": "Pick a chapter you are still learning: try a Maths problem or explain a Science observation. Include Area and Perimeter, Nets, Symmetry and Effects of Heat in your Term 4 revision, then revisit earlier chapters for the end-year exams. For P3 Science, compare materials, classify living things, explain a plant or animal life cycle, or reason about magnetic poles."
}$content$::jsonb)
on conflict (user_id) do update set display_name=excluded.display_name, content=excluded.content, updated_at=now();
