// Original syllabus-aligned questions. No external question banks are copied.
const maths=[];
function math(id,topic,question,answer,why){maths.push({id:'daily-m-'+id,subject:'maths',topic,question,answer,why});}
for(let i=0;i<6;i++){
 const length=12+i,width=5+i,perimeter=2*(length+width);
 math('area-'+i,'Area & perimeter',`A rectangle has a perimeter of ${perimeter} cm and a length of ${length} cm. Find its width and area.`,`${width} cm; ${length*width} cm².`,`Half the perimeter is ${length+width} cm. Subtract ${length} cm to get the width, then multiply length by width.`);
 const total=60+12*i;
 math('fraction-'+i,'Fractions',`There are ${total} stickers. You give away 1/3 of them, then 1/4 of the original total. How many remain?`,`${total*5/12} stickers.`,`The fraction left is 1 − 1/3 − 1/4 = 5/12. Divide ${total} by 12 and multiply by 5.`);
 const cents=125+15*i,paid=1000,change=paid-3*cents;
 math('money-'+i,'Decimals',`Three identical notebooks cost $${(cents/100).toFixed(2)} each. You pay $10. What is your change?`,`$${(change/100).toFixed(2)}.`,`The total cost is $${(3*cents/100).toFixed(2)}. Subtract this from $10.00.`);
 const angle=42+8*i;
 math('angle-'+i,'Angles',`Two adjacent angles form a straight line. One angle is ${angle}°. How much larger is the other angle?`,`${180-2*angle}° larger.`,`The other angle is 180° − ${angle}° = ${180-angle}°. The difference is ${180-angle}° − ${angle}°.`);
 const boxes=24+4*i,each=8+i,sold=9+i;
 math('boxes-'+i,'Whole numbers',`A shop has ${boxes*each} pencils in boxes of ${each}. It sells ${sold} full boxes. How many pencils remain?`,`${(boxes-sold)*each} pencils.`,`There were ${boxes} boxes. After selling ${sold}, ${boxes-sold} boxes remain. Multiply by ${each}.`);
 const all=80+16*i;
 math('pie-'+i,'Pie charts',`In a pie chart of ${all} pupils, 1/4 choose swimming and 1/2 choose football. The rest choose badminton. How many choose badminton?`,`${all/4} pupils.`,`The remaining fraction is 1 − 1/4 − 1/2 = 1/4. One quarter of ${all} is ${all/4}.`);
 const a=20+3*i,b=35+4*i,c=29+2*i;
 math('table-'+i,'Tables and Line Graphs',`A table shows ${a} books borrowed on Monday, ${b} on Tuesday and ${c} on Wednesday. How many more were borrowed on Monday and Wednesday together than on Tuesday?`,`${a+c-b} books.`,`Add Monday and Wednesday: ${a} + ${c} = ${a+c}. Then subtract Tuesday's ${b}.`);
}
const scienceRows=[
 ['Living things','A seed is not moving. Is that enough evidence to call it non-living?','No.','A viable seed is living even when dormant. Visible movement alone cannot distinguish living from non-living things.'],
 ['Living things','A flame grows and moves. Does that make it a living thing?','No. A flame is non-living.','Classify using the full set of characteristics of living things, not just one similar behaviour.'],
 ['Living things','A bat flies. Should it be classified as a bird?','No. A bat is a mammal.','Bats have hair and feed their young with milk. Flying is not a feature unique to birds.'],
 ['Living things','A mushroom does not make its own food. Is it therefore an animal?','No. It is a fungus.','Fungi are a separate group of living things. One shared feature does not make two things members of the same group.'],
 ['Living things','An animal has six legs, three main body parts and a pair of feelers. Which group does it belong to?','Insects.','Use the combination of body features. A spider has eight legs and is not an insect.'],
 ['Materials','Why might glass be used for a window but fabric for a curtain?','Glass lets us see through; curtain fabric can block the view.','Choose a material by its properties and the purpose of the object.'],
 ['Materials','Two strips have the same size but different materials. How could you compare their flexibility fairly?','Apply the same bending force and compare how much each bends.','Keep the dimensions and method the same so the material is the factor being compared.'],
 ['Materials','Why is a paper towel useful for wiping a spill but unsuitable as a reusable raincoat?','It absorbs water instead of keeping it out.','The same property can be useful for one purpose and unsuitable for another.'],
 ['Materials','A ruler is made of plastic. Is plastic the object or the material?','Plastic is the material; the ruler is the object.','Different objects can be made from the same material, and rulers can be made from different materials.'],
 ['Materials','Why is a stretchy rubber band more suitable than a rigid wooden strip for holding a bundle of cards?','The rubber band stretches around the bundle and can return towards its original shape.','Its elasticity helps it grip the cards. A rigid strip cannot wrap around them in the same way.'],
 ['Life cycles','Put these stages in order: adult butterfly, pupa, egg, caterpillar.','Egg → caterpillar → pupa → adult butterfly.','A caterpillar is the larval stage. Adult butterflies can lay eggs to begin the next generation.'],
 ['Life cycles','A young grasshopper looks like a smaller adult without fully developed wings. What stage is it?','The nymph stage.','Grasshoppers have a three-stage life cycle: egg, nymph and adult. There is no pupa stage.'],
 ['Life cycles','What three conditions does a typical seed need to germinate?','Water, oxygen and a suitable temperature.','Light is not usually required for germination, though a growing green seedling needs light to make food.'],
 ['Life cycles','A seedling has roots and a few leaves but no flowers. Is it already an adult flowering plant?','No. It is still a young plant.','The plant must develop further before it can flower and produce seeds.'],
 ['Life cycles','Why is an adult plant producing seeds part of a cycle?','The seeds can grow into new plants that later produce more seeds.','A life cycle describes the sequence that repeats across generations.'],
 ['Magnets','A magnet attracts a steel paper clip. Does this prove the paper clip is itself a magnet?','No.','An unmagnetised magnetic material can also be attracted. Repulsion with a known magnet is stronger evidence.'],
 ['Magnets','The north pole of one magnet faces the south pole of another. What happens?','They attract.','Unlike magnetic poles attract; like poles repel.'],
 ['Magnets','Two north poles face each other. Will they attract or repel?','Repel.','Like poles repel. Each magnet pushes the other away.'],
 ['Magnets','Where does a bar magnet usually attract the most paper clips?','Near its two poles.','The magnetic pull is strongest at the poles, rather than at the middle of the bar.'],
 ['Magnets','A magnet attracts an iron nail but not an aluminium can. Are all metals magnetic?','No.','Being a metal does not guarantee attraction to a magnet. Test the material instead of assuming.'],
 ['Matter','Water is poured from a narrow cup into a wide bowl without spilling. What changes and what stays the same?','Its shape changes; its volume stays the same.','A liquid takes the shape of its container but has a definite volume.'],
 ['Matter','An inflated balloon is squeezed into a different shape. Has the air stopped occupying space?','No. The air still occupies space.','A change of shape is not evidence that the air disappeared.'],
 ['Matter','Why does an empty-looking bottle still contain matter?','It contains air, which has mass and occupies space.','Matter does not have to be visible. Gases are matter too.'],
 ['Matter','A stone moves from a box into a bowl. Does it take the shape of the bowl?','No. It keeps its own shape.','A solid has a definite shape and volume unless it is changed by a force or another process.'],
 ['Matter','Two sealed syringes contain equal volumes: one of air and one of water. Which is easier to compress?','The one containing air.','Gases are much more easily compressed than liquids. Keep the syringe sizes and applied force comparable.'],
 ['Plant parts','Which plant part mainly absorbs water from the soil?','The roots.','The stem transports water to other parts; it is not the main part that absorbs water from soil.'],
 ['Plant parts','Why does a plant with badly damaged roots often wilt even if its leaves are intact?','Its roots may no longer absorb enough water.','Plant parts work together. Leaves still depend on water absorbed by roots and transported through the stem.'],
 ['Plant parts','What are two jobs of a plant stem?','Support the plant and transport substances between its parts.','The stem holds leaves and flowers up and provides transport pathways, including for water.'],
 ['Plant parts','A green leaf receives sunlight. What important function can it carry out?','Make food for the plant.','Roots absorb water and mineral salts; they do not absorb ready-made food from soil.'],
 ['Plant parts','Why is it incorrect to say fertiliser is the food that roots drink?','Roots absorb water and mineral salts; green leaves make the plant’s food.','Mineral salts support healthy growth but are not the food made by the plant.'],
 ['Light','Can we see a book in a completely dark room without any light source?','No.','Light must reach the book and reflect from it into our eyes.'],
 ['Light','Is a mirror a light source just because it looks bright in sunlight?','No. It reflects light.','A light source produces its own light. A mirror redirects light from another source.'],
 ['Light','Why does an opaque object form a shadow when placed between a torch and a screen?','It blocks light from reaching part of the screen.','Light travels in straight lines, so the blocked region receives less light.'],
 ['Light','With a torch and screen fixed, an object moves towards the screen. What usually happens to its shadow size?','The shadow becomes smaller.','Moving the object away from the torch means it blocks a narrower spread of rays at the screen.'],
 ['Light','Clear glass and cardboard are placed in front of the same torch. Which usually makes a darker shadow?','Cardboard.','Opaque cardboard blocks light; clear glass allows most of the light through.'],
 ['Heat','A warm cup is left in a cooler room. In which direction is heat transferred?','From the warmer cup to the cooler surroundings.','Heat transfers from a region of higher temperature to one of lower temperature.'],
 ['Heat','Why is a wooden handle useful on a metal cooking pot?','Wood is a poorer conductor of heat than metal.','Less heat is conducted along the wooden handle over the same time. It can still become hot, so care is needed.'],
 ['Heat','Does wrapping a cool bottle in a towel create cold inside it?','No. The towel slows heat transfer from warmer surroundings.','An insulating material slows heat transfer; it does not produce cold.'],
 ['Heat','Two cups start with equally hot water. One has a lid. Why may that cup cool more slowly?','The lid reduces heat loss from the water surface.','Compare the same water volumes, cup types and starting temperatures for a fair test.'],
 ['Heat','A metal spoon and a wooden spoon have been in the same room for hours. The metal feels cooler. Must it have a lower temperature?','No. They may be at the same room temperature.','Metal conducts heat away from your hand faster, so touch alone can mislead you about temperature.']
];
export const extraFlashcards=[...maths,...scienceRows.map(([topic,question,answer,why],i)=>({id:'daily-s-'+(i+1),subject:'science',topic,question,answer,why}))];
