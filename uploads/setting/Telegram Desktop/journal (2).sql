-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2024 at 07:25 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `journal`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) DEFAULT NULL,
  `AdminPassword` varchar(255) DEFAULT NULL,
  `AdminEmailId` varchar(255) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `userType`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', 'fe743d8d97aa7dfc6c93ccdc2e749513', 'glastaborg@gmail.com', 1, '2021-05-26 18:30:00', '2024-07-07 15:10:31'),
(5, 'Jason', '912ec803b2ce49e4a541068d495ab570', 'jason@gmail.com', 0, '2024-01-04 01:17:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 'Sports', 'Related to sports news', '2021-06-05 18:30:00', '2021-06-13 18:30:00', 1),
(5, 'Entertainment', 'Entertainment related  News', '2021-06-13 18:30:00', '2021-06-13 18:30:00', 1),
(6, 'Innovation', 'Embracing cutting-edge technologies such as virtual reality, artificial intelligence, and interactive learning platforms, innovation in education ensures that students engage with content in immersive and meaningful ways.', '2021-06-21 18:30:00', '2023-12-30 01:04:50', 1),
(9, 'Resources', 'Articles, Publications, and Journals', '2023-12-30 01:07:59', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` int(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcomments`
--

INSERT INTO `tblcomments` (`id`, `postId`, `name`, `email`, `comment`, `postingDate`, `status`) VALUES
(4, 14, 'Isaac', 'Isaac@gmail.com', 'Please, I can download it without logging in.', '2024-01-04 23:14:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'About News Portal', '<font color=\"#000\" face=\"Mercury SSm A, Mercury SSm B, Georgia, Times, Times New Roman, Microsoft YaHei New, Microsoft Yahei, å¾®è½¯é›…é»‘, å®‹ä½“, SimSun, STXihei, åŽæ–‡ç»†é»‘, serif\"><span style=\"font-size: 20px;\">Welcome to our innovative Welcome to our innovative and user-friendly journal web app, designed to revolutionize the way you document and reflect on your thoughts and experiences. Our platform seamlessly blends intuitive functionality with a sleek and modern interface, providing you with an effortless and enjoyable journaling experience. Whether you\'re a seasoned writer, a busy professional looking to capture fleeting moments, or someone simply seeking a private space for self-expression, our journal web app caters to all.\r\n<br>\r\nWith robust features such as password protection, multimedia integration, and customizable templates, you have the flexibility to personalize your journal entries to suit your unique style. Our app also employs state-of-the-art security measures to ensure the confidentiality of your thoughts. Embrace the power of reflection, goal-setting, and personal growth through the convenience of our journal web app. Start your journey today, as we empower you to chronicle your life\'s story in a digital space that is both secure and tailored to your individual needs.\r\n<br>\r\nFurthermore, our journal web app goes beyond traditional pen-and-paper methods by harnessing the potential of technology to enhance your journaling experience. You can seamlessly sync your entries across multiple devices, ensuring that your reflections are always at your fingertips, whether you\'re on the go or at home. The app also leverages artificial intelligence to provide insightful prompts, encouraging deep introspection and sparking creativity in your writing.\r\n<br>\r\nIn addition to its personal benefits, our journal web app fosters a sense of community by allowing users to connect with like-minded individuals who share their interests or goals. You can opt to share selected entries, inspiring others with your journey or gaining inspiration from theirs. The app\'s user-friendly interface ensures that whether you\'re a tech enthusiast or a novice, you can effortlessly navigate and make the most of the rich features at your disposal. Embrace the future of journaling with our web app, where the convergence of technology and personal expression creates a dynamic and transformative space for self-discovery and connection.</span></font><br>', '2021-06-29 18:30:00', '2024-01-03 23:56:08'),
(2, 'contactus', 'Contact Details', '<p style=\"font-family: \'Times New Roman\'; font-size: 24px;\"><b>Address :</b> Burma Camp</p>\r\n<p style=\"font-family: \'Times New Roman\'; font-size: 24px;\"><b>Phone Number :</b> +233-559866650</p>\r\n<p style=\"font-family: \'Times New Roman\'; font-size: 24px;\"><b>Email :</b> glastaborg@gmail.com</p>\r\n', '2021-06-29 18:30:00', '2024-01-04 00:14:59');

-- --------------------------------------------------------

--
-- Table structure for table `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext DEFAULT NULL,
  `PostImage` varchar(255) DEFAULT NULL,
  `viewCounter` int(11) DEFAULT NULL,
  `postedBy` varchar(255) DEFAULT NULL,
  `lastUpdatedBy` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`, `viewCounter`, `postedBy`, `lastUpdatedBy`) VALUES
(7, 'AN ASSESSMENT OF THE MARITIME BOUNDARY DISPUTE BETWEEN GHANA AND COTE D’IVOIRE SINCE 2007', 9, 4, '<p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\"><span style=\"color: rgb(102, 102, 102); font-family: Helvetica; font-size: 14px;\">Diplomatic relations between Ghana and her western neighbour, Cote d’Ivoire, got strained when Cote d’Ivoire in 2008 challenged Ghana over a maritime boundary. The disputed area covers portions of the Tweneboa-Enyenra-Ntomme (TEN) and the Deepwater Tano blocks, where Ghana is currently carrying out oil exploration and exploitation. The area is estimated to hold about 2 billion barrels of oil reserves and 1.2 trillion cubic feet of natural gas. The boundary dispute intensified in 2010 when Vanco, an oil exploration company discovered oil in the Dzata-1 deepwater-well for Ghana. This dispute poses a threat to the peaceful relations between the two countries and as requires a one-time solution to ensure that the two countries continue to live peacefully as neighbours. The main objective of the research conducted was to assess the position of both parties and evaluate the consequences of the dispute on the bilateral relations between the two neighbours and in doing so the qualitative approach to research was used. The research approach was chosen based on the fact that the research is descriptive in form. Key findings included the fact that Ghana and Cote d’Ivoire could not arrive at mutual agreement despite several bilateral attempts. Also, Ghana may be required to make appropriate reparations at the end of the case should the Special Chamber determine that any part of the disputed area pertains to Cote d’Ivoire and if it concludes that any rights of Cote d’Ivoire have been violated by the activities of Ghana in the area. The fact that the two countries could not reach an amicable settlement of the dispute is an indication that current relations between the two countries is not the best. The two countries should therefore continue to use peaceful means in resolving their differences and refrain from any act that will undermine the provisional rulings of the Special Chamber.</span><br></p>', '2023-12-20 22:34:00', '2024-07-07 15:35:46', 1, 'AN-ASSESSMENT-OF-THE-MARITIME-BOUNDARY-DISPUTE-BETWEEN-GHANA-AND-COTE-D’IVOIRE-SINCE-2007', '23ec284dedebe7105fa7b953285a745a.jpg', 50, 'admin', 'admin'),
(10, 'AN EXAMINATION OF THE IMPACT OF UNITED NATIONS PEACEKEEPING OPERATIONS ON THE GHANA ARMED FORCES', 9, 5, '<h1 style=\"box-sizing: inherit; margin-top: 0px; padding: 0px; font-family: Roboto, sans-serif; font-size: 38px; line-height: normal; letter-spacing: -0.5px; color: rgb(51, 51, 51);\"><span style=\"color: rgb(102, 102, 102); font-family: Helvetica; font-size: 14px; letter-spacing: normal;\">Ghana, and for that matter, the Ghana Armed Forces (GAF) has contributed significantly to the United Nations Peacekeeping Operations (UNPKOs) since 1960. This has enabled Ghana to gain the international status as one of the largest African contributors to United Nations Peacekeeping Operations. Several studies have been conducted in recent times; such as Aubyn and Aning, (2015), Aboagye (1999), Addae (2005) and Atintande (2012) with regards to how UN PKOs have impacted on Ghana as a country. However, there is a dearth of exploration on the impact of these Operations on the Ghana Armed Forces as an institution. Therefore, this study focused on examining the impact of UN PKOs on personnel of GAF and the GAF as an institution. The study was purely qualitative and relied primarily on both secondary and primary sources of data. Data collected was analyzed using content analysis. The main findings of the study were that, the UN PKOs have both negative and positive impacts on personnel of the GAF and the GAF as an institution. On one hand, UN PKOs have some positive benefits on GAF such as economic benefits, capacity-building and development of both personnel and GAF as an institution, good global image for the GAF and its personnel, providing professional training programmes in peacekeeping and global security issues and finally contributed to the stability of Ghana. On the other hand, the negative impacts of UN PKOs include exposure of personnel to health threats, fatalities and casualties, brain drain amongst troops of the GAF, extra burden on military personnel of GAF in terms of responsibilities and moral decadence on the part of some military personnel. Based on the findings of the study, it is concluded that, UN Peacekeeping Operations have significant impact on the personnel and the GAF as an institution. Towards this end, the study recommends the need to build capacity with national and international stakeholders in order to develop innovative responses towards the improvement and addressing of contemporary challenges facing TCC in the changing pattern of UN peacekeeping operations.</span><br></h1>', '2023-12-25 15:48:00', '2024-01-09 07:35:01', 1, 'AN-EXAMINATION-OF-THE-IMPACT-OF-UNITED-NATIONS-PEACEKEEPING-OPERATIONS-ON-THE-GHANA-ARMED-FORCES', '1a6a72c44f4c25d71fba4ba82a7adf01.png', 24, 'admin', 'admin'),
(11, 'GAFCSC GRADUATES 76 JSC STUDENTS', 9, 5, '<p>The Ghana Armed Forces Command and Staff College (GAFCSC) held a graduation ceremony for 76 students of Junior Staff Course 80 on Friday, December 15, 2023, at the Hamidu Hall.\r\n\r\nThe 19-week course brought together students from Ghana and allied countries, aiming to train selected officers in staff functions by developing their leadership, analytical, and communication skills, laying the foundation for their future career development.\r\nThe Guest of Honour, Nana Prah Agyensaim VI, the Paramount Chief of Assin Owirenkyi Traditional Area in the Central Region, emphasized in his speech that the course served as a gateway for the graduates to expand their professional knowledge, gaining broader perspectives on national and global affairs. He highlighted that the curriculum was designed to furnish students with vital competencies for junior and mid-level military roles.\r\n\r\nNana Prah mentioned that the insights the students acquired would undoubtedly position them to navigate and address the complex challenges in their career progression. He reminded them of the critical importance of training in a world fraught with threats to peace, ranging from terrorism to natural disasters, charging them that their newfound knowledge and skills were crucial in understanding and mitigating such threats.\r\n\r\nThe Guest of Honour reiterated that the Ghana Armed Forces played a key role in domestic security operations, emphasizing the importance of robust civil-military relations in resolving security challenges. He urged all attendees to be committed to problem-solving, personnel management, and maintaining high standards of discipline and integrity, upholding the esteemed reputation of the institution through the application of the expertise they had acquired.\r\n\r\nAs part of their studies, Junior Staff Course 80 conducted an Environmental Study Tour to the Bono and Ahafo Regions. They explored challenges in these regions, covering topics such as protecting forest reserves, addressing illegal small-scale mining, and evaluating waste management efforts. Additionally, they focused on promoting access to quality female STEM education in the Bono Region.\r\n<br></p>', '2023-12-30 18:30:00', '2024-01-07 15:18:37', 1, 'GAFCSC-GRADUATES-76-JSC-STUDENTS', 'b314ffe3d633173c87a00111d1ef0024.jpg', 42, 'admin', 'admin'),
(12, 'GAFCSC COMMANDANT WELCOMES STUDENTS OF COURSE 45', 9, 5, '<p class=\"MsoNormal\" style=\"box-sizing: inherit; margin: 0cm 0cm 8pt; color: rgb(117, 127, 149); line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; scroll-behavior: inherit !important;\"><span lang=\"EN-US\" style=\"box-sizing: inherit; scroll-behavior: inherit !important; font-size: 12pt; line-height: 24px; font-family: &quot;Times New Roman&quot;, serif;\">The Commandant, GAFCSC, Major General Irvine Nii-Ayitey Aryeetey, emphasized the importance of diligence and meticulousness to students of the Senior Command and Staff Course 45. He made this assertion during his welcome address on Tuesday, 19 September, 2023, at the Hamidu Hall.</span></p><p class=\"MsoNormal\" style=\"box-sizing: inherit; margin: 0cm 0cm 8pt; color: rgb(117, 127, 149); line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; scroll-behavior: inherit !important;\"><span lang=\"EN-US\" style=\"box-sizing: inherit; scroll-behavior: inherit !important; font-size: 12pt; line-height: 24px; font-family: &quot;Times New Roman&quot;, serif;\">He encouraged the students to conscientiously plan and execute their activities with professionalism and discipline, underlining that effective planning was a crucial element for success in the course. Senior Command and Staff Course 45 assembled on Friday 8 September to commence an 11-month training in leadership, command and staff responsibilities.&nbsp;<a name=\"_Hlk147405010\" style=\"box-sizing: inherit; color: inherit; display: inline-block; transition: all 0.3s ease-out 0s; scroll-behavior: inherit !important;\"></a>The military program is also integrated with some academic programs, namely, Master of Science in Defence and International Politics (MDIP), and Master of Science in Security Studies (MSS). At the end of the academic year, the students will graduate with the Pass Staff Course and MDIP/MSS certificates.</span></p><p class=\"MsoNormal\" style=\"box-sizing: inherit; margin: 0cm 0cm 8pt; color: rgb(117, 127, 149); line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; scroll-behavior: inherit !important;\"><span lang=\"EN-US\" style=\"box-sizing: inherit; scroll-behavior: inherit !important; font-size: 12pt; line-height: 24px; font-family: &quot;Times New Roman&quot;, serif;\">The Course is made up of 98 students from the Ghana Armed Forces and the Armed Forces of Benin, Botswana, Burkina Faso, The Gambia,</span>&nbsp;<span lang=\"EN-US\" style=\"box-sizing: inherit; scroll-behavior: inherit !important; font-size: 12pt; line-height: 24px; font-family: &quot;Times New Roman&quot;, serif;\">Guinea, La Cote D’Ivoire, Liberia and Malawi. Other countries represented are Namibia, Nigeria, Rwanda, Sierra Leone, South Africa, Tanzania, Togo and Zambia.</span></p>', '2023-12-30 18:35:00', '2024-07-07 15:42:33', 1, 'GAFCSC-COMMANDANT-WELCOMES-STUDENTS-OF-COURSE-45', 'e87e67abf845703deea2264ff31d77f4.jpg', 47, 'admin', 'admin'),
(14, 'AFRICAN JOURNAL OF DEFENCE,  SECURITY AND STRATEGY', 9, 9, '<p>The Ghana Armed Forces Command and Staff College has, since its \r\ncreation in 1963, contributed and continues to contribute to scholarly \r\nknowledge. The quality and maturity of its alumni across the African \r\ncontinent attests to the high standards of its human capital development \r\nmodels. The African Journal of Defence, Security and Strategy complements \r\nexisting structures of sharing knowledge generated in the College, by the \r\nalumni, affiliates, and stakeholders. This year, the second edition of the \r\nrefereed academic journal has been produced by the Ghana Armed Forces \r\nCommand and Staff College (GAFCSC).<br></p>\r\n\r\n', '2024-01-04 11:36:37', '2024-07-07 20:30:57', 1, 'AFRICAN-JOURNAL-OF-DEFENCE,--SECURITY-AND-STRATEGY', '4050df3b0ae206b9bd4d543bf7838882.png', 179, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` varchar(255) DEFAULT NULL,
  `SubCatDescription` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 5, 'Get-Together', 'End of year party', '2021-06-21 18:30:00', '2023-12-30 01:07:00', 1),
(4, 9, 'Articles', 'Delve into the world of educational technology, with articles discussing the impact of digital tools, e-learning platforms, and innovative applications on teaching and learning processes.\r\n\r\n', '2021-06-29 18:30:00', '2023-12-30 01:08:53', 1),
(5, 9, 'Publications', 'Stay ahead of the curve with publications that delve into the intricacies of curriculum design and development.', '2021-06-29 18:30:00', '2023-12-30 01:10:12', 1),
(9, 9, 'Journals', 'Stay abreast of cutting-edge technologies transforming education, including virtual learning environments, augmented reality, and adaptive learning systems.', '2021-06-30 18:30:00', '2023-12-30 01:11:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Owura', 'owura@gmail.com', '962012d09b8170d912f0669f6d7d9d07', 'user', '2024-01-03 22:58:30', '2024-01-05 00:23:34'),
(2, 'Isaac', 'jerryjohnabban@gmail.com', '912ec803b2ce49e4a541068d495ab570', 'user', '2024-01-03 22:58:30', NULL),
(3, 'Owuraku', 'owuraku@gmail.com', '962012d09b8170d912f0669f6d7d9d07', 'user', '2024-01-04 02:32:37', NULL),
(4, 'solomon', '1@2.com', 'c44a471bd78cc6c2fea32b9fe028d30a', 'user', '2024-01-04 14:25:22', '2024-07-07 15:08:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AdminUserName` (`AdminUserName`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postcatid` (`CategoryId`),
  ADD KEY `postsucatid` (`SubCategoryId`),
  ADD KEY `subadmin` (`postedBy`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`),
  ADD KEY `catid` (`CategoryId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD CONSTRAINT `pid` FOREIGN KEY (`postId`) REFERENCES `tblposts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD CONSTRAINT `postcatid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `postsucatid` FOREIGN KEY (`SubCategoryId`) REFERENCES `tblsubcategory` (`SubCategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `subadmin` FOREIGN KEY (`postedBy`) REFERENCES `tbladmin` (`AdminUserName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD CONSTRAINT `catid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
