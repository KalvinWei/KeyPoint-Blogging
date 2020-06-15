#TODO: add sample data here
INSERT INTO user (id, userName, nickname, firstName,lastName, dateOfBirth,email,signature, description, avatar, passwordHash, salt, iteration) VALUES
(123,'user1','nick1','James','Beam','1966-01-23' ,'bill1@microsoft.com',
 'Taylor covers politics, platform policy, and big tech at TechCrunch.',
 'Prior to rejoining TechCrunch, Taylor was Senior Technology Editor of the Daily Beast. Taylor first joined TechCrunch in 2016. Prior to joining TechCrunch, she was the Tech Editor of the Daily Dot and a reporter and deputy editor at ReadWriteWeb.',
 '1.png','CGKdgMzOPaj8wxjONSlp/aBGnw59lGtgXHCauH6AcCQmJ2SsIGurrM8l1AYrH5YRwXMxdc+GVUxVMdDkOt7CMg==',
 'IvuOXelQSD1Q3I8X3F7yXHXgYDFiyiv8Mb+9Qwd1pbrpwe34Jy/KBZgTYRr3OLGXDHJPQUhC'
    ,98961),
(124,'user2','nick2','Alex','Wilhelm ','1966-02-23' ,'bill2@microsoft.com',
 'Alex Wilhelm is Senior Editor at TechCrunch.',
 'He previously worked for Crunchbase News as Editor in Chief as well as The Next Web, TechCrunch, and Mattermark.',
 '2.png',
 'jqqgiScgsfTqPA6JLy21pkBGBGJ4IuO2Zoti2wdnZD1Aw5AsapXdieAaTh6DGiYI5b0t5ft/gsQbYzhZDb01Dw==',
 '+wW0JweYQRxozzt/aApssWTYIuU5iU5+VdDv0qlCJmsIupCRPNqTKFcI4rPnwTeIzjZ5Vef/RWbogvEPz0PaG243IGY5RDQ6UGHY',
 53124),
(125,'user3','nick3','Manish','Singh ','1966-03-23' ,'bill3@microsoft.com',
 'Manish Singh covers India for TechCrunch.',
 'Prior to this, he wrote for VentureBeat, CNBC, The Outline, CNET, and Mashable. You can reach out to him at manishsingh@pm.me',
 '3.png',
 'sxtHR0GRtnAGdLMB6TFQw/RfQlvKWrMhtjfEDlmQoA98WJZ8Lh98Hp+8Oza38VwZ8wieJrtdWBWWtm99kLPz0A==',
 'SDd2xsp539uZ6MrocYB5T8hvjfA7/TE=',
 24472),
(126,'user4','nick4','Ingrid ','Lunden ','1966-02-23' ,'bill4@microsoft.com',
 'Ingrid is a writer and editor for TechCrunch, joining February 2012, based out of London.',
 'Before TechCrunch, Ingrid worked at paidContent.org, where she was a staff writer, and has in the past also written freelance regularly for other publications such as the Financial Times. Ingrid covers mobile, digital media, advertising and the spaces where these intersect.',
 '4.png',
 '18MHezJhAJ1S0eo9L8A3PbY40EVgzrBP2WEhN5IjWwmL9y574vsS+EAKdSqmLLiMnveD2n12V0KIgUgg97QkEA==',
 'QY0K/tKNGSUXSq+wbNJP5XH/3EVuTTJnQNfxrcCrcexaBlmBLJUn3upy+/PKA1JSrpgi',
 28505);








INSERT INTO article (id, title, content, time, cover, userName,isDeleted) VALUES
 (223,'Portobel turns food producers into direct-to-consumer businesses',
    'Kumaran told me that he and his co-founders Ted Everson and Itai Maron started out with the goal of improving the delivery process by using low-cost, internet-connected devices to track each order. As they began testing this out — primarily with dairy companies and other producers of perishable goods — customers started to ask them, “Hey, you can monitor these things, can you actually deliver these things, too?”

   So last year, the company started making deliveries of its own, which involved managing its own warehouses and hiring its own drivers. Kumaran said the resulting process is “a machine that turns wholesale pallets into direct-to-consumer deliveries.”

   He also emphasized that the company is taking safety precautions during the pandemic, ensuring that all of its warehouse workers and drivers have masks and other protective equipment, and that the drivers use hand sanitizer between deliveries.',
    '2018-06-05T18:52:09',
    '1.jpg','user1' ,0),
(224,'Uber could lose its Grubhub deal to Just Eat or Delivery Hero',
    'According to CNBC there are two suitors rivaling Uber for purchase of U.S. food delivery company Grubhub: Just Eat Takeaway (the union of Just Eat and Takeaway) and Delivery Hero.
Both are European companies perhaps looking for a major entry to the United States market. Just Eat Takeaway is based in the U.K. and Holland, while Delivery Hero  is based in Germany. They are both lavishly funded, with Just Eat Takeaway having raised around $1 billion (a combined tally for both companies that now make up the conjoined entity), according to Crunchbase data, and Delivery Hero flush with billions in historical capital from a number of sources.What price they might pay wasn’t clear on this Friday afternoon, but public market investors are optimistic on what the companies might pay. Shares of Grubhub  shot higher on news that other suitors were in the mix; its shares are currently trading up around 7% on the day.
A bidding war could help Grubhub drive a higher price for itself. According to various reports, Uber and Grubhub are struggling to find the right price for the smaller company’s assets. Uber  Eats is a domestic competitor to Grubhub, making the tie-up attractive to the larger company from a competitive perspective; if Uber can eliminate one of its chief rivals while absorbing its market share, then perhaps the company best known for its ride-hailing business would be able to extract more cash from food delivery, lessening its regular losses from the activity.',
    '2020-06-06T07:07:14',
    'cover2.jpg','user2',0),
(225,'India rejects Walmart-owned Flipkart proposed foray into food retail business',
 'The Indian government has rejected Flipkart’s  proposal to enter the food retail business in a setback for Walmart, which owns a majority of the Indian e-commerce firm and which recently counted its business in Asia’s third-largest economy as one of the worst impacted by the global coronavirus pandemic.

The Department for Promotion of Industry and Internal Trade (DPIIT), a wing of the nation’s Ministry of Commerce and Industry, told Flipkart, which competes with Amazon India, that its proposed plan to enter the food retail business does not comply with regulatory guidelines — though it did not elaborate, according to a person familiar with the matter.

Rajneesh Kumar, chief corporate affairs officer at Flipkart, told TechCrunch that the company was evaluating the agency’s response and intended to re-apply.

“At Flipkart, we believe that a technology and innovation-driven marketplace can add significant value to our country’s farmers and food processing sector by bringing value-chain efficiency and transparency. This will further aid boosting farmers’ income and transform Indian agriculture,” he added.',
 '2020-06-07T08:08:14',
 'cover4.jpg','user3',0),
(226,'IBM Cloud suffers prolonged outage',
 'The IBM Cloud is currently suffering a major outage, and with that, multiple services that are hosted on the platform are also down, including everybody’s favorite tech news aggregator, Techmeme.
It looks like the problems started around 2:30pm PT and spread from there. Best we can tell, this is a worldwide problem and involves a networking issue, but IBM’s  own status page isn’t actually loading anymore and returns an internal server error, so we don’t quite know the extent of the outage or what triggered it. IBM Cloud’s Twitter account has also remained silent, though we found a status page for IBM Aspera hosted on a third-party server, which seems to confirm that this is likely a worldwide networking issue.',
 '2020-06-09T09:09:14',
 'cover3.jpg','user4',0),
(227,'Preventing food waste nets Apeel $250 million from Singapore’s government, Oprah and Katy Perry',
  'Food waste and the pressures on the global food supply chain wrought by the COVID-19 pandemic have captured headlines around the world, and one small startup based in the coastal California city of Santa Barbara has just announced $250 million in financing to provide a solution.

The company is called Apeel Sciences, and over the past eight years it has grown from a humble startup launched with a $100,000 grant from the Gates Foundation to a giant, globe-spanning company worth more than $1 billion and attracting celebrity backers like Oprah Winfrey and Katy Perry, as well as large multi-national investors like Singapore’s sovereign wealth fund.',
  '2020-05-27  01:09:14',
  'cover5.jpg','user4',0),
(228,'Cloud canteen startup Feedr has been acquired by Compass Group for ~$24M',
  'Feedr, the food tech startup that delivers personalised meals to office workers as an alternative to companies setting up their own canteens, has been acquired by Compass Group, the publicly-listed foodservice company.

The price is described as “in the region” of $24 million, while I understand that the deal between the two companies was completed in early March 2020.

Compass Group says the purchase of Feedr  will help accelerate its digital transformation, and — amidst the coronavirus crisis — form part of its “return to work” strategy. Specifically, it plans to utilise Feedr’s software across its portfolio of corporate clients in the U.K. and Ireland, with further potential applications of the technology in education and healthcare sectors.

“Feedr’s mobile ordering and pre-pay technology will enable Compass to transform the way people interact with on-site restaurants, so employees can browse menus, pay and collect more flexibly, enhancing their food at work experience,” explains Compass Group UK and Ireland.',
  '2020-05-26  11:15:14',
  'cover6.jpg','user4',0),
 (229,'Amazon gives away a free year of live and on-demand cooking classes on Food Network Kitchen app',
  'Amazon  is bringing a year’s worth of free, live and on-demand cooking classes to tens of millions of Amazon  Fire TV and Fire tablet owners across the U.S., thanks to an expanded collaboration with Discovery’s Food Network Kitchen. The subscription service launched last fall as a flagship app for Amazon’s Alexa-powered Echo Show, bringing daily live classes, step-by-step cooking videos, on-demand video, home delivery of ingredients, and more to Echo devices owners.

While the Echo Show was the first smart-speaker-with-screen to gain access to Food Network  Kitchen, the app is also available across devices, including Amazon’s Fire TV, Fire tablets, as well as iOS and Android phones and tablets.The subscription offering combines episodes of popular Food Network  Shows like “30 Minute Meals,” “Barefoot Contessa,” and “Brunch @ Bobby’s” with both live and on-demand cooking classes from culinary experts and top chefs, including Bobby Flay, Rachael Ray, Giada De Laurentiis, Guy Fieri, Martha Stewart, Alton Brown, Ina Garten, Andrew Zimmern, Ree Drummond, Daniel Boulud, Valerie Bertinelli, Sunny Anderson, Jonathan Waxman, Molly Yeh, Nancy Silverton, JJ Johnson and others.',
  '2020-04-28  14:36:14',
  'cover7.jpg','user4',0),
 (230,'Tech for good during COVID-19: Therapy for nurses, baby food, and an online diary ',
  'Amazon  is bringing a year’s worth of free, live and on-demand cooking classes to tens of millions of Amazon  Fire TV and Fire tablet owners across the U.S., thanks to an expanded collaboration with Discovery’s Food Network Kitchen. The subscription service launched last fall as a flagship app for Amazon’s Alexa-powered Echo Show, bringing daily live classes, step-by-step cooking videos, on-demand video, home delivery of ingredients, and more to Echo devices owners.

While the Echo Show was the first smart-speaker-with-screen to gain access to Food Network  Kitchen, the app is also available across devices, including Amazon’s Fire TV, Fire tablets, as well as iOS and Android phones and tablets.The subscription offering combines episodes of popular Food Network  Shows like “30 Minute Meals,” “Barefoot Contessa,” and “Brunch @ Bobby’s” with both live and on-demand cooking classes from culinary experts and top chefs, including Bobby Flay, Rachael Ray, Giada De Laurentiis, Guy Fieri, Martha Stewart, Alton Brown, Ina Garten, Andrew Zimmern, Ree Drummond, Daniel Boulud, Valerie Bertinelli, Sunny Anderson, Jonathan Waxman, Molly Yeh, Nancy Silverton, JJ Johnson and others.',
  '2020-04-27  18:30:14',
  'cover8.jpg','user4',0);





INSERT INTO comment (id, content, time,parent, user,article,isDeleted) VALUES
(333,'Excellent teaching. Who is here in 2019?','2018-06-05T18:52:09',NULL,123,223,0),

(334,'Excellent teaching. Who is here in 2019?','2018-06-05T18:52:09',333,124,223,0
),

(335,'Excellent teaching. Who is here in 2019?','2018-06-05T18:52:09',NULL,125,223,0
),

(336,'Excellent teaching. Who is here in 2019?','2018-06-05T18:52:09',NULL,126,224,0
);

INSERT INTO likeArticle (user, article) VALUES
(124,223),
(124,224),
(125,225),
(125,226);


INSERT INTO likeComment (user, comment) VALUES
(124,333),
(124,334),
(125,335),
(126,335);


INSERT INTO tag (article, tag) VALUES
(223,'favourite'),
(224,'favourite'),
(225,'favourite'),
(226,'favourite');