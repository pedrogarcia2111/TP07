USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 29/8/2024 15:59:06 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadOrt', N'ON'
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 29/8/2024 15:59:06 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 29/8/2024 15:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Foto] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 29/8/2024 15:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 29/8/2024 15:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] NOT NULL,
	[IdCategoria] [int] NULL,
	[IdDificultad] [int] NULL,
	[Enunciado] [varchar](500) NOT NULL,
	[Foto] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 29/8/2024 15:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] NOT NULL,
	[IdPregunta] [int] NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](500) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Deportes', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Historia', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Entretenimiento', NULL)
GO
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Fácil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Intermedio')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Difícil')
GO
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿En qué país se celebró la Copa Mundial de Fútbol de 2018?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿Qué jugador argentino es conocido como "La Pulga"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'¿Cuál es el nombre del estadio del Real Madrid?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, N'¿Qué selección ha ganado más Copas Mundiales de Fútbol?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿En qué club comenzó su carrera profesional Cristiano Ronaldo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 1, 1, N'¿Quién ganó el Balón de Oro en 2021?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 1, 1, N'¿Cuál es el nombre del torneo de fútbol más importante de selecciones en Europa?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 1, 1, N'¿Qué país ganó la Eurocopa 2016?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 1, 1, N'¿En qué equipo jugó Pelé la mayor parte de su carrera?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 1, 1, N'¿Quién ganó la Copa América 2019?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 1, 2, N'¿Cuál es el equipo de fútbol más exitoso en la historia de la Champions League?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 1, 2, N'¿Quién fue el máximo goleador del Mundial 2014?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 1, 2, N'¿Qué selección ganó la primera Copa Mundial de la FIFA?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 1, 2, N'¿Cuál es el nombre del máximo goleador de la historia de la Premier League?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 1, 2, N'¿Qué selección sudamericana ganó la Copa América en 2021?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 1, 2, N'¿Qué equipo ha ganado la mayor cantidad de títulos de la Serie A en Italia?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 1, 2, N'¿Qué país es conocido por su "fútbol samba"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 1, 2, N'¿Qué entrenador ha ganado más títulos en la historia de la Champions League?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 1, 2, N'¿Qué jugador brasileño ganó tres Copas Mundiales?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 1, 2, N'¿Quién es el máximo goleador histórico de la selección argentina?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 1, 3, N'¿Qué equipo italiano ganó la Serie A por primera vez en 1969?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 1, 3, N'¿Qué entrenador ha ganado la mayor cantidad de títulos en la historia del fútbol?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (23, 1, 3, N'¿Qué equipo ganó la primera edición de la Copa Libertadores?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (24, 1, 3, N'¿Qué país organizó el Mundial de Fútbol en 1958?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (25, 1, 3, N'¿Quién fue el primer jugador en ganar cinco Balones de Oro?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (26, 1, 3, N'¿Qué equipo inglés ganó el triplete en 1999?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (27, 1, 3, N'¿Qué selección europea ganó el Mundial de 1982?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (28, 1, 3, N'¿Quién es el máximo goleador de la historia del FC Barcelona?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (29, 1, 3, N'¿Qué selección ganó el Mundial de 1998?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (30, 1, 3, N'¿Qué equipo español ganó la Supercopa de la UEFA en 2020?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (31, 2, 1, N'¿Quién protagoniza la saga de películas de acción "Misión Imposible"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (32, 2, 1, N'¿Qué superhéroe es conocido como el "Hombre de Acero"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (33, 2, 1, N'¿Cuál es el nombre del parque temático de Disney en California?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (34, 2, 1, N'¿En qué ciudad está ambientada la serie de televisión "Friends"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (35, 2, 1, N'¿Quién es el cantante de la famosa canción "Shape of You"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (36, 2, 1, N'¿Qué película ganó el Oscar a la Mejor Película en 2020?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (37, 2, 1, N'¿Cuál es el nombre del villano principal en la película "El Rey León"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (38, 2, 1, N'¿En qué año se estrenó la primera película de "Harry Potter"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (39, 2, 1, N'¿Qué banda británica lanzó el álbum "Abbey Road"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (40, 2, 1, N'¿Qué actor interpretó a "Joker" en la película de 2019?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (41, 2, 2, N'¿Qué serie de televisión es conocida por su frase "Winter is Coming"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (42, 2, 2, N'¿Qué actriz ganó el Oscar a la Mejor Actriz en 2021?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (43, 2, 2, N'¿Cuál es el nombre del director de la película "Inception"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (44, 2, 2, N'¿En qué país nació el grupo musical "ABBA"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (45, 2, 2, N'¿Qué película animada ganó el Oscar en 2013?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (46, 2, 2, N'¿Cuál es el nombre real de la cantante conocida como Lady Gaga?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (47, 2, 2, N'¿Qué película fue el mayor éxito de taquilla en la historia del cine hasta 2020?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (48, 2, 2, N'¿Cuál es el nombre del protagonista en la película "El Padrino"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (49, 2, 2, N'¿En qué serie aparece el personaje "Walter White"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (50, 2, 2, N'¿Qué grupo musical es conocido por la canción "Bohemian Rhapsody"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (51, 2, 3, N'¿Qué película dirigida por David Fincher cuenta la historia de Mark Zuckerberg?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (52, 2, 3, N'¿Quién ganó el Oscar a la Mejor Dirección en 2020?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (53, 2, 3, N'¿Cuál es el nombre del villano en la película "No Country for Old Men"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (54, 2, 3, N'¿Qué actriz interpretó a Elizabeth I en la película "Elizabeth: La edad de oro"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (55, 2, 3, N'¿Qué película musical protagonizó Hugh Jackman en 2017?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (56, 2, 3, N'¿Qué director ha ganado más premios Oscar en la historia del cine?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (57, 2, 3, N'¿En qué año se estrenó la película "Citizen Kane"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (58, 2, 3, N'¿Cuál es el nombre de la película más famosa de Alfred Hitchcock?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (59, 2, 3, N'¿Qué actor interpretó a Hannibal Lecter en "El silencio de los inocentes"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (60, 2, 3, N'¿Quién dirigió la película "El Resplandor"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (61, 3, 1, N'¿En qué año se descubrió América?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (62, 3, 1, N'¿Quién fue el primer presidente de los Estados Unidos?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (63, 3, 1, N'¿En qué país tuvo lugar la Revolución Francesa?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (64, 3, 1, N'¿Quién fue el líder del Partido Nazi durante la Segunda Guerra Mundial?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (65, 3, 1, N'¿Qué país lanzó las primeras bombas atómicas en 1945?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (66, 3, 1, N'¿Cuál es el nombre del muro que dividió Berlín durante la Guerra Fría?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (67, 3, 1, N'¿En qué siglo tuvo lugar la Revolución Industrial?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (68, 3, 1, N'¿Qué país fue el principal rival de Estados Unidos durante la Guerra Fría?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (69, 3, 1, N'¿Qué evento desencadenó la Primera Guerra Mundial?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (70, 3, 1, N'¿En qué ciudad se encuentran las pirámides de Egipto?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (71, 3, 2, N'¿En qué año cayó el Muro de Berlín?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (72, 3, 2, N'¿Qué emperador romano fue conocido como el primer emperador cristiano?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (73, 3, 2, N'¿Qué líder revolucionario fue conocido como "El Libertador de América"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (74, 3, 2, N'¿Quién fue el primer hombre en pisar la luna?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (75, 3, 2, N'¿Qué conflicto bélico ocurrió entre 1939 y 1945?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (76, 3, 2, N'¿Qué país colonizó la India durante el siglo XIX?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (77, 3, 2, N'¿En qué país nació Napoleón Bonaparte?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (78, 3, 2, N'¿Qué evento histórico tuvo lugar el 6 de junio de 1944?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (79, 3, 2, N'¿Quién fue el autor del "Manifiesto Comunista"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (80, 3, 2, N'¿Qué país construyó la Gran Muralla China?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (81, 3, 3, N'¿Quién fue el primer emperador del Imperio Romano?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (82, 3, 3, N'¿En qué batalla fue derrotado Napoleón Bonaparte en 1815?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (83, 3, 3, N'¿Qué tratado puso fin a la Primera Guerra Mundial?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (84, 3, 3, N'¿Qué civilización antigua construyó Machu Picchu?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (85, 3, 3, N'¿Quién fue el primer faraón de Egipto?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (86, 3, 3, N'¿Qué país lideró la "Armada Invencible" en 1588?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (87, 3, 3, N'¿Qué monarca inglés rompió con la Iglesia Católica para fundar la Iglesia Anglicana?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (88, 3, 3, N'¿Qué cultura precolombina construyó Chichen Itzá?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (89, 3, 3, N'¿Qué imperio gobernó gran parte de Europa durante el siglo XIX?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (90, 3, 3, N'¿En qué año comenzó la Revolución Rusa?', NULL)
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'Brasil', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 2, 3, N'Lionel Messi', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 3, 3, N'Santiago Bernabéu', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 4, 3, N'Brasil', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 5, 2, N'Sporting de Lisboa', 1, NULL)
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
USE [master]
GO
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO
