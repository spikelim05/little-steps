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
        "End Year Exam: Tuesday, 3 November 2026.",
        "Assessment weighting: 60% of the year.",
        "All 14 chapters are included. The supplied plan does not give question counts or paper sections."
      ]
    },
    "science": {
      "marks": 100,
      "lines": [
        "End Year Examination: Monday, 2 November 2026.",
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
      "dates": "3 November 2026 (Tuesday)",
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
      "dates": "2 November 2026 (Monday)",
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
