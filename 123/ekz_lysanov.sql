USE [master]
GO
/****** Object:  Database [ekz_lysanov]    Script Date: 23.04.2022 5:06:46 ******/
CREATE DATABASE [ekz_lysanov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ekz_lysanov', FILENAME = N'C:\Users\123\ekz_lysanov.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ekz_lysanov_log', FILENAME = N'C:\Users\123\ekz_lysanov_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ekz_lysanov] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ekz_lysanov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ekz_lysanov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ekz_lysanov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ekz_lysanov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ekz_lysanov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ekz_lysanov] SET ARITHABORT OFF 
GO
ALTER DATABASE [ekz_lysanov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ekz_lysanov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ekz_lysanov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ekz_lysanov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ekz_lysanov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ekz_lysanov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ekz_lysanov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ekz_lysanov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ekz_lysanov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ekz_lysanov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ekz_lysanov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ekz_lysanov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ekz_lysanov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ekz_lysanov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ekz_lysanov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ekz_lysanov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ekz_lysanov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ekz_lysanov] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ekz_lysanov] SET  MULTI_USER 
GO
ALTER DATABASE [ekz_lysanov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ekz_lysanov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ekz_lysanov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ekz_lysanov] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ekz_lysanov] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ekz_lysanov] SET QUERY_STORE = OFF
GO
USE [ekz_lysanov]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ekz_lysanov]
GO
/****** Object:  Table [dbo].[ACTIVITIES]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVITIES](
	[act_id] [int] IDENTITY(1,1) NOT NULL,
	[act_date] [date] NULL,
	[sved_id] [int] NULL,
	[dol_id] [int] NULL,
	[act_code] [int] NULL,
	[prich_id] [int] NULL,
	[osn_id] [int] NULL,
	[act_from] [date] NULL,
	[act_to] [date] NULL,
	[act_cancel] [nchar](10) NULL,
 CONSTRAINT [PK_ACTIVITIES] PRIMARY KEY CLUSTERED 
(
	[act_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOLJNOSTI]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOLJNOSTI](
	[dol_id] [int] IDENTITY(1,1) NOT NULL,
	[dol_name] [nchar](50) NULL,
	[podraz_id] [int] NULL,
 CONSTRAINT [PK_DOLJNOST] PRIMARY KEY CLUSTERED 
(
	[dol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIST]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIST](
	[list_id] [int] IDENTITY(1,1) NOT NULL,
	[act_id] [int] NULL,
	[std_id] [int] NULL,
 CONSTRAINT [PK_LIST] PRIMARY KEY CLUSTERED 
(
	[list_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OSNOVANIYA]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OSNOVANIYA](
	[osn_id] [int] IDENTITY(1,1) NOT NULL,
	[osn_name] [nchar](20) NULL,
	[osn_date] [date] NULL,
	[osn_num] [int] NULL,
 CONSTRAINT [PK_OSNOVANIYA] PRIMARY KEY CLUSTERED 
(
	[osn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PODRAZDELENIYA]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PODRAZDELENIYA](
	[podraz_id] [int] IDENTITY(1,1) NOT NULL,
	[podraz_name] [nchar](20) NULL,
 CONSTRAINT [PK_PODRAZDELENIYA] PRIMARY KEY CLUSTERED 
(
	[podraz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRICHINI_YVOLNENIYA]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRICHINI_YVOLNENIYA](
	[prich_id] [int] IDENTITY(1,1) NOT NULL,
	[prich_type] [nchar](30) NULL,
	[prich_document] [nchar](20) NULL,
	[prich_state] [int] NULL,
	[prich_part] [int] NULL,
	[prich_point] [int] NULL,
	[prich_subpoint] [int] NULL,
	[prich_abzac] [int] NULL,
 CONSTRAINT [PK_OSNOVANIYA_YVOLNENIYA] PRIMARY KEY CLUSTERED 
(
	[prich_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RABOTNIKI]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RABOTNIKI](
	[rab_id] [int] IDENTITY(1,1) NOT NULL,
	[rab_fio] [nchar](50) NULL,
	[rab_bdate] [date] NULL,
	[rab_snils] [nchar](15) NULL,
 CONSTRAINT [PK_RABOTNIKI] PRIMARY KEY CLUSTERED 
(
	[rab_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RABOTODATELI]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RABOTODATELI](
	[dat_id] [int] IDENTITY(1,1) NOT NULL,
	[dat_reg_num] [nchar](15) NULL,
	[dat_name] [nchar](30) NULL,
	[dat_inn] [nchar](10) NULL,
	[dat_kpp] [nchar](9) NULL,
 CONSTRAINT [PK_RABOTODATELI] PRIMARY KEY CLUSTERED 
(
	[dat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STD-R]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STD-R](
	[std_id] [int] IDENTITY(1,1) NOT NULL,
	[rab_id] [int] NULL,
	[dat_id] [int] NULL,
	[std_date] [date] NULL,
	[std_ryk] [nchar](50) NULL,
 CONSTRAINT [PK_STD-R] PRIMARY KEY CLUSTERED 
(
	[std_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SVEDENIYA]    Script Date: 23.04.2022 5:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SVEDENIYA](
	[sved_id] [int] IDENTITY(1,1) NOT NULL,
	[sved_name] [nchar](10) NULL,
 CONSTRAINT [PK_SVEDENIYA] PRIMARY KEY CLUSTERED 
(
	[sved_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACTIVITIES]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVITIES_DOLJNOSTI] FOREIGN KEY([dol_id])
REFERENCES [dbo].[DOLJNOSTI] ([dol_id])
GO
ALTER TABLE [dbo].[ACTIVITIES] CHECK CONSTRAINT [FK_ACTIVITIES_DOLJNOSTI]
GO
ALTER TABLE [dbo].[ACTIVITIES]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVITIES_OSNOVANIYA] FOREIGN KEY([osn_id])
REFERENCES [dbo].[OSNOVANIYA] ([osn_id])
GO
ALTER TABLE [dbo].[ACTIVITIES] CHECK CONSTRAINT [FK_ACTIVITIES_OSNOVANIYA]
GO
ALTER TABLE [dbo].[ACTIVITIES]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVITIES_PRICHINI_YVOLNENIYA] FOREIGN KEY([prich_id])
REFERENCES [dbo].[PRICHINI_YVOLNENIYA] ([prich_id])
GO
ALTER TABLE [dbo].[ACTIVITIES] CHECK CONSTRAINT [FK_ACTIVITIES_PRICHINI_YVOLNENIYA]
GO
ALTER TABLE [dbo].[ACTIVITIES]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVITIES_SVEDENIYA] FOREIGN KEY([sved_id])
REFERENCES [dbo].[SVEDENIYA] ([sved_id])
GO
ALTER TABLE [dbo].[ACTIVITIES] CHECK CONSTRAINT [FK_ACTIVITIES_SVEDENIYA]
GO
ALTER TABLE [dbo].[DOLJNOSTI]  WITH CHECK ADD  CONSTRAINT [FK_DOLJNOSTI_PODRAZDELENIYA] FOREIGN KEY([podraz_id])
REFERENCES [dbo].[PODRAZDELENIYA] ([podraz_id])
GO
ALTER TABLE [dbo].[DOLJNOSTI] CHECK CONSTRAINT [FK_DOLJNOSTI_PODRAZDELENIYA]
GO
ALTER TABLE [dbo].[LIST]  WITH CHECK ADD  CONSTRAINT [FK_LIST_ACTIVITIES] FOREIGN KEY([act_id])
REFERENCES [dbo].[ACTIVITIES] ([act_id])
GO
ALTER TABLE [dbo].[LIST] CHECK CONSTRAINT [FK_LIST_ACTIVITIES]
GO
ALTER TABLE [dbo].[LIST]  WITH CHECK ADD  CONSTRAINT [FK_LIST_STD-R] FOREIGN KEY([std_id])
REFERENCES [dbo].[STD-R] ([std_id])
GO
ALTER TABLE [dbo].[LIST] CHECK CONSTRAINT [FK_LIST_STD-R]
GO
ALTER TABLE [dbo].[STD-R]  WITH CHECK ADD  CONSTRAINT [FK_STD-R_RABOTNIKI] FOREIGN KEY([rab_id])
REFERENCES [dbo].[RABOTNIKI] ([rab_id])
GO
ALTER TABLE [dbo].[STD-R] CHECK CONSTRAINT [FK_STD-R_RABOTNIKI]
GO
ALTER TABLE [dbo].[STD-R]  WITH CHECK ADD  CONSTRAINT [FK_STD-R_RABOTODATELI] FOREIGN KEY([dat_id])
REFERENCES [dbo].[RABOTODATELI] ([dat_id])
GO
ALTER TABLE [dbo].[STD-R] CHECK CONSTRAINT [FK_STD-R_RABOTODATELI]
GO
USE [master]
GO
ALTER DATABASE [ekz_lysanov] SET  READ_WRITE 
GO
