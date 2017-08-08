-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: declarafacil
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `taxpayer_account_receivable`
--

DROP TABLE IF EXISTS `taxpayer_account_receivable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_account_receivable` (
  `id_account_receivable` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de la cuenta por pagar',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_account_receivable`),
  KEY `fk_taxpayer_account_receivable_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_account_receivable_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de cuentas por cobrar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_account_receivable`
--

LOCK TABLES `taxpayer_account_receivable` WRITE;
/*!40000 ALTER TABLE `taxpayer_account_receivable` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_account_receivable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_asset_foreign_currency`
--

DROP TABLE IF EXISTS `taxpayer_asset_foreign_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_asset_foreign_currency` (
  `id_asset_foreign_currency` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `unit_currency` varchar(100) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `value_COP` decimal(14,2) unsigned NOT NULL,
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_asset_foreign_currency`),
  KEY `fk_taxpayer_goods_foreign_currency_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_goods_foreign_currency_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_asset_foreign_currency`
--

LOCK TABLES `taxpayer_asset_foreign_currency` WRITE;
/*!40000 ALTER TABLE `taxpayer_asset_foreign_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_asset_foreign_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_bank_account_saving`
--

DROP TABLE IF EXISTS `taxpayer_bank_account_saving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_bank_account_saving` (
  `id_bank_account_saving` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL COMMENT 'Nombre del banco',
  `bank_account_saving_type` varchar(100) NOT NULL COMMENT 'Tipo de cuenta de ahorros: cuenta de ahorros, cuenta corriente, CDT, Cooperativa, cuenta AFC, otras',
  `withdrawals` tinyint(1) NOT NULL COMMENT 'Boolean que indica si se han hecho retiros',
  `earned_interests` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Intereses ganados',
  `balance` decimal(14,2) unsigned NOT NULL COMMENT 'Saldo a 31 de Diciembre',
  `minimum_stay_time` tinyint(1) DEFAULT NULL COMMENT 'Boolean que indica si el valor de los ahorros cumplían con la permanencia minima.\nSi se realizaron retiros de AFC',
  `purchase_housing` tinyint(1) unsigned zerofill DEFAULT NULL COMMENT 'Boolean que indica si los aportes retirados fueron para compra de vivienda.\nSi se realizaron retiros de AFC',
  `withholding_tax` decimal(14,2) DEFAULT NULL COMMENT 'Retenciones en la fuente.\nSi se realizaron retiros de AFC',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  `fmt_value` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Financial movement tax o GMF - 4*1000',
  `others_withdrawals` tinyint(1) DEFAULT '0' COMMENT 'Otros retiros, de cuentas AFC',
  `withdrawals_minimum_stay_value` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'Retiro de cuenta AFC que cumplen el tiempo',
  `withdrawals_purchase_house_value` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'Retiro de cuenta AFC para comprar casa',
  `withdrawals_others_value` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'Retiro de cuenta AFC - otros',
  PRIMARY KEY (`id_bank_account_saving`),
  KEY `fk_taxpayer_bank_account_saving_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_bank_account_saving_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Informacion de una cuenta de tipo ahorro';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_bank_account_saving`
--

LOCK TABLES `taxpayer_bank_account_saving` WRITE;
/*!40000 ALTER TABLE `taxpayer_bank_account_saving` DISABLE KEYS */;
INSERT INTO `taxpayer_bank_account_saving` VALUES (2,'banco lombia','AFC_ACCOUNT',1,NULL,35000.00,1,1,4000.00,1,1,NULL,1,25000.00,12000.00,6000.00);
/*!40000 ALTER TABLE `taxpayer_bank_account_saving` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_business`
--

DROP TABLE IF EXISTS `taxpayer_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_business` (
  `id_business` int(11) NOT NULL,
  `registered_CCB` tinyint(1) NOT NULL COMMENT 'Boolean que define si el negocio se encuentra registrado ante camara y comercio',
  `CIIU_code` int(11) NOT NULL COMMENT 'Código de la actividad económica',
  `business_situation` varchar(100) NOT NULL COMMENT 'Situacion del negocio: Iniciado en 2016, Vendido en 2016, Ninguno de los anteriores',
  `income_description` varchar(100) DEFAULT NULL COMMENT 'Descripción de ingresos',
  `income_value` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Valor de ingresos',
  `income_withholding_tax` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Retencion en la fuente de ingresos',
  `inventory_initial_value_last_year` decimal(14,2) unsigned NOT NULL COMMENT 'Valor inicial inventario 2016',
  `inventory_final_value_last_year` decimal(14,2) unsigned NOT NULL COMMENT 'Valor final inventario 2016',
  `inventory_purchasing_cost` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Costo de las compras',
  `inventory_workforce` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Costos de mano de obra',
  `inventory_supplies` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Materiales y suministros',
  `inventory_other_cost` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Otros costos para prepararse para ventas',
  `expense_fees` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por honorarios profesionales',
  `expense_taxes` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por impuestos',
  `expense_rents` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos de alquiler',
  `expense_insurance` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por seguros',
  `expense_services` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por servicios',
  `expense_legal_expenses` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos legales',
  `expense_maintenance` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Reparaciones y mantenimiento',
  `expense_travels` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Viajes de negocio',
  `expense_stationery` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Papelería y fotocopias',
  `expense_commissions` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por comisiones',
  `expense_adversiting` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por publicidad',
  `expense_interest_bank_charges` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Pagos de intereses y gastos bancarios',
  `payroll_salaries` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por salarios',
  `payroll_transport_allowance` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por auxilio de transporte',
  `payroll_dissmisal_compensation` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por cesantias',
  `payroll_bonus` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por prima',
  `payroll_holidays` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por vacaciones',
  `payroll_health` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por salud',
  `payroll_pension` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por pension',
  `payroll_ARL` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por ARL',
  `payroll_sena` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por Sena',
  `payroll_ICBF` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por ICBF',
  `payroll_compensation_fund` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos por caja de compensacion',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_business`),
  KEY `fk_taxpayer_business_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_business_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_business`
--

LOCK TABLES `taxpayer_business` WRITE;
/*!40000 ALTER TABLE `taxpayer_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_compensation`
--

DROP TABLE IF EXISTS `taxpayer_compensation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_compensation` (
  `id_compensation` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `compensation_cause` varchar(100) NOT NULL COMMENT 'Causa de la indemnizacion: Seguro de vida, daño emergente, lucro cesante',
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor recibido por la indemnizacion',
  `withholding_tax` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Retenciones en la fuente',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_compensation`),
  KEY `fk_taxpayer_compensation_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_compensation_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de ingresos por concepto de indemnizaciones por seguros';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_compensation`
--

LOCK TABLES `taxpayer_compensation` WRITE;
/*!40000 ALTER TABLE `taxpayer_compensation` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_compensation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_dependent`
--

DROP TABLE IF EXISTS `taxpayer_dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_dependent` (
  `id_dependent` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(100) NOT NULL COMMENT 'Identificacion del dependiente como: Cedula de ciudadania, Tarjeta de Identidad, etc.',
  `dependent_type` varchar(100) NOT NULL COMMENT 'Tipo de dependiente: Hijo, padre, conyugue, hermano',
  `dependent_name` varchar(100) NOT NULL COMMENT 'Nombre del dependiente',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_dependent`),
  KEY `fk_taxpayer_dependent_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_dependent_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de un dependiente de un declarante';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_dependent`
--

LOCK TABLES `taxpayer_dependent` WRITE;
/*!40000 ALTER TABLE `taxpayer_dependent` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_dividend`
--

DROP TABLE IF EXISTS `taxpayer_dividend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_dividend` (
  `id_dividend` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `dividends_taxable` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Dividendos gravables de impuesto',
  `dividends_non_taxable` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Dividendos no gravables de impuesto',
  `total_dividends` decimal(14,2) unsigned NOT NULL COMMENT 'Total de dividendos, este es calculado por la suma de dividendos gravables y no gravables',
  `withholding_tax` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Retenciones en la fuente',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_dividend`),
  KEY `fk_taxpayer_dividend_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_dividend_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de los dividendos, que son las distribuciones de ganancias que reciben los socios o accionistas, de acuerdo con sus porcentaje de participación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_dividend`
--

LOCK TABLES `taxpayer_dividend` WRITE;
/*!40000 ALTER TABLE `taxpayer_dividend` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_dividend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_donation`
--

DROP TABLE IF EXISTS `taxpayer_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_donation` (
  `id_donation` int(11) NOT NULL AUTO_INCREMENT,
  `foundation` varchar(100) NOT NULL COMMENT 'Nombre de la fundacion destino de la donacion',
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de la donacion',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_donation`),
  KEY `fk_taxpayer_donation_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_donation_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de una donacion a una fundacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_donation`
--

LOCK TABLES `taxpayer_donation` WRITE;
/*!40000 ALTER TABLE `taxpayer_donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_fee`
--

DROP TABLE IF EXISTS `taxpayer_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_fee` (
  `id_fee` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(100) NOT NULL COMMENT 'Nombre de la empresa',
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de los honorarios recibidos\n',
  `paid_taxes` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Impuestos pagados',
  `contributions_social_security` tinyint(1) NOT NULL COMMENT 'Boolean que define si se realizo aporte a seguridad social sobre tus ingresos de servicios u honorarios',
  `social_security_value` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Valor de los aportes realizados a seguridad social',
  `colciencias` tinyint(1) NOT NULL COMMENT 'Boolean que define si en este trabajo participó en un proyecto avaluado por Colciencias',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_fee`),
  KEY `fk_taxpayer_fee_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_fee_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de ingresos por concepto de honorarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_fee`
--

LOCK TABLES `taxpayer_fee` WRITE;
/*!40000 ALTER TABLE `taxpayer_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_incapacity_work`
--

DROP TABLE IF EXISTS `taxpayer_incapacity_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_incapacity_work` (
  `id_incapacity_work` int(11) NOT NULL AUTO_INCREMENT,
  `more_three_days` tinyint(1) NOT NULL COMMENT 'Boolean que define si la incapacidad tiene mas de 3 dias',
  `company` varchar(100) DEFAULT NULL COMMENT 'Nombre de la empresa',
  `incapacity_reason` varchar(100) DEFAULT NULL COMMENT 'Tipo de incapacidad: Enfermedad general, accidente de trabajo o licencia de maternidad',
  `value_certificate` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Valor reconocido por la EPS o ARL durante la incapacidad.\nPuede ser calculado con el salario y el numero de dias de la incapacidad',
  `calculated` tinyint(1) NOT NULL COMMENT 'Boolean que define si el valor de la incapacidad fue calculado o fue ingresado el monto entregado por la EPS o ARL',
  `salary` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Salario que ganaba al momento de la incapacidad',
  `days` int(10) unsigned DEFAULT NULL COMMENT 'Número de días de incapacidad',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_incapacity_work`),
  KEY `fk_taxpayer_incapacity_work_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_incapacity_work_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de ingresos por concepto de incapacidad laboral';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_incapacity_work`
--

LOCK TABLES `taxpayer_incapacity_work` WRITE;
/*!40000 ALTER TABLE `taxpayer_incapacity_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_incapacity_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_inheritance`
--

DROP TABLE IF EXISTS `taxpayer_inheritance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_inheritance` (
  `id_inheritance` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor recibido',
  `taxable_value` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Valor gravable',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_inheritance`),
  KEY `fk_taxpayer_inheritance_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_inheritance_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de ingresos por herencias, legados o donaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_inheritance`
--

LOCK TABLES `taxpayer_inheritance` WRITE;
/*!40000 ALTER TABLE `taxpayer_inheritance` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_inheritance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_interest_yield`
--

DROP TABLE IF EXISTS `taxpayer_interest_yield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_interest_yield` (
  `id_interest_yield` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `interests_taxable` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Intereses gravables de impuesto',
  `interests_non_taxable` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Intereses no gravables de impuesto',
  `total_earned_interests` decimal(14,2) unsigned NOT NULL COMMENT 'Total de intereses ganados, este es calculado por la suma de intereses gravables y no gravables',
  `withholding_tax` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Retenciones en la fuente',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_interest_yield`),
  KEY `fk_taxpayer_interest_yield_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_interest_yield_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de Intereses y rendimientos financieros';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_interest_yield`
--

LOCK TABLES `taxpayer_interest_yield` WRITE;
/*!40000 ALTER TABLE `taxpayer_interest_yield` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_interest_yield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_investment`
--

DROP TABLE IF EXISTS `taxpayer_investment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_investment` (
  `id_investment` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `purchase_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de compra',
  `purchase_year` int(4) unsigned NOT NULL COMMENT 'Año de compra',
  `fiscal_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor fiscal, es calculado',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_investment`),
  KEY `fk_taxpayer_investment_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_investment_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Informacion de ingresos por inversiones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_investment`
--

LOCK TABLES `taxpayer_investment` WRITE;
/*!40000 ALTER TABLE `taxpayer_investment` DISABLE KEYS */;
INSERT INTO `taxpayer_investment` VALUES (1,'petroleco',350000.00,2011,420000.00,1,1),(2,'Ecopetrol',5000000.00,2014,5500000.00,1,1),(3,'petroleco',600000.00,2011,720000.00,1,1),(4,'islas virgenes',142857.00,2006,215714.00,1,1),(5,'edificio calle 100',65200.00,2011,78240.00,1,1),(6,'petroleco',690000.00,2011,828000.00,1,1);
/*!40000 ALTER TABLE `taxpayer_investment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_liability`
--

DROP TABLE IF EXISTS `taxpayer_liability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_liability` (
  `id_liability` int(11) NOT NULL AUTO_INCREMENT,
  `liability_type` varchar(100) NOT NULL COMMENT 'Tipo de cuenta de ahorros: Credito hipotecario, credito vehicular, tarjeta de credito u otro tipo de credito',
  `interests_paid` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Intereses pagados',
  `balance` decimal(14,2) unsigned NOT NULL COMMENT 'Saldo a 31 de Diciembre',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `bank_name` varchar(100) DEFAULT NULL COMMENT 'Nombre del banco',
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `unit_currency` varchar(100) DEFAULT NULL COMMENT 'Tipo de moneda',
  `quantity` int(10) unsigned DEFAULT NULL COMMENT 'Cantidad',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_liability`),
  KEY `fk_taxpayer_liability_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_liability_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de deudas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_liability`
--

LOCK TABLES `taxpayer_liability` WRITE;
/*!40000 ALTER TABLE `taxpayer_liability` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_liability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_other_asset`
--

DROP TABLE IF EXISTS `taxpayer_other_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_other_asset` (
  `id_other_asset` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripcion',
  `purchase_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de compra',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_other_asset`),
  KEY `fk_taxpayer_intangible_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_intangible_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de bienes intangibles como patentes, franquicias o licencias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_other_asset`
--

LOCK TABLES `taxpayer_other_asset` WRITE;
/*!40000 ALTER TABLE `taxpayer_other_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_other_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_prepaid_medicine`
--

DROP TABLE IF EXISTS `taxpayer_prepaid_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_prepaid_medicine` (
  `id_prepaid_medicine` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripcion ',
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de los aportes realizados a una medicina prepagada',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_prepaid_medicine`),
  KEY `fk_taxpayer_prepaid_medicine_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_prepaid_medicine_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de los aportes a una medicina prepagada';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_prepaid_medicine`
--

LOCK TABLES `taxpayer_prepaid_medicine` WRITE;
/*!40000 ALTER TABLE `taxpayer_prepaid_medicine` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_prepaid_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_real_estate`
--

DROP TABLE IF EXISTS `taxpayer_real_estate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_real_estate` (
  `id_real_estate` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `sole_owner` tinyint(1) NOT NULL COMMENT 'Boolean que indica si el declarante es el único propietario',
  `owneship_percentage` decimal(4,2) unsigned DEFAULT NULL COMMENT 'Porcentaje de propiedad del declarante sobre la propiedad',
  `year_acquisition` int(4) unsigned NOT NULL COMMENT 'Año de adquisición',
  `purchase_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de compra',
  `rateable_value` decimal(14,2) unsigned NOT NULL COMMENT 'Avalúo catastral',
  `improvements` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Mejoras realizada a la propiedad',
  `fiscal_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor fiscal, es calculado',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_real_estate`),
  KEY `fk_taxpayer_real_estate_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_real_estate_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Información de una propiedad de bienes raices';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_real_estate`
--

LOCK TABLES `taxpayer_real_estate` WRITE;
/*!40000 ALTER TABLE `taxpayer_real_estate` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_real_estate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_rent`
--

DROP TABLE IF EXISTS `taxpayer_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_rent` (
  `id_rent` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción del arrendamiento ',
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor correspondiente a arrendamientos',
  `withholding_tax` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Retenciones en la fuente',
  `costs` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Total de gastos para dicha propiedad como: Predial, Limpieza manutencion, Administracion, Reparaciones Seguros Honorarios',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_rent`),
  KEY `fk_taxpayer_rent_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_rent_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de un arrendamiento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_rent`
--

LOCK TABLES `taxpayer_rent` WRITE;
/*!40000 ALTER TABLE `taxpayer_rent` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_retirement_pension`
--

DROP TABLE IF EXISTS `taxpayer_retirement_pension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_retirement_pension` (
  `id_retirement_pension` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor del ingreso por pension',
  `health_contribution` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Aportes a salud',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_retirement_pension`),
  KEY `fk_taxpayer_retirement_pension_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_retirement_pension_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de un ingreso por pension de jubilación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_retirement_pension`
--

LOCK TABLES `taxpayer_retirement_pension` WRITE;
/*!40000 ALTER TABLE `taxpayer_retirement_pension` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_retirement_pension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_reward`
--

DROP TABLE IF EXISTS `taxpayer_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_reward` (
  `id_reward` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor del premio',
  `withholding_tax` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Retenciones en la fuente',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_reward`),
  UNIQUE KEY `withholding_tax_UNIQUE` (`withholding_tax`),
  KEY `fk_taxpayer_reward_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_reward_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de ingresos por premios, loterías y rifas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_reward`
--

LOCK TABLES `taxpayer_reward` WRITE;
/*!40000 ALTER TABLE `taxpayer_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_salary`
--

DROP TABLE IF EXISTS `taxpayer_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_salary` (
  `id_salary` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(100) NOT NULL COMMENT 'Nombre de la empresa',
  `salary` decimal(14,2) unsigned NOT NULL COMMENT 'Salario',
  `dismissal_compensation` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Cesantias',
  `entertainment_allowance` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Gastos de representación',
  `retirement_pensions` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Pensiones de jubilación, vejez o invalidez',
  `other_employee_income` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Otros ingresos como empleado',
  `total_income` decimal(14,2) unsigned NOT NULL COMMENT 'Total ingresos brutos',
  `mandatory_contributions_health` decimal(14,2) unsigned NOT NULL COMMENT 'Aportes obligatorios a salud',
  `mandatory_contributions_pension_fund` decimal(14,2) unsigned NOT NULL COMMENT 'Aportes obligatorios a fondos de pensiones y solidaridad pensional',
  `contributions_pension_AFC` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Aportes voluntarios, a fondos de pensiones y cuentas AFC',
  `withholding_tax` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Valor de la retención en la fuente por salarios y demás pagos laborales',
  `national_army` tinyint(1) NOT NULL COMMENT 'Boolean que define si en este empleo fue oficial o suboficial del ejército o policía nacional',
  `united_nations` tinyint(1) NOT NULL COMMENT 'Boolean que define si en este empleo trabajo para las Naciones Unidas',
  `ministry_foreign_affairs` tinyint(1) NOT NULL COMMENT 'Boolean que define si en este empleo fue servidor público diplomático, consular y administrativo del Ministerio de Relaciones Exteriores',
  `colciencias` tinyint(1) NOT NULL COMMENT 'Boolean que define si en este empleo participo en proyectos científicos avalados por Colciencias',
  `judge_republic_official_university` tinyint(1) NOT NULL COMMENT 'Boolean que define si en este empleo fue magistrado o fiscal de tribunales, juez de la república o rector y profesor de universidades oficiales',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `paid_taxes` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'Impuestos pagados en el exterior',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_salary`),
  KEY `fk_taxpayer_salary_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_salary_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de salarios dentro del pais';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_salary`
--

LOCK TABLES `taxpayer_salary` WRITE;
/*!40000 ALTER TABLE `taxpayer_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_sale`
--

DROP TABLE IF EXISTS `taxpayer_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_sale` (
  `id_sale` int(11) NOT NULL AUTO_INCREMENT,
  `sale_type` varchar(100) NOT NULL COMMENT 'Tipo de venta realizada como : casa principal, otra propiedad de bienes raices, vehiculo u otro bien',
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripcion',
  `sole_owner` tinyint(1) NOT NULL COMMENT 'Boolean que indica si el declarante era el único propietario',
  `ownership_percentage` decimal(4,2) unsigned DEFAULT NULL COMMENT 'Porcentaje de propiedad del declarante sobre el bien vendido',
  `sale_date` date NOT NULL COMMENT 'Fecha de venta',
  `sale_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de la venta',
  `withholding_tax` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Retenciones en la fuente',
  `purchase_date` date NOT NULL COMMENT 'Fecha de la compra',
  `purchase_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de la compra',
  `improvements` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Mejoras realizadas al bien vendido',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `fk_taxpayer_sale_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_sale_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de una venta realizada por un declarante como:\nCasa, automovil, motocicleta, maquinaria, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_sale`
--

LOCK TABLES `taxpayer_sale` WRITE;
/*!40000 ALTER TABLE `taxpayer_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_sale_investment`
--

DROP TABLE IF EXISTS `taxpayer_sale_investment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_sale_investment` (
  `id_sale_investment` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `colombian_stock_exchange` tinyint(1) NOT NULL COMMENT 'Boolean que define si esta accion cotiza en la bolsa de valores de Colombia',
  `purchase_value` decimal(14,2) unsigned NOT NULL COMMENT 'Precio de compra',
  `purchase_date` date NOT NULL COMMENT 'Fecha de compra',
  `sale_value` decimal(14,2) unsigned NOT NULL COMMENT 'Precio de venta',
  `sale_date` date NOT NULL COMMENT 'Fecha de venta',
  `fiscal_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor fiscal, calculado',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_sale_investment`),
  KEY `fk_taxpayer_sale_investment_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_sale_investment_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Informacion de los ingresos recibidos por la venta de acciones o aportes en sociedades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_sale_investment`
--

LOCK TABLES `taxpayer_sale_investment` WRITE;
/*!40000 ALTER TABLE `taxpayer_sale_investment` DISABLE KEYS */;
INSERT INTO `taxpayer_sale_investment` VALUES (1,'conavi',0,464684.00,'1999-12-31',84864.00,'2000-01-01',69550.00,0,1,1),(2,'islas caiman',0,6000.00,'1992-03-31',25000.00,'1999-12-31',250000.00,0,1,1),(3,'sdsdsd',0,65465.00,'2015-04-04',600000.00,'2016-04-04',700000.00,0,1,1),(4,'fghfgh',0,62000.00,'2016-05-01',6000.00,'2017-07-05',35000.00,0,1,1);
/*!40000 ALTER TABLE `taxpayer_sale_investment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_separation_marital_property`
--

DROP TABLE IF EXISTS `taxpayer_separation_marital_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_separation_marital_property` (
  `id_separation_marital_property` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor recibido por la separacion de bienes',
  `foreign_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bandera para determinar el origen',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_separation_marital_property`),
  KEY `fk_taxpayer_separation_marital_property_taxpayer_taxpayer_u_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_separation_marital_property_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de una liquidación de sociedad conyugal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_separation_marital_property`
--

LOCK TABLES `taxpayer_separation_marital_property` WRITE;
/*!40000 ALTER TABLE `taxpayer_separation_marital_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_separation_marital_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_social_security_domestic_worker`
--

DROP TABLE IF EXISTS `taxpayer_social_security_domestic_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_social_security_domestic_worker` (
  `id_social_security_domestic_worker` int(11) NOT NULL AUTO_INCREMENT,
  `annual_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor pagado por seguridad social de una empleada doméstica',
  `calculated` tinyint(1) NOT NULL COMMENT 'Boolean que define si el monto anual es calculado mes a mes o se ingreso el valor total del año',
  `january` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Enero',
  `february` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Febrero',
  `march` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Marzo',
  `april` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Abril',
  `may` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Mayo',
  `june` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Junio',
  `july` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Julio',
  `august` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Agosto',
  `september` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Septiembre',
  `october` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Octubre',
  `november` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Noviembre',
  `december` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Corresponde al monto pagado por seguridad social en el mes de Diciembre',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_social_security_domestic_worker`),
  UNIQUE KEY `june_UNIQUE` (`june`),
  KEY `fk_taxpayer_social_security_domestic_worker_taxpayer_taxpay_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_social_security_domestic_worker_taxpayer_taxpayer1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de deducciones por concepto de seguridad social de empleada doméstica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_social_security_domestic_worker`
--

LOCK TABLES `taxpayer_social_security_domestic_worker` WRITE;
/*!40000 ALTER TABLE `taxpayer_social_security_domestic_worker` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_social_security_domestic_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_taxpayer`
--

DROP TABLE IF EXISTS `taxpayer_taxpayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_taxpayer` (
  `id_taxpayer` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(15) NOT NULL COMMENT 'ID o NIT entregado por el RUT',
  `first_name` varchar(100) NOT NULL COMMENT 'Nombres',
  `last_name` varchar(100) NOT NULL COMMENT 'Apellidos',
  `sectional_address_code` int(2) NOT NULL COMMENT 'Codigo de la direccion seccional, otorgado por el RUT',
  `economic_activity` int(4) NOT NULL COMMENT 'Codigo de la actividad economica',
  `dependent` tinyint(1) NOT NULL COMMENT 'Boolean que define si tiene dependientes',
  `times_taxpayer` int(2) NOT NULL COMMENT 'Cantidad de veces que ha sido declarante, incluyendo la actual',
  `last_gross_assets` decimal(14,2) NOT NULL COMMENT 'Activos brutos del periodo anterior',
  `last_liabilities` decimal(14,2) NOT NULL COMMENT 'Deudas del periodo anterior',
  `last_net_assets` decimal(14,2) NOT NULL COMMENT 'Activos netos del periodo anterior',
  `business` tinyint(1) NOT NULL COMMENT 'Boolean que define si tiene negocios',
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_taxpayer`),
  UNIQUE KEY `nit_UNIQUE` (`nit`),
  KEY `fk_taxpayer_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion del declarante';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_taxpayer`
--

LOCK TABLES `taxpayer_taxpayer` WRITE;
/*!40000 ALTER TABLE `taxpayer_taxpayer` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_taxpayer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_taxpayer_profile`
--

DROP TABLE IF EXISTS `taxpayer_taxpayer_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_taxpayer_profile` (
  `id_taxpayer_profile` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `assets_account_saving` tinyint(1) DEFAULT '0' COMMENT 'Cuentas de ahorro',
  `assets_real_state` tinyint(1) DEFAULT '0' COMMENT 'Bienes raíces',
  `assets_voluntary_pension_fund` tinyint(1) DEFAULT '0' COMMENT 'Fondo de pensiones voluntarias',
  `assets_vehicle` tinyint(1) DEFAULT '0' COMMENT 'Vehículos',
  `assets_investment` tinyint(1) DEFAULT '0' COMMENT 'Acciones',
  `assets_account_receivable` tinyint(1) DEFAULT '0' COMMENT 'Cuentas x cobrar',
  `assets_foreign_currency` tinyint(1) DEFAULT '0' COMMENT 'Bienes moneda extranjera',
  `income_local_salary` tinyint(1) DEFAULT '0' COMMENT 'Salario como empleado nacional',
  `income_retirement_pension` tinyint(1) DEFAULT '0' COMMENT 'Pensionado',
  `income_interest_yield` tinyint(1) DEFAULT '0' COMMENT 'Intereses',
  `income_dividend` tinyint(1) DEFAULT '0' COMMENT 'Dividendos',
  `income_rent` tinyint(1) DEFAULT '0' COMMENT 'Alquiler de propiedades',
  `income_businnes` tinyint(1) DEFAULT '0' COMMENT 'Negocios',
  `income_sale` tinyint(1) DEFAULT '0' COMMENT 'Venta de bienes - carro, casa',
  `income_sale_investment` tinyint(1) DEFAULT '0' COMMENT 'Venta de acciones',
  `income_fee` tinyint(1) DEFAULT '0' COMMENT 'Honorarios',
  `income_compensation` tinyint(1) DEFAULT '0' COMMENT 'Recibí seguros',
  `deductible_prepaid_medicine` tinyint(1) DEFAULT '0' COMMENT 'Pago medicina prepagada',
  `deductible_dependent` tinyint(1) DEFAULT '0' COMMENT 'Personas dependientes',
  `deductible_donation` tinyint(1) DEFAULT '0' COMMENT 'Donaciones a fundaciones',
  `deductible_social_security_domestic_worker` tinyint(1) DEFAULT '0' COMMENT 'Seguridad social empleada doméstica',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_taxpayer_profile`),
  UNIQUE KEY `id_taxpayer_user` (`id_taxpayer_user`),
  UNIQUE KEY `fk_id_taxpayer_user` (`fk_id_taxpayer_user`),
  KEY `fk_taxpayer_profile_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_profile_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Perfiles del contribuyente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_taxpayer_profile`
--

LOCK TABLES `taxpayer_taxpayer_profile` WRITE;
/*!40000 ALTER TABLE `taxpayer_taxpayer_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_taxpayer_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_taxpayer_user`
--

DROP TABLE IF EXISTS `taxpayer_taxpayer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_taxpayer_user` (
  `id_taxpayer_user` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL COMMENT 'Correo electronico',
  `password` varchar(100) NOT NULL COMMENT 'Contraseña',
  `enabled` tinyint(1) NOT NULL COMMENT 'Boolean que indica si el usuario se encuentra habilitado',
  `full_name` varchar(100) NOT NULL COMMENT 'Nombre completo del usuario',
  `last_id_digits` varchar(2) NOT NULL,
  PRIMARY KEY (`id_taxpayer_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Alamacena la informacion de un usuario de la aplicacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_taxpayer_user`
--

LOCK TABLES `taxpayer_taxpayer_user` WRITE;
/*!40000 ALTER TABLE `taxpayer_taxpayer_user` DISABLE KEYS */;
INSERT INTO `taxpayer_taxpayer_user` VALUES (1,'andres.sierra@beitech.co','12345',1,'Andrés Sierra','85');
/*!40000 ALTER TABLE `taxpayer_taxpayer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_vehicle`
--

DROP TABLE IF EXISTS `taxpayer_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_vehicle` (
  `id_vehicle` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripcion del vehiculo',
  `sole_owner` tinyint(1) NOT NULL COMMENT 'Boolean que indica si el declarante es el único propietario',
  `owneship_percentage` decimal(4,2) unsigned DEFAULT NULL COMMENT 'Porcentaje de propiedad del declarante sobre el vehiculo',
  `purchase_value` decimal(14,2) unsigned NOT NULL COMMENT 'Valor de compra',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_vehicle`),
  KEY `fk_taxpayer_vehicle_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_vehicle_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de un vehiculo propiedad de un declarante';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_vehicle`
--

LOCK TABLES `taxpayer_vehicle` WRITE;
/*!40000 ALTER TABLE `taxpayer_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_voluntary_pension_fund`
--

DROP TABLE IF EXISTS `taxpayer_voluntary_pension_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_voluntary_pension_fund` (
  `id_voluntary_pension_fund` int(11) NOT NULL AUTO_INCREMENT,
  `fund_name` varchar(100) DEFAULT NULL COMMENT 'Nombre del fondo de pensiones',
  `balance` decimal(14,2) unsigned NOT NULL COMMENT 'Saldo a 31 de Diciembre',
  `withdrawals` tinyint(1) NOT NULL COMMENT 'Boolean que indica si se han hecho retiros',
  `withdrawals_value` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Valor total de los retiros efectuados',
  `earned_interests` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Intereses ganados sobre los aportes a pensiones voluntarias',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_voluntary_pension_fund`),
  KEY `fk_taxpayer_voluntary_pension_fund_taxpayer_taxpayer_user1_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_voluntary_pension_fund_taxpayer_taxpayer_user1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de un fondo de pensiones voluntarias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_voluntary_pension_fund`
--

LOCK TABLES `taxpayer_voluntary_pension_fund` WRITE;
/*!40000 ALTER TABLE `taxpayer_voluntary_pension_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_voluntary_pension_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer_withdrawals_dismissal_compensation`
--

DROP TABLE IF EXISTS `taxpayer_withdrawals_dismissal_compensation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxpayer_withdrawals_dismissal_compensation` (
  `id_withdrawals_dismissal_compensation` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(100) NOT NULL COMMENT 'Nombre de la empresa',
  `withdrawals` tinyint(1) NOT NULL COMMENT 'Boolean que indica si se han hecho retiros',
  `value` decimal(14,2) unsigned DEFAULT NULL COMMENT 'Valor total de los retiros efectuados',
  `id_taxpayer_user` int(11) NOT NULL,
  `fk_id_taxpayer_user` int(11) NOT NULL,
  PRIMARY KEY (`id_withdrawals_dismissal_compensation`),
  KEY `fk_taxpayer_withdrawals_dismissal_compensation_taxpayer_tax_idx` (`fk_id_taxpayer_user`),
  CONSTRAINT `fk_taxpayer_withdrawals_dismissal_compensation_taxpayer_taxpa1` FOREIGN KEY (`fk_id_taxpayer_user`) REFERENCES `taxpayer_taxpayer_user` (`id_taxpayer_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de retiros de cesantias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer_withdrawals_dismissal_compensation`
--

LOCK TABLES `taxpayer_withdrawals_dismissal_compensation` WRITE;
/*!40000 ALTER TABLE `taxpayer_withdrawals_dismissal_compensation` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxpayer_withdrawals_dismissal_compensation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-14 18:07:24
