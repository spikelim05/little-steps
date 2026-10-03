// Free online practice pages checked 3 October 2026. Provider books are optional.
// Original task prompts; third-party questions remain on their source websites.
const practice=(id,title,slug,topics,focus,task,difficulty='Challenge practice')=>({
 id,subject:'maths',title,provider:'Math Mammoth',url:`https://www.mathmammoth.com/practice/${slug}`,
 topics,focus,task,difficulty,
 access:'Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026.'
});
export const freeMathsResources=[
 practice('free-money-estimation','Money problems: estimate and explain','estimating-money','Decimals · Money · Estimation',
  'Choose Not timed and 10 questions. The website checks estimates, rather than exact totals. Dollar examples are not specifically Singapore prices.',
  'Complete 10 questions. For 3 of them, also calculate the exact answer on paper and explain whether your estimate is above or below it.','Word problems'),
 practice('free-decimal-picture','Decimals: uncover the hidden picture','mystery-picture-decimals','Decimals · Addition & subtraction',
  'Choose two decimal places and practise both addition and subtraction. Use place value carefully.',
  'Finish a picture. Write out 5 calculations, then check each answer using the inverse operation.'),
 practice('free-factor-hunt','Factors: find every pair','factorfind','Factors & multiples · Whole numbers',
  'Set a minimum of 20 and a maximum of 100. Find all factors, not just one factor pair.',
  'Complete 10 questions. List factor pairs systematically and explain how you know you have not missed any.'),
 practice('free-fraction-mix','Fractions: add, subtract and simplify','add-subtract-fractions','Fractions · Mixed numbers',
  'Choose two fractions, denominators 2,3,4,6,8,12, and Not timed. Start with same denominators; try related unlike denominators when ready.',
  'Complete 10 questions. Show equivalent fractions in your working and simplify each answer. Ask your tutor before using the harder mixed-number options.'),
 practice('free-angle-match','Angles: turn it around','angles-matching','Angles · Estimating angle measures',
  'Choose 18 tiles and multiple orientations for a harder matching game. Rotation does not change an angle.',
  'Complete a round. Sketch 3 angles and use a protractor to check your estimates. Explain why turning the drawing does not change its size.'),
 practice('free-area-builder','Area & perimeter: build a solution','area-builder','Area & perimeter · Rectangles & squares',
  'Open the game and work with squares and rectangles. Use the exploration area to compare shapes; skip triangle extensions.',
  'Solve 5 challenges. Then build two different shapes with the same area but different perimeters, and record both measurements.','Spatial reasoning')
];
