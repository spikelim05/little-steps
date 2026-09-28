-- Replace STUDENT_USER_UUID with this student's ID from Authentication > Users.
-- Run only in the Supabase SQL Editor after schema.sql. No passwords go in SQL.
insert into public.student_spaces (user_id, display_name, content)
values ('STUDENT_USER_UUID'::uuid, 'Lauren', $content${
  "version": 1,
  "pending": false,
  "level": "Primary level unconfirmed",
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
