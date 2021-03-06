USE [master]
GO
/****** Object:  Database [digitalnews]    Script Date: 4/27/2020 9:41:16 AM ******/
CREATE DATABASE [digitalnews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'digitalnews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\digitalnews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'digitalnews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\digitalnews_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [digitalnews] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [digitalnews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [digitalnews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [digitalnews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [digitalnews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [digitalnews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [digitalnews] SET ARITHABORT OFF 
GO
ALTER DATABASE [digitalnews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [digitalnews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [digitalnews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [digitalnews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [digitalnews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [digitalnews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [digitalnews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [digitalnews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [digitalnews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [digitalnews] SET  DISABLE_BROKER 
GO
ALTER DATABASE [digitalnews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [digitalnews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [digitalnews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [digitalnews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [digitalnews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [digitalnews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [digitalnews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [digitalnews] SET RECOVERY FULL 
GO
ALTER DATABASE [digitalnews] SET  MULTI_USER 
GO
ALTER DATABASE [digitalnews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [digitalnews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [digitalnews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [digitalnews] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [digitalnews] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'digitalnews', N'ON'
GO
ALTER DATABASE [digitalnews] SET QUERY_STORE = OFF
GO
USE [digitalnews]
GO
/****** Object:  User [saa]    Script Date: 4/27/2020 9:41:16 AM ******/
CREATE USER [saa] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[digitalnews]    Script Date: 4/27/2020 9:41:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[digitalnews](
	[id] [int] NOT NULL,
	[title] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[image] [varchar](max) NULL,
	[author] [varchar](max) NULL,
	[posttime] [datetime] NULL,
	[short_des] [varchar](max) NULL,
 CONSTRAINT [PK__digitaln__3213E83FC8F09E24] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[digitalnews] ([id], [title], [description], [image], [author], [posttime], [short_des]) VALUES (1, N'World News Updates: Coronavirus Death Toll Soars in Turkey; W.H.O. Warns of Vaccine Roadblock', N'Turkey has surpassed China in its number of confirmed coronavirus cases, as the tally rose to more than 90,000 by Monday, with deaths reaching at least 2,140, according to official government figures. But the true death toll may be much higher.

Data compiled by The New York Times from records of deaths in Istanbul indicate that Turkey is grappling with a far bigger calamity from the coronavirus than official figures and statements indicate. The city alone recorded about 2,100 more deaths than expected from March 9 to April 12, based on weekly averages from the last two years, far more than officials reported for the whole of Turkey during that time.

While not all those deaths are necessarily directly attributable to the coronavirus, the numbers indicate a striking jump in fatalities that has coincided with the onset of the outbreak, a preliminary indicator that is being used by researchers to cut through the fog of the pandemic and assess its full toll in real time.', N'balloon.jpeg', NULL, CAST(N'2020-04-20T09:45:00.000' AS DateTime), N'Singapore, an early success story, is having a surge in cases, while European countries start to ease restrictions. Oil prices nosedived as a worldwide surplus grew.')
INSERT [dbo].[digitalnews] ([id], [title], [description], [image], [author], [posttime], [short_des]) VALUES (2, N'The Case of the Disappearing Exoplanet', N'Fomalhaut b was one of the first planets around another star to be directly imaged by telescopes. Some astronomers now say it was a cloud of .....', N'camp.jpeg', N'Robin George Andrews', CAST(N'2020-04-19T09:45:00.000' AS DateTime), N'Fomalhaut b was one of the first planets around another star to be directly imaged by telescopes. Some astronomers now say it was a cloud of asteroid debris.')
INSERT [dbo].[digitalnews] ([id], [title], [description], [image], [author], [posttime], [short_des]) VALUES (3, N'''We have nothing to hide'' -- Why Dutch people don''t mind you peering into their homes', N'For many visitors to the Netherlands, one of the great discoveries when wandering through the streets of Amsterdam or other towns and cities is that you can often take a look inside people''s homes when it gets dark.
That''s because many Dutch people never close their curtains or blinds. Often, people don''t even have curtains or blinds.
At a time when coronavirus restrictions are confining people all over the world to their homes -- with only a window for contact to the outside world -- this national quirk seems even more intriguing.
The Dutch themselves don''t think it unusual. It''s so interwoven in their culture that researchers have struggled to figure out exactly why people in the Netherlands care so little about their privacy.
Those who look for an explanation for this rather curious exhibitionism quickly get caught up in major sociological tangles.
Is it an "I''ve-got-nothing-to-hide" or a "look-what-I''ve-got" mentality? Or both?
The most popular explanation stems from the Protestant religious tradition of Calvinism, which insists that honest citizens have nothing to hide. Closing the curtains could indicate otherwise. And by letting people have a look inside, you let them know: Look, I''m a decent person!
A desire to show off possessions could also be an explanation.
As standards of living have risen over time, materials and interiors have become more luxurious and opulent. And even now people like to show off their custom-made open kitchens, designer couches or latest-model flat-screen TVs.
Some city guides explain the openness as a way that business was done in the old days. People would leave curtains open to show off a room full of the finest of furniture, decorations and art as a way of proving to merchants that they were trustworthy.
Others say it''s a tradition that only really dates back to the 1950s, and has already begun to change.', N'lake.jpg', N'Katja Brokke', CAST(N'2020-04-20T09:45:00.000' AS DateTime), N'For many visitors to the Netherlands, one of the great discoveries when wandering through the streets of Amsterdam or other towns and cities is that you can often take a look inside people''s homes when it gets dark.')
INSERT [dbo].[digitalnews] ([id], [title], [description], [image], [author], [posttime], [short_des]) VALUES (4, N'With many national parks closed, their animal residents are getting a break (from us)', N'Yosemite, Yellowstone, Grand Canyon. These are the stars of the United States'' national parks system, and with good reason.
Often called "America''s Best Idea," the creation of national parks in the United States launched a worldwide movement to protect the Earth''s natural treasures.
These headliner national parks would typically be very busy during National Park Week, going on now through April 26. (The National Park Service welcomed more than 327 million visitors last year, a 2.9% increase from 2018, and the third highest number since record keeping began in 1904.)
But the coronavirus pandemic has shut down many of the most popular national parks, creating a forced experiment: What happens when animals who make their homes in these protected space have (mostly) free rein of the park grounds?"With Yosemite and other parks closed to tourists, wildlife is coming out of hiding, and indeed, even thriving in our absence, reclaiming some of the places that have been dominated by human activity for decades," said Beth Pratt, National Wildlife Federation''s regional executive director for California.
"With threats like vehicle collisions or being harassed for a selfie largely eliminated, the coyotes are trotting through Camp Curry hunting mice, and the black bears [are] wandering around a mostly empty Yosemite Village," said Pratt, who was vice president/CFO at the nonprofit Yosemite Conservancy for 10 years and still lives near the park.
It shows "that even in our best protected places on the planet -- our national parks -- wildlife still get impacted by us humans," Pratt continued.
"More than 400 bears have been hit by cars in Yosemite since 1995. That the animals seem to be enjoying this vacation from us is a good reminder that when the parks do reopen, let''s be kinder and more respectful to the wildlife who call Yosemite and other parks home."', N'camp.jpeg', N'Katia Hetter', CAST(N'2020-04-19T09:05:00.000' AS DateTime), N'Yosemite, Yellowstone, Grand Canyon. These are the stars of the United States'' national parks system, and with good reason.
Often called "America''s Best Idea," the creation of national parks in the United States launched a worldwide movement to protect the Earth''s natural treasures.')
INSERT [dbo].[digitalnews] ([id], [title], [description], [image], [author], [posttime], [short_des]) VALUES (5, N'Turkey''s newest hotel ''floats'' above ancient archaeological ruins', N'You could spend your vacation visiting cultural sites or luxuriating in your five-star hotel. But what if you could do both at the same place?
An extraordinary new luxury hotel opened in Antakya, Turkey, earlier this year and it is at once an engineering marvel, an architectural beauty and a world-class archaeological site.
Like hotels around the world, Museum Hotel Antakya is temporarily closed because of the coronavirus pandemic, but it''s accepting bookings from June onward and is definitely one to chalk up for future travel plans.
Ten years in the making, the modern 200-room hotel "floats" on steel columns above the Necmi Asfuro?lu Archaeology Museum, which contains around 35,000 artifacts dating back to the third century BCE from 13 civilizations.
Ancient city of Antioch
The story began back in 2009, when the Asfuro?lu family broke ground on what was to be a luxury hotel -- and discovered ruins from the ancient city of Antioch, a couple of kilometers from the center of what is now modern Antakya.
The original plans for the site became unworkable, but the family embraced the challenge. They worked with the Antakya Municipality, Hatay Archaeology Museum and Adana Conservation Council for Cultural and Natural Assets on Turkey''s largest systemic archeological excavation since the 1930s.
Over the course of the 10-year project, they uncovered the world''s largest single-piece floor mosaic -- some 1,050 square meters -- and the world''s first marble statue of the Greek god Eros found entirely intact.', N'balloon.jpeg', N'Maureen O''Hare', CAST(N'2020-04-16T09:05:00.000' AS DateTime), N'You could spend your vacation visiting cultural sites or luxuriating in your five-star hotel. But what if you could do both at the same place?
An extraordinary new luxury hotel opened in Antakya, Turkey, earlier this year and it is at once an engineering marvel, an architectural beauty and a world-class archaeological site.')
INSERT [dbo].[digitalnews] ([id], [title], [description], [image], [author], [posttime], [short_des]) VALUES (6, N'Premarket stocks: WTI crashes below $0 a barrel -- a record low', N'London (CNN Business)The spectacular collapse in oil markets is showing no signs of easing, as the coronavirus crisis saps demand and producers run out of places to store all their excess barrels of crude.

What''s happening: US oil prices plunged, falling below $0 Monday to $-37.63 a barrel. That''s the lowest level since NYMEX opened oil futures trading in 1983.
The selloff can be attributed in part to market mechanics. The May futures contract for West Texas Intermediate, the US benchmark, is about to expire. Most investors are already focusing on the June contract, thinning out trading volume and feeding volatility, UBS analyst Giovanni Staunovo said.
The June futures contract for WTI is trading around $22 per barrel, but that''s still sharply lower on the day. Brent crude futures, the global benchmark, fell 8% Monday to $25.81 per barrel.
The extreme pressure on the WTI contract for May highlights ongoing concerns about the supply and demand dynamics plaguing the oil market.
"No one in America wants oil in the short term," Jeffrey Halley of Oanda told clients on Monday.
Saudi Arabia, Russia and other producers tried to prop up prices with a deal last week to slash production by 9.7 million barrels per day in May and June, the deepest cut ever negotiated. But that isn''t expected to soak up the supply glut caused by evaporating demand for energy.
Oil storage facilities are still at risk of overflowing, raising the chance that some oil producers in the United States and Canada could start paying customers to take crude off their hands, according to Staunovo.', N'mountain.jpeg', N'Julia Horowitz', CAST(N'2020-04-21T09:05:00.000' AS DateTime), N'London (CNN Business)The spectacular collapse in oil markets is showing no signs of easing, as the coronavirus crisis saps demand and producers run out of places to store all their excess barrels of crude.')
INSERT [dbo].[digitalnews] ([id], [title], [description], [image], [author], [posttime], [short_des]) VALUES (7, N'White House set to use Defense Production Act to ramp up testing swab manufacturing', N'The White House is preparing to use the Defense Production Act to give a Maine medical supplies company federal funding so it can ramp up its production of swabs needed for coronavirus testing.

President Donald Trump announced Sunday he will compel a US company to make swabs under the Defense Production Act, but Peter Navarro, his trade adviser who Trump tapped to coordinate DPA use, clarified to CNN Monday that the White House plans to use the act to give Puritan Medical Supplies federal funding to boost production.
"Title III of the DPA has been used frequently by the Trump administration over the last three years to provide funding for companies essential to our industrial base and critical to national security. In the case referenced by President Trump, (the Defense Department) is finalizing negotiations under DPA Title III with Puritan, a small company in Guilford, Maine. With DPA support, Puritan will be able to increase its industrial capacity in machine tooling, people, and facilities with the broader goal of increasing nasal swab production from 3 million to more than 20 million within 30 days of the contract award," Navarro told CNN in a statement.
The administration has not finalized the DPA use yet, and it''s not clear how much funding the company will get.', N'lake.jpg', N' Kaitlan Collins', CAST(N'2020-04-21T09:00:00.000' AS DateTime), N'The White House is preparing to use the Defense Production Act to give a Maine medical supplies company federal funding so it can ramp up its production of swabs needed for coronavirus testing.')
GO
USE [master]
GO
ALTER DATABASE [digitalnews] SET  READ_WRITE 
GO
