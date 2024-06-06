-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2024 at 02:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insect_detection`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblresult`
--

CREATE TABLE `tblresult` (
  `id` int(100) NOT NULL,
  `outputresult` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblresult`
--

INSERT INTO `tblresult` (`id`, `outputresult`) VALUES
(1, 'AdultStage_10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesticide`
--

CREATE TABLE `tbl_pesticide` (
  `Id` int(100) NOT NULL,
  `cls_no` varchar(100) NOT NULL,
  `pst_name` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pesticide`
--

INSERT INTO `tbl_pesticide` (`Id`, `cls_no`, `pst_name`) VALUES
(1, '0', 'Chlorantraniliprole,Monocrotophos'),
(2, '1', 'Chlorpyrifos,Imidacloprid,Thiamethoxam'),
(3, '2', 'Quinalphos 25 EC 1000 ml/ha,Phosphamidon 40 SL 600 ml/ha, Profenophos 50 EC 1000 ml/ha'),
(4, '3', 'Abamectin,Tebufenozide'),
(5, '4', 'Spinosad,Chlorantraniliprole,Fipronil'),
(6, '5', 'Phorate,Carbofuran,Chlorpyrifos'),
(7, '6', 'Fipronil'),
(8, '7', 'Neonicotinoids,Carbamates'),
(9, '8', 'Organophosphates,Carbamates'),
(10, '9', 'Steinernema,Heterorhabditis'),
(11, '10', 'Carbosulfan,Imidacloprid,Lambda-cyhalothrin'),
(12, '11', 'Imidacloprid,Fipronil'),
(13, '12', 'Neoseiulus cucumeris,Amblyseius cucumeris'),
(14, '13', 'Isogashi,Yuri'),
(15, '14', 'Pyrethroids,Imidacloprid'),
(16, '15', 'Trichlorfon'),
(17, '16', 'Cyantraniliprole'),
(18, '17', 'Cartap hydrochloride,Trichlorofon'),
(19, '18', 'Steinernema carpocapsae'),
(20, '19', 'Spinosad,cypermethrin'),
(21, '20', 'bifenthrin'),
(22, '21', 'miticides'),
(23, '22', 'Pyrethroids'),
(24, '23', 'Spinosad, Pyrethroids'),
(25, '24', 'Pesto Raze'),
(26, '25', 'Imidacloprid'),
(27, '26', 'chlorpyrifos'),
(28, '27', 'thiamethoxam'),
(29, '28', 'Cruiser, Gaucho and Poncho'),
(30, '29', 'oataphid-Spinosad'),
(31, '30', 'Macroglenes penetrans'),
(32, '31', 'Abamectin'),
(33, '32', 'Bifenazate'),
(34, '33', 'Pyrethroids'),
(35, '34', 'Chlorpyrifos'),
(36, '35', 'Lambda-cyhalothrin'),
(37, '36', 'Thiamethoxam'),
(38, '37', 'Neonicotinoids'),
(39, '38', 'Carbamates'),
(40, '39', 'Bacillus thuringiensis'),
(41, '40', 'Organophosphates'),
(42, '41', 'Pyrethroids'),
(43, '42', 'Neonicotinoids'),
(44, '43', 'Imidacloprid'),
(45, '44', 'Lambda-cyhalothrin'),
(46, '45', 'Pyrethroids'),
(47, '46', 'Botanical insecticides'),
(48, '47', 'Organophosphates'),
(49, '48', 'Malathion'),
(50, '49', 'Organophosphates'),
(51, '50', 'Cypermethrin 10 EC: 1 mL L-1 Chlorpyriphos 20 EC: 2 mL L-1 Acephate 75 SP: 2 g L-1'),
(52, '51', 'Sevin 4F, Sevin 80S, Sevin XLR, or Warrior 1 CS'),
(53, '52', 'Bifenthrin Chloronicotinyls'),
(54, '53', 'imidacloprid, acetamiprid, emamectin, and spinosad'),
(55, '54', 'Thrips Raze bio'),
(56, '55', 'Phosalone'),
(57, '56', 'Azadirachtin,Beauveria bassiana,Fermented cow urine,Imidacloprid'),
(58, '57', 'Nitenpyram,Veratramine and pyrethrins,Chlorpyrifos, bifenthrin, avermectin, and emamectin benzoate'),
(59, '58', 'Fenoxycarb, Methoxyfenozide, Pyriproxyfen, and Tebufenozide'),
(60, '59', 'spirotetramat'),
(61, '60', 'Organophosphorus sprays, Carbamate sprays, Synthetic pyrethroid sprays, Wettable sulfur, and Dusting sulfur'),
(62, '61', 'bifenthrin, hexythiazox, and horticultural oils'),
(63, '62', 'L.pseudo-annulata, P.japonica, and E.graminicolum'),
(64, '63', 'abamectin, propargite, and dicofol'),
(65, '64', 'Liquid ethyl formate (EF)'),
(66, '65', 'Deltamethrin'),
(67, '66', 'Deltamethrin: 2.8% Cypermethrin: 2.5% Dimethoate: 60%'),
(68, '67', 'Chlorpyrifos'),
(69, '68', 'Imidacloprid and fipronil'),
(70, '69', 'Cicadella viridis'),
(71, '70', 'dimethoate, indoxacarb, or fipronil'),
(72, '71', 'Neonicotinoids, Pyrethroids, Ketoenols, and Imidacloprid'),
(73, '72', '50% phoxim: Diluted 1:700–1000 20% isofenphos-methyl emulsion Diluted 1:1500–2000 80% dichlorvos emulsion'),
(74, '73', 'β-ionone'),
(75, '74', 'Abamectin,Fluralaner'),
(76, '75', 'bromopropilate,fonnetanate,formetanate'),
(77, '76', 'Oligonucleotide Insecticides'),
(78, '77', 'aromatic oil of Litsea cubeba'),
(79, '78', 'buprofezin'),
(80, '79', 'deltamethrin'),
(81, '80', 'dimetboate, parathion , malathion'),
(82, '81', 'Pseudaphycus utilis Timberlake'),
(83, '82', 'imidacloprid'),
(84, '83', 'Malathion'),
(85, '84', 'fenthion, dimethoate'),
(86, '85', 'Malathion'),
(87, '86', 'Gardona, endosulfan,malathion,dichlorvos,trichlorfon,endrin,methyl para- thion'),
(88, '87', 'pyrethrins or permethrin'),
(89, '88', 'neonicotinoid'),
(90, '89', 'Neem seed extracts, Dominion Fruit Tree and Vegetable Spray'),
(91, '90', 'Azadirachtin,Ozoneem'),
(92, '91', 'Citrus auranticola'),
(93, '92', 'imidacloprid'),
(94, '93', 'spinosad, malathion'),
(95, '94', 'Fungal insecticides'),
(96, '95', 'deltamethrin or pyrethroids'),
(97, '96', 'trichlorphon, deltamelthrin and fenvalerate'),
(98, '97', 'carbaryl, quinalphos, monocrotophos, fenvalerate or cypermethrin'),
(99, '98', 'cypermethrin'),
(100, '99', 'dinotefuran'),
(101, '100', 'lambdacyhalothrin'),
(102, '101', 'Imidacloprid');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pestnames`
--

CREATE TABLE `tbl_pestnames` (
  `id` int(100) NOT NULL,
  `class_no` int(100) NOT NULL,
  `pestName` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pestnames`
--

INSERT INTO `tbl_pestnames` (`id`, `class_no`, `pestName`) VALUES
(1, 0, 'rice leaf roller'),
(2, 1, 'rice leaf caterpillar'),
(3, 2, 'paddy stem maggot'),
(4, 3, 'asiatic rice borer'),
(5, 4, 'yellow rice borer'),
(6, 5, 'rice gall midge'),
(7, 6, 'Rice Stemfly'),
(8, 7, 'brown plant hopper'),
(9, 8, 'white backed plant hopper'),
(10, 9, 'small brown plant hopper'),
(11, 10, 'rice water weevil'),
(12, 11, 'rice leafhopper'),
(13, 12, 'grain spreader thrips'),
(14, 13, 'rice shell pest'),
(15, 14, 'grub'),
(16, 15, 'mole cricket'),
(17, 16, 'wireworm'),
(18, 17, 'white margined moth'),
(19, 18, 'black cutworm'),
(20, 19, 'large cutworm'),
(21, 20, 'yellow cutworm'),
(22, 21, 'red spider'),
(23, 22, 'corn borer'),
(24, 23, 'army worm'),
(25, 24, 'aphids'),
(26, 25, 'Potosiabre vitarsis'),
(27, 26, 'peach borer'),
(28, 27, 'english grain aphid'),
(29, 28, 'green bug'),
(30, 29, 'bird cherry-oataphid'),
(31, 30, 'wheat blossom midge'),
(32, 31, 'penthaleus major'),
(33, 32, 'longlegged spider mite'),
(34, 33, 'wheat phloeothrips'),
(35, 34, 'wheat sawfly'),
(36, 35, 'cerodonta denticornis'),
(37, 36, 'beet fly'),
(38, 37, 'flea beetle'),
(39, 38, 'cabbage army worm'),
(40, 39, 'beet army worm'),
(41, 40, 'Beet spot flies'),
(42, 41, 'meadow moth'),
(43, 42, 'beet weevil'),
(44, 43, 'sericaorient alismots chulsky'),
(45, 44, 'alfalfa weevil'),
(46, 45, 'flax budworm'),
(47, 46, 'alfalfa plant bug'),
(48, 47, 'tarnished plant bug'),
(49, 48, 'Locustoidea'),
(50, 49, 'lytta polita'),
(51, 50, 'legume blister beetle'),
(52, 51, 'blister beetle'),
(53, 52, 'therioaphis maculata Buckton'),
(54, 53, 'odontothrips loti'),
(55, 54, 'Thrips'),
(56, 55, 'alfalfa seed chalcid'),
(57, 56, 'Pieris canidia'),
(58, 57, 'Apolygus lucorum'),
(59, 58, 'Limacodidae'),
(60, 59, 'Viteus vitifoliae'),
(61, 60, 'Colomerus vitis'),
(62, 61, 'Brevipoalpus lewisi McGregor'),
(63, 62, 'oides decempunctata'),
(64, 63, 'Polyphagotars onemus latus'),
(65, 64, 'Pseudococcus comstocki Kuwana'),
(66, 65, 'parathrene regalis'),
(67, 66, 'Ampelophaga'),
(68, 67, 'Lycorma delicatula'),
(69, 68, 'Xylotrechus'),
(70, 69, 'Cicadella viridis'),
(71, 70, 'Miridae'),
(72, 71, 'Trialeurodes vaporariorum'),
(73, 72, 'Erythroneura apicalis'),
(74, 73, 'Papilio xuthus'),
(75, 74, 'Panonchus citri McGregor'),
(76, 75, 'Phyllocoptes oleiverus ashmead'),
(77, 76, 'Icerya purchasi Maskell'),
(78, 77, 'Unaspis yanonensis'),
(79, 78, 'Ceroplastes rubens'),
(80, 79, 'Chrysomphalus aonidum'),
(81, 80, 'Parlatoria zizyphus Lucus'),
(82, 81, 'Nipaecoccus vastalor'),
(83, 82, 'Aleurocanthus spiniferus'),
(84, 83, 'Tetradacus c Bactrocera minax'),
(85, 84, 'Dacus dorsalis(Hendel)'),
(86, 85, 'Bactrocera tsuneonis'),
(87, 86, 'Prodenia litura'),
(88, 87, 'Adristyrannus'),
(89, 88, 'Phyllocnistis citrella Stainton'),
(90, 89, 'Toxoptera citricidus'),
(91, 90, 'Toxoptera aurantii'),
(92, 91, 'Aphis citricola Vander Goot'),
(93, 92, 'Scirtothrips dorsalis Hood'),
(94, 93, 'Dasineura sp'),
(95, 94, 'Lawana imitata Melichar'),
(96, 95, 'Salurnis marginella Guerr'),
(97, 96, 'Deporaus marginatus Pascoe'),
(98, 97, 'Chlumetia transversa'),
(99, 98, 'Mango flat beak leafhopper'),
(100, 99, 'Rhytidodera bowrinii white'),
(101, 100, 'Sternochetus frigidus'),
(102, 101, 'Cicadellidae');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_register`
--

CREATE TABLE `tbl_register` (
  `id` int(100) NOT NULL,
  `yourname` varchar(100) NOT NULL,
  `mob` varchar(100) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_register`
--

INSERT INTO `tbl_register` (`id`, `yourname`, `mob`, `emailid`, `address`, `uname`, `pass`) VALUES
(4, 'Siddanna Birajdar', '7387348406', 'siddubbirajdar25@gmail.com', 'Soddi, Soddi, Solapur, Maharashtra-413319', 'siddu', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_uploadimg`
--

CREATE TABLE `tbl_uploadimg` (
  `id` int(100) NOT NULL,
  `uploadimg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_uploadimg`
--

INSERT INTO `tbl_uploadimg` (`id`, `uploadimg`) VALUES
(1, 'Screenshot (1).png'),
(2, 'Screenshot (1).png'),
(3, '06209.jpg'),
(4, '12175.jpg'),
(5, '00693.jpg'),
(6, '06227.jpg'),
(7, '00693.jpg'),
(8, '13598.jpg'),
(9, '13598.jpg'),
(10, '12175.jpg'),
(11, '02918.jpg'),
(12, '02918.jpg'),
(13, '02928.jpg'),
(14, '03017.jpg'),
(15, '02928.jpg'),
(16, '03054.jpg'),
(17, '02918.jpg'),
(18, '03085.jpg'),
(19, '21268.jpg'),
(20, '30106.jpg'),
(21, '68148.jpg'),
(22, '58505.jpg'),
(23, '43079.jpg'),
(24, '37036 - Copia.jpg'),
(25, 'left_rotated_45072.jpg'),
(26, ''),
(27, '07160.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblresult`
--
ALTER TABLE `tblresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pesticide`
--
ALTER TABLE `tbl_pesticide`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbl_pestnames`
--
ALTER TABLE `tbl_pestnames`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_register`
--
ALTER TABLE `tbl_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_uploadimg`
--
ALTER TABLE `tbl_uploadimg`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblresult`
--
ALTER TABLE `tblresult`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_pesticide`
--
ALTER TABLE `tbl_pesticide`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `tbl_pestnames`
--
ALTER TABLE `tbl_pestnames`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `tbl_register`
--
ALTER TABLE `tbl_register`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_uploadimg`
--
ALTER TABLE `tbl_uploadimg`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
