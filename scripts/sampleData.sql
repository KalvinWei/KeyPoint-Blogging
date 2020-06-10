#TODO: add sample data here
INSERT INTO user (id, userName, nickname, firstName,lastName, dateOfBirth,email,signature, description, avatar, passwordHash, salt, iteration) VALUES
(123,'user1','nick1','James','Beam','1966-01-23' ,'bill1@microsoft.com',
 'Taylor covers politics, platform policy, and big tech at TechCrunch.',
 'Prior to rejoining TechCrunch, Taylor was Senior Technology Editor of the Daily Beast. Taylor first joined TechCrunch in 2016. Prior to joining TechCrunch, she was the Tech Editor of the Daily Dot and a reporter and deputy editor at ReadWriteWeb.',
 'Bulbasaur.png','PO7H9...','JHWT5...',100000),
(124,'user2','nick2','Alex','Wilhelm ','1966-02-23' ,'bill2@microsoft.com',
    'Alex Wilhelm is Senior Editor at TechCrunch.',
    'He previously worked for Crunchbase News as Editor in Chief as well as The Next Web, TechCrunch, and Mattermark.',
    'Charmander.png','431P3...','SD87J3...',100000),
(125,'user3','nick3','Manish','Singh ','1966-03-23' ,'bill3@microsoft.com',
    'Manish Singh covers India for TechCrunch.',
    'Prior to this, he wrote for VentureBeat, CNBC, The Outline, CNET, and Mashable. You can reach out to him at manishsingh@pm.me',
    'Geodude.png','0WU62...','SJDHY...',100000),
(126,'user4','nick4','Ingrid ','Lunden ','1966-02-23' ,'bill4@microsoft.com',
    'Ingrid is a writer and editor for TechCrunch, joining February 2012, based out of London.',
    'Before TechCrunch, Ingrid worked at paidContent.org, where she was a staff writer, and has in the past also written freelance regularly for other publications such as the Financial Times. Ingrid covers mobile, digital media, advertising and the spaces where these intersect.',
    'Jigglypuff.png','K77H9...','FHY62B...',100000);







INSERT INTO article (id, title, content, time, cover, user,isDeleted) VALUES
 (223,'Portobel turns food producers into direct-to-consumer businesses',
    'Kumaran told me that he and his co-founders Ted Everson and Itai Maron started out with the goal of improving the delivery process by using low-cost, internet-connected devices to track each order. As they began testing this out — primarily with dairy companies and other producers of perishable goods — customers started to ask them, “Hey, you can monitor these things, can you actually deliver these things, too?”

   So last year, the company started making deliveries of its own, which involved managing its own warehouses and hiring its own drivers. Kumaran said the resulting process is “a machine that turns wholesale pallets into direct-to-consumer deliveries.”

   He also emphasized that the company is taking safety precautions during the pandemic, ensuring that all of its warehouse workers and drivers have masks and other protective equipment, and that the drivers use hand sanitizer between deliveries.',
    '2018-06-05T18:52:09',
    'guest.png',123 ,0),
(224,'Uber could lose its Grubhub deal to Just Eat or Delivery Hero',
    'According to CNBC there are two suitors rivaling Uber for purchase of U.S. food delivery company Grubhub: Just Eat Takeaway (the union of Just Eat and Takeaway) and Delivery Hero.
Both are European companies perhaps looking for a major entry to the United States market. Just Eat Takeaway is based in the U.K. and Holland, while Delivery Hero  is based in Germany. They are both lavishly funded, with Just Eat Takeaway having raised around $1 billion (a combined tally for both companies that now make up the conjoined entity), according to Crunchbase data, and Delivery Hero flush with billions in historical capital from a number of sources.What price they might pay wasn’t clear on this Friday afternoon, but public market investors are optimistic on what the companies might pay. Shares of Grubhub  shot higher on news that other suitors were in the mix; its shares are currently trading up around 7% on the day.
A bidding war could help Grubhub drive a higher price for itself. According to various reports, Uber and Grubhub are struggling to find the right price for the smaller company’s assets. Uber  Eats is a domestic competitor to Grubhub, making the tie-up attractive to the larger company from a competitive perspective; if Uber can eliminate one of its chief rivals while absorbing its market share, then perhaps the company best known for its ride-hailing business would be able to extract more cash from food delivery, lessening its regular losses from the activity.',
    '2020-06-06T07:07:14',
    'cover2.png',124,0),
(225,'India rejects Walmart-owned Flipkart proposed foray into food retail business',
 'The Indian government has rejected Flipkart’s  proposal to enter the food retail business in a setback for Walmart, which owns a majority of the Indian e-commerce firm and which recently counted its business in Asia’s third-largest economy as one of the worst impacted by the global coronavirus pandemic.

The Department for Promotion of Industry and Internal Trade (DPIIT), a wing of the nation’s Ministry of Commerce and Industry, told Flipkart, which competes with Amazon India, that its proposed plan to enter the food retail business does not comply with regulatory guidelines — though it did not elaborate, according to a person familiar with the matter.

Rajneesh Kumar, chief corporate affairs officer at Flipkart, told TechCrunch that the company was evaluating the agency’s response and intended to re-apply.

“At Flipkart, we believe that a technology and innovation-driven marketplace can add significant value to our country’s farmers and food processing sector by bringing value-chain efficiency and transparency. This will further aid boosting farmers’ income and transform Indian agriculture,” he added.',
 '2020-06-07T08:08:14',
 'cover4.png',125,0),
(226,'IBM Cloud suffers prolonged outage',
 'The IBM Cloud is currently suffering a major outage, and with that, multiple services that are hosted on the platform are also down, including everybody’s favorite tech news aggregator, Techmeme.
It looks like the problems started around 2:30pm PT and spread from there. Best we can tell, this is a worldwide problem and involves a networking issue, but IBM’s  own status page isn’t actually loading anymore and returns an internal server error, so we don’t quite know the extent of the outage or what triggered it. IBM Cloud’s Twitter account has also remained silent, though we found a status page for IBM Aspera hosted on a third-party server, which seems to confirm that this is likely a worldwide networking issue.',
 '2020-06-09T09:09:14',
 'cover3.png',126,0);




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