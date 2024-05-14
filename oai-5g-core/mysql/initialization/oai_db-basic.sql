-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 172.16.200.10:3306
-- Generation Time: Mar 22, 2021 at 10:31 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oai_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `AccessAndMobilitySubscriptionData`
--

CREATE TABLE `AccessAndMobilitySubscriptionData` (
  `ueid` varchar(15) NOT NULL,
  `servingPlmnid` varchar(15) NOT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `gpsis` json DEFAULT NULL,
  `internalGroupIds` json DEFAULT NULL,
  `sharedVnGroupDataIds` json DEFAULT NULL,
  `subscribedUeAmbr` json DEFAULT NULL,
  `nssai` json DEFAULT NULL,
  `ratRestrictions` json DEFAULT NULL,
  `forbiddenAreas` json DEFAULT NULL,
  `serviceAreaRestriction` json DEFAULT NULL,
  `coreNetworkTypeRestrictions` json DEFAULT NULL,
  `rfspIndex` int(10) DEFAULT NULL,
  `subsRegTimer` int(10) DEFAULT NULL,
  `ueUsageType` int(10) DEFAULT NULL,
  `mpsPriority` tinyint(1) DEFAULT NULL,
  `mcsPriority` tinyint(1) DEFAULT NULL,
  `activeTime` int(10) DEFAULT NULL,
  `sorInfo` json DEFAULT NULL,
  `sorInfoExpectInd` tinyint(1) DEFAULT NULL,
  `sorafRetrieval` tinyint(1) DEFAULT NULL,
  `sorUpdateIndicatorList` json DEFAULT NULL,
  `upuInfo` json DEFAULT NULL,
  `micoAllowed` tinyint(1) DEFAULT NULL,
  `sharedAmDataIds` json DEFAULT NULL,
  `odbPacketServices` json DEFAULT NULL,
  `serviceGapTime` int(10) DEFAULT NULL,
  `mdtUserConsent` json DEFAULT NULL,
  `mdtConfiguration` json DEFAULT NULL,
  `traceData` json DEFAULT NULL,
  `cagData` json DEFAULT NULL,
  `stnSr` varchar(50) DEFAULT NULL,
  `cMsisdn` varchar(50) DEFAULT NULL,
  `nbIoTUePriority` int(10) DEFAULT NULL,
  `nssaiInclusionAllowed` tinyint(1) DEFAULT NULL,
  `rgWirelineCharacteristics` varchar(50) DEFAULT NULL,
  `ecRestrictionDataWb` json DEFAULT NULL,
  `ecRestrictionDataNb` tinyint(1) DEFAULT NULL,
  `expectedUeBehaviourList` json DEFAULT NULL,
  `primaryRatRestrictions` json DEFAULT NULL,
  `secondaryRatRestrictions` json DEFAULT NULL,
  `edrxParametersList` json DEFAULT NULL,
  `ptwParametersList` json DEFAULT NULL,
  `iabOperationAllowed` tinyint(1) DEFAULT NULL,
  `wirelineForbiddenAreas` json DEFAULT NULL,
  `wirelineServiceAreaRestriction` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Amf3GppAccessRegistration`
--

CREATE TABLE `Amf3GppAccessRegistration` (
  `ueid` varchar(15) NOT NULL,
  `amfInstanceId` varchar(50) NOT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `purgeFlag` tinyint(1) DEFAULT NULL,
  `pei` varchar(50) DEFAULT NULL,
  `imsVoPs` json DEFAULT NULL,
  `deregCallbackUri` varchar(50) NOT NULL,
  `amfServiceNameDereg` json DEFAULT NULL,
  `pcscfRestorationCallbackUri` varchar(50) DEFAULT NULL,
  `amfServiceNamePcscfRest` json DEFAULT NULL,
  `initialRegistrationInd` tinyint(1) DEFAULT NULL,
  `guami` json NOT NULL,
  `backupAmfInfo` json DEFAULT NULL,
  `drFlag` tinyint(1) DEFAULT NULL,
  `ratType` json NOT NULL,
  `urrpIndicator` tinyint(1) DEFAULT NULL,
  `amfEeSubscriptionId` varchar(50) DEFAULT NULL,
  `epsInterworkingInfo` json DEFAULT NULL,
  `ueSrvccCapability` tinyint(1) DEFAULT NULL,
  `registrationTime` varchar(50) DEFAULT NULL,
  `vgmlcAddress` json DEFAULT NULL,
  `contextInfo` json DEFAULT NULL,
  `noEeSubscriptionInd` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `AuthenticationStatus`
--

CREATE TABLE `AuthenticationStatus` (
  `ueid` varchar(20) NOT NULL,
  `nfInstanceId` varchar(50) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `timeStamp` varchar(50) NOT NULL,
  `authType` varchar(25) NOT NULL,
  `servingNetworkName` varchar(50) NOT NULL,
  `authRemovalInd` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `AuthenticationSubscription`
--

CREATE TABLE `AuthenticationSubscription` (
  `ueid` varchar(20) NOT NULL,
  `authenticationMethod` varchar(25) NOT NULL,
  `encPermanentKey` varchar(50) DEFAULT NULL,
  `protectionParameterId` varchar(50) DEFAULT NULL,
  `sequenceNumber` json DEFAULT NULL,
  `authenticationManagementField` varchar(50) DEFAULT NULL,
  `algorithmId` varchar(50) DEFAULT NULL,
  `encOpcKey` varchar(50) DEFAULT NULL,
  `encTopcKey` varchar(50) DEFAULT NULL,
  `vectorGenerationInHss` tinyint(1) DEFAULT NULL,
  `n5gcAuthMethod` varchar(15) DEFAULT NULL,
  `rgAuthenticationInd` tinyint(1) DEFAULT NULL,
  `supi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AuthenticationSubscription`
--
INSERT INTO `AuthenticationSubscription` (`ueid`, `authenticationMethod`, `encPermanentKey`, `protectionParameterId`, `sequenceNumber`, `authenticationManagementField`, `algorithmId`, `encOpcKey`, `encTopcKey`, `vectorGenerationInHss`, `n5gcAuthMethod`, `rgAuthenticationInd`, `supi`) VALUES
('208990100001101', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6966', 'a92d71ed92f43ebae1720f34fd2e6966', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC1', NULL, NULL, NULL, NULL, '208990100001101'),
('208990100001102', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6967', 'a92d71ed92f43ebae1720f34fd2e6967', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC2', NULL, NULL, NULL, NULL, '208990100001102'),
('208990100001103', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6968', 'a92d71ed92f43ebae1720f34fd2e6968', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC3', NULL, NULL, NULL, NULL, '208990100001103'),
('208990100001104', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6969', 'a92d71ed92f43ebae1720f34fd2e6969', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC4', NULL, NULL, NULL, NULL, '208990100001104'),
('208990100001105', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6970', 'a92d71ed92f43ebae1720f34fd2e6970', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC5', NULL, NULL, NULL, NULL, '208990100001105'),
('208990100001106', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6971', 'a92d71ed92f43ebae1720f34fd2e6971', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC6', NULL, NULL, NULL, NULL, '208990100001106'),
('208990100001107', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6972', 'a92d71ed92f43ebae1720f34fd2e6972', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC7', NULL, NULL, NULL, NULL, '208990100001107'),
('208990100001108', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6973', 'a92d71ed92f43ebae1720f34fd2e6973', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC8', NULL, NULL, NULL, NULL, '208990100001108'),
('208990100001109', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6974', 'a92d71ed92f43ebae1720f34fd2e6974', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC9', NULL, NULL, NULL, NULL, '208990100001109'),
('208990100001110', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6975', 'a92d71ed92f43ebae1720f34fd2e6975', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77C10', NULL, NULL, NULL, NULL, '208990100001110'),
('208990100001111', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6976', 'a92d71ed92f43ebae1720f34fd2e6976', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77C11', NULL, NULL, NULL, NULL, '208990100001111'),
('208990100001112', '5G_AKA', 'a92d71ed92f43ebae1720f34fd2e6977', 'a92d71ed92f43ebae1720f34fd2e6977', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77C12', NULL, NULL, NULL, NULL, '208990100001112');

-- --------------------------------------------------------

--
-- Table structure for table `SdmSubscriptions`
--

CREATE TABLE `SdmSubscriptions` (
  `ueid` varchar(15) NOT NULL,
  `subsId` int(10) UNSIGNED NOT NULL,
  `nfInstanceId` varchar(50) NOT NULL,
  `implicitUnsubscribe` tinyint(1) DEFAULT NULL,
  `expires` varchar(50) DEFAULT NULL,
  `callbackReference` varchar(50) NOT NULL,
  `amfServiceName` json DEFAULT NULL,
  `monitoredResourceUris` json NOT NULL,
  `singleNssai` json DEFAULT NULL,
  `dnn` varchar(50) DEFAULT NULL,
  `subscriptionId` varchar(50) DEFAULT NULL,
  `plmnId` json DEFAULT NULL,
  `immediateReport` tinyint(1) DEFAULT NULL,
  `report` json DEFAULT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `contextInfo` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SessionManagementSubscriptionData`
--

CREATE TABLE `SessionManagementSubscriptionData` (
  `ueid` varchar(15) NOT NULL,
  `servingPlmnid` varchar(15) NOT NULL,
  `singleNssai` json NOT NULL,
  `dnnConfigurations` json DEFAULT NULL,
  `internalGroupIds` json DEFAULT NULL,
  `sharedVnGroupDataIds` json DEFAULT NULL,
  `sharedDnnConfigurationsId` varchar(50) DEFAULT NULL,
  `odbPacketServices` json DEFAULT NULL,
  `traceData` json DEFAULT NULL,
  `sharedTraceDataId` varchar(50) DEFAULT NULL,
  `expectedUeBehavioursList` json DEFAULT NULL,
  `suggestedPacketNumDlList` json DEFAULT NULL,
  `3gppChargingCharacteristics` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SmfRegistrations`
--

CREATE TABLE `SmfRegistrations` (
  `ueid` varchar(15) NOT NULL,
  `subpduSessionId` int(10) NOT NULL,
  `smfInstanceId` varchar(50) NOT NULL,
  `smfSetId` varchar(50) DEFAULT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `pduSessionId` int(10) NOT NULL,
  `singleNssai` json NOT NULL,
  `dnn` varchar(50) DEFAULT NULL,
  `emergencyServices` tinyint(1) DEFAULT NULL,
  `pcscfRestorationCallbackUri` varchar(50) DEFAULT NULL,
  `plmnId` json NOT NULL,
  `pgwFqdn` varchar(50) DEFAULT NULL,
  `epdgInd` tinyint(1) DEFAULT NULL,
  `deregCallbackUri` varchar(50) DEFAULT NULL,
  `registrationReason` json DEFAULT NULL,
  `registrationTime` varchar(50) DEFAULT NULL,
  `contextInfo` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SmfSelectionSubscriptionData`
--

CREATE TABLE `SmfSelectionSubscriptionData` (
  `ueid` varchar(15) NOT NULL,
  `servingPlmnid` varchar(15) NOT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `subscribedSnssaiInfos` json DEFAULT NULL,
  `sharedSnssaiInfosId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AccessAndMobilitySubscriptionData`
--
ALTER TABLE `AccessAndMobilitySubscriptionData`
  ADD PRIMARY KEY (`ueid`,`servingPlmnid`) USING BTREE;

--
-- Indexes for table `Amf3GppAccessRegistration`
--
ALTER TABLE `Amf3GppAccessRegistration`
  ADD PRIMARY KEY (`ueid`);

--
-- Indexes for table `AuthenticationStatus`
--
ALTER TABLE `AuthenticationStatus`
  ADD PRIMARY KEY (`ueid`);

--
-- Indexes for table `AuthenticationSubscription`
--
ALTER TABLE `AuthenticationSubscription`
  ADD PRIMARY KEY (`ueid`);

--
-- Indexes for table `SdmSubscriptions`
--
ALTER TABLE `SdmSubscriptions`
  ADD PRIMARY KEY (`subsId`,`ueid`) USING BTREE;

--
-- Indexes for table `SessionManagementSubscriptionData`
--
ALTER TABLE `SessionManagementSubscriptionData`
  ADD PRIMARY KEY (`ueid`,`servingPlmnid`) USING BTREE;

--
-- Indexes for table `SmfRegistrations`
--
ALTER TABLE `SmfRegistrations`
  ADD PRIMARY KEY (`ueid`,`subpduSessionId`) USING BTREE;

--
-- Indexes for table `SmfSelectionSubscriptionData`
--
ALTER TABLE `SmfSelectionSubscriptionData`
  ADD PRIMARY KEY (`ueid`,`servingPlmnid`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--


INSERT INTO `SessionManagementSubscriptionData` (`ueid`, `servingPlmnid`, `singleNssai`, `dnnConfigurations`, `internalGroupIds`, `sharedVnGroupDataIds`, `sharedDnnConfigurationsId`, `odbPacketServices`, `traceData`, `sharedTraceDataId`, `expectedUeBehavioursList`, `suggestedPacketNumDlList`, `3gppChargingCharacteristics`) VALUES
('208990100001101', '20899', '{\"sd\": \"16777204\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.100\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001102', '20899', '{\"sd\": \"16777205\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.101\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001103', '20899', '{\"sd\": \"16777206\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.102\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001104', '20899', '{\"sd\": \"16777207\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.103\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001105', '20899', '{\"sd\": \"16777208\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.104\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001106', '20899', '{\"sd\": \"16777209\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.105\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001107', '20899', '{\"sd\": \"16777210\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.106\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001108', '20899', '{\"sd\": \"16777211\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.107\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001109', '20899', '{\"sd\": \"16777212\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.108\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001110', '20899', '{\"sd\": \"16777213\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.109\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001111', '20899', '{\"sd\": \"16777214\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.110\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('208990100001112', '20899', '{\"sd\": \"16777215\", \"sst\": 1}', '{\"ims\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 2, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4V6\"}}, \"oai\": {\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"}, \"sessionAmbr\": {\"uplink\": \"1000Mbps\", \"downlink\": \"1000Mbps\"}, \"5gQosProfile\": {\"5qi\": 1, \"arp\": {\"preemptCap\": \"NOT_PREEMPT\", \"preemptVuln\": \"PREEMPTABLE\", \"priorityLevel\": 15}, \"priorityLevel\": 1}, \"pduSessionTypes\": {\"defaultSessionType\": \"IPV4\"}, \"staticIpAddress\": [{\"ipv4Addr\": \"12.1.1.111\"}]}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- AUTO_INCREMENT for table `SdmSubscriptions`
--
ALTER TABLE `SdmSubscriptions`
  MODIFY `subsId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

