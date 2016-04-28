-- *****************************************************************************
-- This script contains INSERT statements for populating the tool library tables
-- *****************************************************************************

BEGIN;

INSERT INTO members (member_license, member_name, member_phone, member_fees) VALUES ('UK34567', 'Colin', '1234567890', 0.00);
INSERT INTO members (member_license, member_name, member_phone, member_fees) VALUES ('US54678', 'John Cena', '0987654321', 25.00);
INSERT INTO members (member_license, member_name, member_phone, member_fees) VALUES ('OH34562', 'Wade Wilson', '1234509876', 10.00);

INSERT INTO librarian_users(librarian_username, librarian_password, librarian_salt) VALUES('tom', 'N/OACUsgGfSZ0w1e8gtiZg==', 's4Gx/hpzBC71b/0s8BUTM0Tf0MFFnF4En/ic6R6W7OrIwOjm10S9FURZ5Hx8qKf7dExbLMON29tkUH2fhVH6R4jnhEnY/fVvOkTOUyEH+XL5bvV+5yUtmf2iIro7glgXl9q9ywvhzTUvq/JdfR9HsicIxvx2ETgiWO6OBPSjdzA=');
INSERT INTO librarian_users(librarian_username, librarian_password, librarian_salt) VALUES('dan', 'ESP/clr2/cd0mY6vh2jZdg==', 'viuJNsOEsclnJ3c6EKsJ4j8NqrkPvetBe21qmm1gFcFfWxJ2Xvu3WWSpXpYiHKPtRnGw+kXUDm6GHB82RcUdU1hzd+pabphasfRQjuHxl9bS5Spb2IKmnwvxC7JJPfKTXjxaOa6yf3Tr+g25AEb8ZMvUnWNzKENeYZxE1TADf00=');
INSERT INTO librarian_users(librarian_username, librarian_password, librarian_salt) VALUES('jack', 'KF90i2MXib1FFaFA1udkaQ==', 'j9DBJLRunLCjjkk0ALlB+EMJHVMkIQdf0akTskTOEP0uMFATCcEajDaeoUcQ/n7jJVQaUpkHtD/OSUtWhbl4smR4i5y8EGTzYokDgHerGUgZymxDmlE28tloXs1aHOHaL6gtHCQI/NS5KwsBlyWeCR+4zRUfq0PJxgyRy3a9b9g=');

INSERT INTO tool_category(tool_category_id, name) VALUES(1, 'Electric Power Tool');
INSERT INTO tool_category(tool_category_id, name) VALUES(2, 'Gasoline Power Tool');
INSERT INTO tool_category(tool_category_id, name) VALUES(3, 'Hand Tool');

INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(1,'Aerator',1,7,'Used to aerate lawns');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(2,'Air Pump',1,7,'Electric pump for tires, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(3,'Amp Meter',1,7,'Used to check for live electrical wires.  Some measure voltage too');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(4,'Auger, Brace',3,7,'Old fashioned handle used to hold auger bit');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(5,'Auger, Drain',3,7,'Tightly coiled metal line used to unclog drains.  Ours fit small drains only.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(6,'Auger, Toilet',3,7,'Drain auger on a stick.  Used to unclog toilet drains.  Manual only');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(7,'Awl',3,7,'Hand-held pointed spike used for making holes in wood');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(8,'Axe ',3,7,'Used for chopping splitting wood');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(9,'Battery Charger',1,7,'Used to charge vehicle batteries');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(10,'Bit Set, Auger',3,7,'Set of bits for a drill.  Auger bits are spiral shapes used for drilling holes in wood.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(11,'Bit Set, Drill',3,7,'Set of drill bits for drilling holes');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(12,'Broadfork',3,7,'Used to break up sod, or deep-aeration in garden beds');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(13,'Broom, House',3,7,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(14,'Broom, Street',3,7,'Street brooms have longer stiffer bristles than house brooms.  Utility brooms can be used inside or outside');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(15,'Brush, Wire',3,7,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(16,'Carpet Kicker',3,7,'When laying carpet, used to push carpet edge in place with your knee or foot');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(17,'Carpet Seam Roller',3,7,'Used to lay down carpet between the seams');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(18,'Carpet Seamer Iron',3,7,'Used to lay down carpet between the seams');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(19,'Caulking Gun',3,7,'Holster and trigger for applying caulk from a tube');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(20,'Chain Hoist',3,7,'Device used for lifting or lowering a load by means of a lift-wheel around which chain wraps');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(21,'Compressor, 1-gallon',1,7,'Used to compress air, and power air tools, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(22,'Compressor, 6-gallon',1,7,'Used to compress air, and power air tools, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(23,'Conduit Bender',3,7,'Used to bend conduit piping in plumbing and electrical work.  Small one is hand-held size.  Large one is several feet tall');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(24,'Cultivator, Long Handle',3,7,'Four tined hand tool.  Used standing upright for removing weeds in between plantings and light soil tillage');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(25,'Cultivator, Short Handle',3,7,'Three tined hand tool.  Used near the ground for removing weeds in between plantings and light soil tillage');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(26,'Cultivator, Weeding Fork',3,7,'Used near the ground for removing weeds in between plantings and light soil tillage');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(27,'Dolly, Furniture',3,7,'Used for hauling heavy loads');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(28,'Dolly, Appliance',3,7,'Used for hauling heavy loads');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(29,'Drill, Basic',1,7,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(30,'Drill, Hammer',1,7,'Used for drilling into concrete or other heavy-duty material. Has a pulsating hammer setting.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(31,'Drill, Pneumatic',1,7,'Small drill that is powered by an air compressor');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(32,'Drill, Right angle',1,7,'Used for drilling things situated at an angle');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(33,'Drywall Corner Bead Tool',3,7,'Used to install corner bead on drywall');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(34,'Drywall Gun',1,7,'Screw gun for installing drywall');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(35,'Edger, Cement',3,7,'Used to shape the outer edge of wet cement when its being laid');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(36,'Edger, Lawn, Electric',1,7,'Used to cut ground foliage back from the edge of a sidewalk, driveway, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(37,'Edger, Lawn, Gasoline',2,7,'Used to cut ground foliage back from the edge of a sidewalk, driveway, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(38,'Edger, Lawn, Manual',3,7,'Used to cut ground foliage back from the edge of a sidewalk, driveway, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(39,'Engraver',1,7,'Hand held object with pointed tip. Used for writing onto metal, masonry, etc.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(40,'Extension Cord, 100-ft',3,7,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(41,'Extension Cord, 75-ft',3,7,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(42,'Extension Cord, 50-ft',3,7,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(43,'Extension Cord, 25-ft',3,7,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(44,'Extension Pole, Fiberglass',3,7,'Pole that extends. Various heads can be screwed onto the end for painting, smoothing, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(45,'Extension Pole, Wood',3,7,'Pole that extends. Various heads can be screwed onto the end for painting, smoothing, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(46,'Extension Pole, Plastic',3,7,'Pole that extends. Various heads can be screwed onto the end for painting, smoothing, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(47,'Fence Pole Pounder',3,7,'Used to pound fence poles into place.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(48,'File, Metal',3,7,'Steel bar with ridged surface. Used for filing metal.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(49,'Flare Tool',3,7,'Used in plumbing and electrical work to fit pipes together.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(50,'Float, Wood',3,7,'Used to lay grout, concrete, cement, etc.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(51,'Float, Steel',3,7,'Used to lay grout, concrete, cement, etc.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(52,'Float, Aluminum',3,7,'Used to lay grout, concrete, cement, etc.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(53,'Float, Bull',3,7,'Used for smoothing wet concrete. Bull sizes are several feet long.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(54,'Fork, Digging, Garden fork',3,7,'Thicker 4 tined fork. Used for digging and turning soil. ');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(55,'Fork, Digging, Spade fork',3,7,'Thicker 4 tined fork. Used for digging and turning soil. ');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(56,'Fork, Pitch',3,7,'Thinner tined fork. Used for moving light material (such as straw)');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(57,'Glazing Tool, 2-in1',3,7,'Used to spread and remove putty. One end is used to spread, the other to remove.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(58,'Grass Shear',3,7,'Handheld tool similar to pruning shears. Used to cut grass in small areas.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(59,'Grinder, Angle, Side grinder',1,7,'Handheld power tool used for cutting, grinding. Customer buys their own plate - for grinding into masonry, metal, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(60,'Grinder, Angle, Disc grinder',1,7,'Handheld power tool used for cutting, grinding. Customer buys their own plate - for grinding into masonry, metal, etc');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(61,'Gun, Glue',1,7,'Used to glue together materials with hot, durable glue');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(62,'Hammer, Plastic-tip',3,7,'Hammer w/ 1 hard plastic and 1 soft plastic tip. Used on soft materials easily damaged');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(63,'Hammer, Ball-Peen',3,7,'Steel hammer with 1 round end and 1 flat end. Used in metal work, driving masonry nails, and striking cold chisel');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(64,'Hammer, Brick',3,7,'Used for hammering brick, masonry');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(65,'Hammer, Claw',3,7,'Basic carpenter''s hammer. Used for driving and prying nails, framing, finishing, fitting parts, demolition');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(66,'Hammer, Rubber-Mallet',3,7,'Hammer with a rubber end. Used on soft materials easily damaged, like sheet metal, upholstery');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(67,'Hammer, Sledge',3,7,'Used in demolition, driving deep stakes, and other heavyduty jobs');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(68,'Hammer, Tack',3,7,'Old-fashioned tool used in upholstery. One side holds staples or tacks, the other side drives them in.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(69,'Hatchet',3,7,'A small, short-handled axe. Used one-handed for chopping wood or roots');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(70,'Hawk, Masons',3,7,'Used like a palette for laying brick, concrete, masonry, mortar.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(71,'Gun, Heat',1,7,'Looks like a blow dryer. Used to heat up material being removed - like paint removal from walls');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(72,'Tamper, Power',2,1,'Heavy-duty gas-powered machine used to tamp an area flat. Most often used when installing outdoor patio');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(73,'Tiller',2,1,'Gas powered cultivator with rotating tines. Used to turn over garden soil');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(74,'Leaf Blower, Gas',2,1,'Used to blow away leaf and yard debris');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(75,'Leaf Blower, Electric',1,1,'Used to blow away leaf and yard debris');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(76,'Lawn Mower, Gas',2,1,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(77,'Lawn Mower, Electric',1,1,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(78,'Lawn Mower, Push',3,1,null);
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(79,'Hedge Trimmer, Electric',1,7,'Has metal teeth that oscillate back and forth. Used for shaping and pruning hedges');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(80,'Hedge Trimmer, Pruning Shears',3,7,'Look like large scissors. Used for shaping and pruning hedges');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(81,'Hedge Trimmer, Garden Shears',3,7,'Look like large scissors. Used for shaping and pruning hedges');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(82,'Hose Nozzle',3,7,'Adjusts the amount of water coming out of a garden hose');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(83,'Hose Spiltter',3,7,'Used to divert water from one hose into two');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(84,'Jack, Auto',3,7,'Used to jack up a vehicle');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(85,'Jack, House',3,7,'Used to jack up a house');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(86,'Knee Pads',3,7,'Used to protect knees while performing jobs on the ground');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(87,'Knife, Linoleum',3,7,'Used to cut linoleum');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(88,'Knife, Putty',3,7,'Used to spread putty');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(89,'Knife, Utility',3,7,'Used to cut most anything');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(90,'Ladder, Jack',3,7,'Triangular shaped jack that fits into the rungs on a ladder. Usually positioned on more than 1 ladder to hold walkboard between them.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(91,'Ladder, Leveler',3,7,'Attaches to bottom of a ladder on an uneven surface to make the ladder level');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(92,'Ladder, Stabilizer',3,7,'Attaches to a ladder''s frame. Used to stabilize the ladder with whatever it is leaning against.');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(93,'Lawn Roller',3,7,'Pushable drum that is filled with water to weigh it down. Used to roll sod and lawn evenly');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(94,'Linoleum Roller',3,7,'Roller on a stick. Used to roll out linoleum, pushing out any air');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(95,'Mattock',3,7,'Type of pick with a flat blade set at right angles to the handle. Used for digging, loosening soil, cutting roots');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(96,'Miter Box',3,7,'Device with slots notched out. Used with back saw for cutting mitered edges, molding, trims, wood');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(97,'Nailer, Brad',1,7,'Air-powered nail gun. Used with finishing nails');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(98,'Nailer, Finish',1,7,'Air-powered nail gun. Used with finishing nails');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(99,'Router',1,7,'Used to rout out (hollow out) an area. Mainly used in woodworking');
INSERT INTO tool(tool_id, name, tool_category_id, loan_period_in_days, description) VALUES(100,'Router Guide ',3,7,'Used to guide a router to make precise cuts and shapes');

SELECT setval('seq_tool_id', 100);

INSERT INTO tool_inventory VALUES (1, 4, FALSE);
INSERT INTO tool_inventory VALUES (2, 5, TRUE);
INSERT INTO tool_inventory VALUES (3, 6, TRUE);
INSERT INTO tool_inventory VALUES (4, 7, TRUE);
INSERT INTO tool_inventory VALUES (5, 8, TRUE);
INSERT INTO tool_inventory VALUES (6, 9, TRUE);
INSERT INTO tool_inventory VALUES (7, 11, TRUE);
INSERT INTO tool_inventory VALUES (8, 13, TRUE);
INSERT INTO tool_inventory VALUES (9, 17, TRUE);
INSERT INTO tool_inventory VALUES (10, 20, TRUE);
INSERT INTO tool_inventory VALUES (11, 21, TRUE);
INSERT INTO tool_inventory VALUES (12, 22, TRUE);
INSERT INTO tool_inventory VALUES (13, 25, TRUE);
INSERT INTO tool_inventory VALUES (14, 27, TRUE);
INSERT INTO tool_inventory VALUES (15, 28, TRUE);
INSERT INTO tool_inventory VALUES (16, 31, TRUE);
INSERT INTO tool_inventory VALUES (17, 32, TRUE);
INSERT INTO tool_inventory VALUES (18, 33, TRUE);
INSERT INTO tool_inventory VALUES (19, 34, TRUE);
INSERT INTO tool_inventory VALUES (20, 35, TRUE);
INSERT INTO tool_inventory VALUES (21, 37, TRUE);
INSERT INTO tool_inventory VALUES (22, 42, TRUE);
INSERT INTO tool_inventory VALUES (23, 43, TRUE);
INSERT INTO tool_inventory VALUES (24, 44, TRUE);
INSERT INTO tool_inventory VALUES (25, 45, TRUE);
INSERT INTO tool_inventory VALUES (26, 46, TRUE);
INSERT INTO tool_inventory VALUES (27, 49, TRUE);
INSERT INTO tool_inventory VALUES (28, 50, TRUE);
INSERT INTO tool_inventory VALUES (29, 51, TRUE);
INSERT INTO tool_inventory VALUES (30, 52, TRUE);
INSERT INTO tool_inventory VALUES (31, 53, TRUE);
INSERT INTO tool_inventory VALUES (32, 54, TRUE);
INSERT INTO tool_inventory VALUES (33, 56, TRUE);
INSERT INTO tool_inventory VALUES (34, 57, TRUE);
INSERT INTO tool_inventory VALUES (35, 58, TRUE);
INSERT INTO tool_inventory VALUES (36, 59, TRUE);
INSERT INTO tool_inventory VALUES (37, 61, TRUE);
INSERT INTO tool_inventory VALUES (38, 63, TRUE);
INSERT INTO tool_inventory VALUES (39, 65, TRUE);
INSERT INTO tool_inventory VALUES (40, 66, TRUE);
INSERT INTO tool_inventory VALUES (41, 67, TRUE);
INSERT INTO tool_inventory VALUES (42, 68, TRUE);
INSERT INTO tool_inventory VALUES (43, 69, TRUE);
INSERT INTO tool_inventory VALUES (44, 70, TRUE);
INSERT INTO tool_inventory VALUES (45, 71, TRUE);
INSERT INTO tool_inventory VALUES (46, 74, TRUE);
INSERT INTO tool_inventory VALUES (47, 76, TRUE);
INSERT INTO tool_inventory VALUES (48, 79, TRUE);
INSERT INTO tool_inventory VALUES (49, 80, TRUE);
INSERT INTO tool_inventory VALUES (50, 81, TRUE);
INSERT INTO tool_inventory VALUES (51, 82, TRUE);
INSERT INTO tool_inventory VALUES (52, 83, TRUE);
INSERT INTO tool_inventory VALUES (53, 84, TRUE);
INSERT INTO tool_inventory VALUES (54, 85, TRUE);
INSERT INTO tool_inventory VALUES (55, 86, TRUE);
INSERT INTO tool_inventory VALUES (56, 88, TRUE);
INSERT INTO tool_inventory VALUES (57, 90, TRUE);
INSERT INTO tool_inventory VALUES (58, 91, TRUE);
INSERT INTO tool_inventory VALUES (59, 93, TRUE);
INSERT INTO tool_inventory VALUES (60, 94, TRUE);
INSERT INTO tool_inventory VALUES (61, 95, TRUE);
INSERT INTO tool_inventory VALUES (62, 96, TRUE);
INSERT INTO tool_inventory VALUES (63, 98, TRUE);
INSERT INTO tool_inventory VALUES (64, 5, TRUE);
INSERT INTO tool_inventory VALUES (65, 8, TRUE);
INSERT INTO tool_inventory VALUES (66, 9, TRUE);
INSERT INTO tool_inventory VALUES (67, 11, TRUE);
INSERT INTO tool_inventory VALUES (68, 13, TRUE);
INSERT INTO tool_inventory VALUES (69, 15, TRUE);
INSERT INTO tool_inventory VALUES (70, 16, TRUE);
INSERT INTO tool_inventory VALUES (71, 17, TRUE);
INSERT INTO tool_inventory VALUES (72, 18, TRUE);
INSERT INTO tool_inventory VALUES (73, 23, TRUE);
INSERT INTO tool_inventory VALUES (74, 24, TRUE);
INSERT INTO tool_inventory VALUES (75, 25, TRUE);
INSERT INTO tool_inventory VALUES (76, 26, TRUE);
INSERT INTO tool_inventory VALUES (77, 27, FALSE);
INSERT INTO tool_inventory VALUES (78, 29, TRUE);
INSERT INTO tool_inventory VALUES (79, 30, TRUE);
INSERT INTO tool_inventory VALUES (80, 33, TRUE);
INSERT INTO tool_inventory VALUES (81, 34, TRUE);
INSERT INTO tool_inventory VALUES (82, 35, TRUE);
INSERT INTO tool_inventory VALUES (83, 36, TRUE);
INSERT INTO tool_inventory VALUES (84, 37, TRUE);
INSERT INTO tool_inventory VALUES (85, 38, TRUE);
INSERT INTO tool_inventory VALUES (86, 39, TRUE);
INSERT INTO tool_inventory VALUES (87, 41, TRUE);
INSERT INTO tool_inventory VALUES (88, 42, TRUE);
INSERT INTO tool_inventory VALUES (89, 43, TRUE);
INSERT INTO tool_inventory VALUES (90, 44, TRUE);
INSERT INTO tool_inventory VALUES (91, 51, TRUE);
INSERT INTO tool_inventory VALUES (92, 52, TRUE);
INSERT INTO tool_inventory VALUES (93, 53, TRUE);
INSERT INTO tool_inventory VALUES (94, 54, TRUE);
INSERT INTO tool_inventory VALUES (95, 55, TRUE);
INSERT INTO tool_inventory VALUES (96, 56, TRUE);
INSERT INTO tool_inventory VALUES (97, 57, TRUE);
INSERT INTO tool_inventory VALUES (98, 58, TRUE);
INSERT INTO tool_inventory VALUES (99, 59, TRUE);
INSERT INTO tool_inventory VALUES (100, 60, TRUE);
INSERT INTO tool_inventory VALUES (101, 63, TRUE);
INSERT INTO tool_inventory VALUES (102, 64, TRUE);
INSERT INTO tool_inventory VALUES (103, 65, TRUE);
INSERT INTO tool_inventory VALUES (104, 67, TRUE);
INSERT INTO tool_inventory VALUES (105, 68, TRUE);
INSERT INTO tool_inventory VALUES (106, 69, TRUE);
INSERT INTO tool_inventory VALUES (107, 71, TRUE);
INSERT INTO tool_inventory VALUES (108, 72, TRUE);
INSERT INTO tool_inventory VALUES (109, 77, TRUE);
INSERT INTO tool_inventory VALUES (110, 80, TRUE);
INSERT INTO tool_inventory VALUES (111, 81, TRUE);
INSERT INTO tool_inventory VALUES (112, 82, TRUE);
INSERT INTO tool_inventory VALUES (113, 84, TRUE);
INSERT INTO tool_inventory VALUES (114, 85, TRUE);
INSERT INTO tool_inventory VALUES (115, 86, TRUE);
INSERT INTO tool_inventory VALUES (116, 87, TRUE);
INSERT INTO tool_inventory VALUES (117, 88, TRUE);
INSERT INTO tool_inventory VALUES (118, 89, TRUE);
INSERT INTO tool_inventory VALUES (119, 92, TRUE);
INSERT INTO tool_inventory VALUES (120, 95, TRUE);
INSERT INTO tool_inventory VALUES (121, 96, TRUE);
INSERT INTO tool_inventory VALUES (122, 97, TRUE);
INSERT INTO tool_inventory VALUES (123, 100, TRUE);
INSERT INTO tool_inventory VALUES (124, 1, TRUE);
INSERT INTO tool_inventory VALUES (125, 2, FALSE);
INSERT INTO tool_inventory VALUES (126, 4, TRUE);
INSERT INTO tool_inventory VALUES (127, 7, TRUE);
INSERT INTO tool_inventory VALUES (128, 8, TRUE);
INSERT INTO tool_inventory VALUES (129, 9, TRUE);
INSERT INTO tool_inventory VALUES (130, 10, TRUE);
INSERT INTO tool_inventory VALUES (131, 11, TRUE);
INSERT INTO tool_inventory VALUES (132, 12, TRUE);
INSERT INTO tool_inventory VALUES (133, 13, TRUE);
INSERT INTO tool_inventory VALUES (134, 14, TRUE);
INSERT INTO tool_inventory VALUES (135, 15, TRUE);
INSERT INTO tool_inventory VALUES (136, 19, TRUE);
INSERT INTO tool_inventory VALUES (137, 20, TRUE);
INSERT INTO tool_inventory VALUES (138, 21, TRUE);
INSERT INTO tool_inventory VALUES (139, 24, TRUE);
INSERT INTO tool_inventory VALUES (140, 26, TRUE);
INSERT INTO tool_inventory VALUES (141, 28, TRUE);
INSERT INTO tool_inventory VALUES (142, 30, TRUE);
INSERT INTO tool_inventory VALUES (143, 32, TRUE);
INSERT INTO tool_inventory VALUES (144, 33, TRUE);
INSERT INTO tool_inventory VALUES (145, 34, TRUE);
INSERT INTO tool_inventory VALUES (146, 36, TRUE);
INSERT INTO tool_inventory VALUES (147, 37, TRUE);
INSERT INTO tool_inventory VALUES (148, 38, TRUE);
INSERT INTO tool_inventory VALUES (149, 39, TRUE);
INSERT INTO tool_inventory VALUES (150, 41, TRUE);
INSERT INTO tool_inventory VALUES (151, 42, TRUE);
INSERT INTO tool_inventory VALUES (152, 44, TRUE);
INSERT INTO tool_inventory VALUES (153, 47, TRUE);
INSERT INTO tool_inventory VALUES (154, 48, TRUE);
INSERT INTO tool_inventory VALUES (155, 49, TRUE);
INSERT INTO tool_inventory VALUES (156, 50, TRUE);
INSERT INTO tool_inventory VALUES (157, 52, TRUE);
INSERT INTO tool_inventory VALUES (158, 53, TRUE);
INSERT INTO tool_inventory VALUES (159, 55, TRUE);
INSERT INTO tool_inventory VALUES (160, 58, TRUE);
INSERT INTO tool_inventory VALUES (161, 62, TRUE);
INSERT INTO tool_inventory VALUES (162, 63, TRUE);
INSERT INTO tool_inventory VALUES (163, 64, TRUE);
INSERT INTO tool_inventory VALUES (164, 65, TRUE);
INSERT INTO tool_inventory VALUES (165, 67, TRUE);
INSERT INTO tool_inventory VALUES (166, 68, TRUE);
INSERT INTO tool_inventory VALUES (167, 69, TRUE);
INSERT INTO tool_inventory VALUES (168, 70, TRUE);
INSERT INTO tool_inventory VALUES (169, 71, TRUE);
INSERT INTO tool_inventory VALUES (170, 72, TRUE);
INSERT INTO tool_inventory VALUES (171, 73, TRUE);
INSERT INTO tool_inventory VALUES (172, 74, TRUE);
INSERT INTO tool_inventory VALUES (173, 75, TRUE);
INSERT INTO tool_inventory VALUES (174, 77, TRUE);
INSERT INTO tool_inventory VALUES (175, 78, TRUE);
INSERT INTO tool_inventory VALUES (176, 79, TRUE);
INSERT INTO tool_inventory VALUES (177, 82, TRUE);
INSERT INTO tool_inventory VALUES (178, 86, TRUE);
INSERT INTO tool_inventory VALUES (179, 87, TRUE);
INSERT INTO tool_inventory VALUES (180, 89, TRUE);
INSERT INTO tool_inventory VALUES (181, 90, TRUE);
INSERT INTO tool_inventory VALUES (182, 91, TRUE);
INSERT INTO tool_inventory VALUES (183, 94, TRUE);
INSERT INTO tool_inventory VALUES (184, 95, TRUE);
INSERT INTO tool_inventory VALUES (185, 97, TRUE);
INSERT INTO tool_inventory VALUES (186, 99, TRUE);
INSERT INTO tool_inventory VALUES (187, 100, TRUE);
INSERT INTO tool_inventory VALUES (188, 2, TRUE);
INSERT INTO tool_inventory VALUES (189, 3, TRUE);
INSERT INTO tool_inventory VALUES (190, 4, TRUE);
INSERT INTO tool_inventory VALUES (191, 5, TRUE);
INSERT INTO tool_inventory VALUES (192, 6, TRUE);
INSERT INTO tool_inventory VALUES (193, 8, TRUE);
INSERT INTO tool_inventory VALUES (194, 9, TRUE);
INSERT INTO tool_inventory VALUES (195, 10, TRUE);
INSERT INTO tool_inventory VALUES (196, 11, TRUE);
INSERT INTO tool_inventory VALUES (197, 13, TRUE);
INSERT INTO tool_inventory VALUES (198, 15, TRUE);
INSERT INTO tool_inventory VALUES (199, 16, TRUE);
INSERT INTO tool_inventory VALUES (200, 19, TRUE);
INSERT INTO tool_inventory VALUES (201, 20, TRUE);
INSERT INTO tool_inventory VALUES (202, 21, TRUE);
INSERT INTO tool_inventory VALUES (203, 23, TRUE);
INSERT INTO tool_inventory VALUES (204, 25, TRUE);
INSERT INTO tool_inventory VALUES (205, 26, TRUE);
INSERT INTO tool_inventory VALUES (206, 28, FALSE);
INSERT INTO tool_inventory VALUES (207, 31, TRUE);
INSERT INTO tool_inventory VALUES (208, 32, TRUE);
INSERT INTO tool_inventory VALUES (209, 34, TRUE);
INSERT INTO tool_inventory VALUES (210, 35, TRUE);
INSERT INTO tool_inventory VALUES (211, 36, TRUE);
INSERT INTO tool_inventory VALUES (212, 37, TRUE);
INSERT INTO tool_inventory VALUES (213, 38, TRUE);
INSERT INTO tool_inventory VALUES (214, 40, TRUE);
INSERT INTO tool_inventory VALUES (215, 43, TRUE);
INSERT INTO tool_inventory VALUES (216, 44, TRUE);
INSERT INTO tool_inventory VALUES (217, 45, TRUE);
INSERT INTO tool_inventory VALUES (218, 48, TRUE);
INSERT INTO tool_inventory VALUES (219, 50, TRUE);
INSERT INTO tool_inventory VALUES (220, 52, TRUE);
INSERT INTO tool_inventory VALUES (221, 55, TRUE);
INSERT INTO tool_inventory VALUES (222, 59, TRUE);
INSERT INTO tool_inventory VALUES (223, 61, TRUE);
INSERT INTO tool_inventory VALUES (224, 62, TRUE);
INSERT INTO tool_inventory VALUES (225, 63, TRUE);
INSERT INTO tool_inventory VALUES (226, 64, TRUE);
INSERT INTO tool_inventory VALUES (227, 69, TRUE);
INSERT INTO tool_inventory VALUES (228, 70, TRUE);
INSERT INTO tool_inventory VALUES (229, 71, TRUE);
INSERT INTO tool_inventory VALUES (230, 72, TRUE);
INSERT INTO tool_inventory VALUES (231, 73, TRUE);
INSERT INTO tool_inventory VALUES (232, 74, TRUE);
INSERT INTO tool_inventory VALUES (233, 75, TRUE);
INSERT INTO tool_inventory VALUES (234, 77, TRUE);
INSERT INTO tool_inventory VALUES (235, 78, TRUE);
INSERT INTO tool_inventory VALUES (236, 79, TRUE);
INSERT INTO tool_inventory VALUES (237, 80, TRUE);
INSERT INTO tool_inventory VALUES (238, 81, TRUE);
INSERT INTO tool_inventory VALUES (239, 83, TRUE);
INSERT INTO tool_inventory VALUES (240, 84, TRUE);
INSERT INTO tool_inventory VALUES (241, 85, TRUE);
INSERT INTO tool_inventory VALUES (242, 86, TRUE);
INSERT INTO tool_inventory VALUES (243, 87, TRUE);
INSERT INTO tool_inventory VALUES (244, 88, TRUE);
INSERT INTO tool_inventory VALUES (245, 89, TRUE);
INSERT INTO tool_inventory VALUES (246, 91, TRUE);
INSERT INTO tool_inventory VALUES (247, 92, TRUE);
INSERT INTO tool_inventory VALUES (248, 93, TRUE);
INSERT INTO tool_inventory VALUES (249, 94, TRUE);
INSERT INTO tool_inventory VALUES (250, 96, TRUE);
INSERT INTO tool_inventory VALUES (251, 97, TRUE);
INSERT INTO tool_inventory VALUES (252, 98, TRUE);
INSERT INTO tool_inventory VALUES (253, 100, TRUE);
INSERT INTO tool_inventory VALUES (254, 2, TRUE);
INSERT INTO tool_inventory VALUES (255, 3, FALSE);
INSERT INTO tool_inventory VALUES (256, 6, TRUE);
INSERT INTO tool_inventory VALUES (257, 8, TRUE);
INSERT INTO tool_inventory VALUES (258, 9, TRUE);
INSERT INTO tool_inventory VALUES (259, 11, TRUE);
INSERT INTO tool_inventory VALUES (260, 15, TRUE);
INSERT INTO tool_inventory VALUES (261, 16, TRUE);
INSERT INTO tool_inventory VALUES (262, 17, TRUE);
INSERT INTO tool_inventory VALUES (263, 18, TRUE);
INSERT INTO tool_inventory VALUES (264, 19, TRUE);
INSERT INTO tool_inventory VALUES (265, 20, TRUE);
INSERT INTO tool_inventory VALUES (266, 21, FALSE);
INSERT INTO tool_inventory VALUES (267, 22, TRUE);
INSERT INTO tool_inventory VALUES (268, 23, TRUE);
INSERT INTO tool_inventory VALUES (269, 26, TRUE);
INSERT INTO tool_inventory VALUES (270, 29, TRUE);
INSERT INTO tool_inventory VALUES (271, 31, TRUE);
INSERT INTO tool_inventory VALUES (272, 32, TRUE);
INSERT INTO tool_inventory VALUES (273, 34, TRUE);
INSERT INTO tool_inventory VALUES (274, 35, TRUE);
INSERT INTO tool_inventory VALUES (275, 36, TRUE);
INSERT INTO tool_inventory VALUES (276, 37, TRUE);
INSERT INTO tool_inventory VALUES (277, 39, TRUE);
INSERT INTO tool_inventory VALUES (278, 40, TRUE);
INSERT INTO tool_inventory VALUES (279, 43, TRUE);
INSERT INTO tool_inventory VALUES (280, 44, TRUE);
INSERT INTO tool_inventory VALUES (281, 45, TRUE);
INSERT INTO tool_inventory VALUES (282, 46, TRUE);
INSERT INTO tool_inventory VALUES (283, 47, TRUE);
INSERT INTO tool_inventory VALUES (284, 48, TRUE);
INSERT INTO tool_inventory VALUES (285, 52, TRUE);
INSERT INTO tool_inventory VALUES (286, 53, TRUE);
INSERT INTO tool_inventory VALUES (287, 54, TRUE);
INSERT INTO tool_inventory VALUES (288, 56, TRUE);
INSERT INTO tool_inventory VALUES (289, 57, TRUE);
INSERT INTO tool_inventory VALUES (290, 58, TRUE);
INSERT INTO tool_inventory VALUES (291, 59, TRUE);
INSERT INTO tool_inventory VALUES (292, 60, TRUE);
INSERT INTO tool_inventory VALUES (293, 61, TRUE);
INSERT INTO tool_inventory VALUES (294, 63, TRUE);
INSERT INTO tool_inventory VALUES (295, 66, TRUE);
INSERT INTO tool_inventory VALUES (296, 67, TRUE);
INSERT INTO tool_inventory VALUES (297, 69, TRUE);
INSERT INTO tool_inventory VALUES (298, 70, TRUE);
INSERT INTO tool_inventory VALUES (299, 71, TRUE);
INSERT INTO tool_inventory VALUES (300, 73, TRUE);
INSERT INTO tool_inventory VALUES (301, 74, TRUE);
INSERT INTO tool_inventory VALUES (302, 75, TRUE);
INSERT INTO tool_inventory VALUES (303, 79, TRUE);
INSERT INTO tool_inventory VALUES (304, 82, TRUE);
INSERT INTO tool_inventory VALUES (305, 84, TRUE);
INSERT INTO tool_inventory VALUES (306, 85, TRUE);
INSERT INTO tool_inventory VALUES (307, 86, TRUE);
INSERT INTO tool_inventory VALUES (308, 87, TRUE);
INSERT INTO tool_inventory VALUES (309, 88, TRUE);
INSERT INTO tool_inventory VALUES (310, 89, TRUE);
INSERT INTO tool_inventory VALUES (311, 91, TRUE);
INSERT INTO tool_inventory VALUES (312, 92, TRUE);
INSERT INTO tool_inventory VALUES (313, 93, TRUE);
INSERT INTO tool_inventory VALUES (314, 94, TRUE);
INSERT INTO tool_inventory VALUES (315, 95, TRUE);
INSERT INTO tool_inventory VALUES (316, 96, TRUE);
INSERT INTO tool_inventory VALUES (317, 98, TRUE);
INSERT INTO tool_inventory VALUES (318, 100, TRUE);

SELECT setval('seq_tool_inventory_id', 318);

INSERT INTO loans (member_license, tool_inventory_id, tool_id, due_date) VALUES ('US54678', 125, 2, '2016-04-25');
INSERT INTO loans (member_license, tool_inventory_id, tool_id, due_date) VALUES ('US54678', 255, 3, '2016-04-25');
INSERT INTO loans (member_license, tool_inventory_id, tool_id, due_date) VALUES ('US54678', 266, 21, '2016-04-25');
INSERT INTO loans (member_license, tool_inventory_id, tool_id, due_date) VALUES ('US54678', 77, 27, '2016-05-05');
INSERT INTO loans (member_license, tool_inventory_id, tool_id, due_date) VALUES ('US54678', 206, 28, '2016-05-05');

COMMIT;