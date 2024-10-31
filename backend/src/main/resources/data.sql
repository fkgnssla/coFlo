-- code_quality
INSERT INTO code_quality_code (id, name) VALUES (1,'가독성'), (2, '일관성'), (3, '재사용성'), (4, '신뢰성'), (5, '보안성'), (6, '유지보수성');

-- badge
INSERT INTO badge_code (id, name, description, image_url) VALUES
(1, '첫 모험가', '처음 서비스 가입 시 기본 획득', 'https://example.com/images/badge1.png'),
(2, '리뷰 탐색자', '첫 AI리뷰 재생성', 'https://example.com/images/badge2.png'),
(3, '프로젝트 개척자', '연동한 프로젝트 개수 n개 이상 시 획득', 'https://example.com/images/badge3.png'),
(4, '헌신의 발자국', '커밋 개수 n개 이상 시 획득', 'https://example.com/images/badge4.png'),
(5, '코드 마스터', 'AI 리뷰평가 리워드 합이 n점 이상 시 획득', 'https://example.com/images/badge5.png'),
(6, '행운의 발견', '접속 시 3% 확률로 랜덤 획득', 'https://example.com/images/badge6.png'),
(7, '단골 손님', '서비스 로그인 n회 이상 (1일 1회)', 'https://example.com/images/badge7.png'),
(8, '성장의 발자취', '직접 작성한 리뷰가 n개 이상 시 획득', 'https://example.com/images/badge8.png'),
(9, '도전의 기록', 'MR 개수가 n개 이상 시 획득', 'https://example.com/images/badge9.png'),
(10, '인정받는 리뷰어', '내가 쓴 리뷰 좋아요가 n개 이상 시 획득', 'https://example.com/images/badge10.png'),
(11, '마스터 리뷰어', '베스트 MR에 n회 이상 선정 시 획득', 'https://example.com/images/badge11.png'),
(12, '프롬프트 창조자', '커스텀 프롬포트 등록/수정 n회 이상', 'https://example.com/images/badge12.png'),
(13, '전설의 모험가', '12개의 핑을 모두 획득하면 획득', 'https://example.com/images/badge13.png');

-- channel_code
INSERT INTO channel_code (id, name) VALUES (1, 'MATTERMOST'), (2, 'DISCORD');

-- language_code
INSERT INTO language_code (id, name, color) VALUES
(1, 'Mercury', '#abcdef'),
(2, 'TypeScript', '#31859c'),
(3, 'PureBasic', '#5a6986'),
(4, 'Objective-C++', '#4886FC'),
(5, 'Self', '#0579aa'),
(6, 'edn', '#db5855'),
(7, 'NewLisp', '#eedd66'),
(8, 'Rebol', '#358a5b'),
(9, 'Frege', '#00cafe'),
(10, 'Dart', '#98BAD6'),
(11, 'AspectJ', '#1957b0'),
(12, 'Shell', '#89e051'),
(13, 'Web Ontology Language', '#3994bc'),
(14, 'xBase', '#3a4040'),
(15, 'Eiffel', '#946d57'),
(16, 'Nix', '#7070ff'),
(17, 'SuperCollider', '#46390b'),
(18, 'MTML', '#0095d9'),
(19, 'Racket', '#ae17ff'),
(20, 'Elixir', '#6e4a7e'),
(21, 'SAS', '#1E90FF'),
(22, 'Agda', '#467C91'),
(23, 'D', '#fcd46d'),
(24, 'Opal', '#f7ede0'),
(25, 'Standard ML', '#dc566d'),
(26, 'Objective-C', '#438eff'),
(27, 'ColdFusion CFC', '#ed2cd6'),
(28, 'Oz', '#fcaf3e'),
(29, 'Mirah', '#c7a938'),
(30, 'Objective-J', '#ff0c5a'),
(31, 'Gosu', '#82937f'),
(32, 'Ruby', '#701516'),
(33, 'Component Pascal', '#b0ce4e'),
(34, 'Arc', '#ca2afe'),
(35, 'SystemVerilog', '#343761'),
(36, 'APL', '#8a0707'),
(37, 'Go', '#375eab'),
(38, 'Visual Basic', '#945db7'),
(39, 'PHP', '#4F5D95'),
(40, 'Cirru', '#aaaaff'),
(41, 'SQF', '#FFCB1F'),
(42, 'Glyph', '#e4cc98'),
(43, 'Java', '#b07219'),
(44, 'Scala', '#7dd3b0'),
(45, 'ColdFusion', '#ed2cd6'),
(46, 'Perl', '#0298c3'),
(47, 'Elm', '#60B5CC'),
(48, 'Lua', '#fa1fa1'),
(49, 'Verilog', '#848bf3'),
(50, 'Factor', '#636746'),
(51, 'Haxe', '#f7941e'),
(52, 'Pure Data', '#91de79'),
(53, 'Forth', '#341708'),
(54, 'Red', '#ee0000'),
(55, 'Hy', '#7891b1'),
(56, 'Volt', '#0098db'),
(57, 'LSL', '#3d9970'),
(58, 'CoffeeScript', '#244776'),
(59, 'HTML', '#e44b23'),
(60, 'UnrealScript', '#a54c4d'),
(61, 'Swift', '#ffac45'),
(62, 'C', '#555'),
(63, 'AutoHotkey', '#6594b9'),
(64, 'Isabelle', '#fdcd00'),
(65, 'Boo', '#d4bec1'),
(66, 'AutoIt', '#36699B'),
(67, 'Clojure', '#db5855'),
(68, 'Rust', '#dea584'),
(69, 'Prolog', '#74283c'),
(70, 'SourcePawn', '#f69e1d'),
(71, 'ANTLR', '#9DC3FF'),
(72, 'Harbour', '#0e60e3'),
(73, 'Tcl', '#e4cc98'),
(74, 'BlitzMax', '#cd6400'),
(75, 'PigLatin', '#fcd7de'),
(76, 'Lasso', '#2584c3'),
(77, 'ECL', '#8a1267'),
(78, 'VHDL', '#543978'),
(79, 'Arduino', '#bd79d1'),
(80, 'Propeller Spin', '#2b446d'),
(81, 'IDL', '#e3592c'),
(82, 'ATS', '#1ac620'),
(83, 'Ada', '#02f88c'),
(84, 'Nu', '#c9df40'),
(85, 'LFE', '#004200'),
(86, 'RAML', '#77d9fb'),
(87, 'Oxygene', '#5a63a3'),
(88, 'ASP', '#6a40fd'),
(89, 'Assembly', '#6E4C13'),
(90, 'Gnuplot', '#f0a9f0'),
(91, 'Turing', '#45f715'),
(92, 'Vala', '#ee7d06'),
(93, 'Processing', '#2779ab'),
(94, 'FLUX', '#33CCFF'),
(95, 'NetLogo', '#ff2b2b'),
(96, 'C Sharp', '#178600'),
(97, 'CSS', '#563d7c'),
(98, 'LiveScript', '#499886'),
(99, 'QML', '#44a51c'),
(100, 'Pike', '#066ab2'),
(101, 'LOLCODE', '#cc9900'),
(102, 'ooc', '#b0b77e'),
(103, 'Mask', '#f97732'),
(104, 'EmberScript', '#f64e3e'),
(105, 'TeX', '#3D6117'),
(106, 'Nemerle', '#0d3c6e'),
(107, 'KRL', '#f5c800'),
(108, 'Unified Parallel C', '#755223'),
(109, 'Golo', '#f6a51f'),
(110, 'Perl6', '#0298c3'),
(111, 'Fancy', '#7b9db4'),
(112, 'OCaml', '#3be133'),
(113, 'wisp', '#7582D1'),
(114, 'Pascal', '#b0ce4e'),
(115, 'F#', '#b845fc'),
(116, 'Puppet', '#cc5555'),
(117, 'ActionScript', '#e3491a'),
(118, 'Ragel in Ruby Host', '#ff9c2e'),
(119, 'Fantom', '#dbded5'),
(120, 'Zephir', '#118f9e'),
(121, 'Smalltalk', '#596706'),
(122, 'DM', '#075ff1'),
(123, 'Ioke', '#078193'),
(124, 'PogoScript', '#d80074'),
(125, 'Emacs Lisp', '#c065db'),
(126, 'JavaScript', '#f1e05a'),
(127, 'VimL', '#199c4b'),
(128, 'Matlab', '#bb92ac'),
(129, 'Slash', '#007eff'),
(130, 'R', '#198ce7'),
(131, 'Erlang', '#0faf8d'),
(132, 'Pan', '#cc0000'),
(133, 'LookML', '#652B81'),
(134, 'Eagle', '#3994bc'),
(135, 'Scheme', '#1e4aec'),
(136, 'PAWN', '#dbb284'),
(137, 'Python', '#3581ba'),
(138, 'Max', '#ce279c'),
(139, 'Common Lisp', '#3fb68b'),
(140, 'Latte', '#A8FF97'),
(141, 'XQuery', '#2700e2'),
(142, 'Omgrofl', '#cabbff'),
(143, 'Nimrod', '#37775b'),
(144, 'Nit', '#0d8921'),
(145, 'Chapel', '#8dc63f'),
(146, 'Groovy', '#e69f56'),
(147, 'Dylan', '#3ebc27'),
(148, 'E', '#ccce35'),
(149, 'Parrot', '#f3ca0a'),
(150, 'Grammatical Framework', '#ff0000'),
(151, 'Game Maker Language', '#8ad353'),
(152, 'VCL', '#0298c3'),
(153, 'Papyrus', '#6600cc'),
(154, 'FORTRAN', '#4d41b1'),
(155, 'Clean', '#3a81ad'),
(156, 'Alloy', '#cc5c24'),
(157, 'AGS Script', '#B9D9FF'),
(158, 'Slim', '#ff8877'),
(159, 'PureScript', '#bcdc53'),
(160, 'Julia', '#a270ba'),
(161, 'Haskell', '#29b544'),
(162, 'Io', '#a9188d'),
(163, 'Rouge', '#cc0088'),
(164, 'cpp', '#f34b7d'),
(165, 'Shen', '#120F14'),
(166, 'Dogescript', '#cca760'),
(167, 'nesC', '#ffce3b'),
(168, 'Other', '#ededed');

-- //============================================================================// --

-- user
INSERT INTO "user" (username, profile_image_url, oauth2id, provider, role, created_date, modified_date)
VALUES ('지민', 'image1.url', '1230', 'KAKAO', 'USER', '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       ('보연', 'image2.url', '1231', 'KAKAO', 'USER', '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       ('선기', 'image3.url', '1232', 'KAKAO', 'USER', '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       ('형민', 'image4.url', '1233', 'KAKAO', 'USER', '2024-10-16 09:00:00', '2024-10-16 09:00:00');

-- user_badge
INSERT INTO user_badge (user_id, badge_code_id, created_date, modified_date)
VALUES (1, 1, '2024-10-30 09:00:00', '2024-10-30 09:00:00'),
       (1, 2, '2024-10-30 09:00:00', '2024-10-30 09:00:00'),
       (2, 3, '2024-10-30 09:00:00', '2024-10-30 09:00:00'),
       (3, 4, '2024-10-30 09:00:00', '2024-10-30 09:00:00');

-- gitlab_account
INSERT INTO gitlab_account (user_id, domain, user_token, created_date, modified_date)
VALUES (1, 'lab.ssafy.com', 'dklfjaskldjfklwejfklasdldfjkas', '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (2, 'lab.ssafy.com', 'asdffklwejfklasdjklfjasldasdfa', '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (3, 'lab.ssafy.com', 'qasdfjaskldjklfjasldqweiorfqo', '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (4, 'lab.ssafy.com', 'hmmrielfjaskldjaslwi8uqoeidjdaj', '2024-10-16 09:00:00', '2024-10-16 09:00:00');

-- project
INSERT INTO project (bot_token, gitlab_project_id, name, created_date, modified_date)
VALUES ('mcnsiagfoehcvldsfj', 825246, 'S11P31A210', '2024-10-16 09:00:00', '2024-10-16 09:00:00');

-- user_project
INSERT INTO user_project (gitlab_account_id, project_id, created_date, modified_date)
VALUES (1, 1, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (2, 1, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (3, 1, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (4, 1, '2024-10-16 09:00:00', '2024-10-16 09:00:00');

-- 지민의 1주차, 2주차, 3주차 user_project_score
INSERT INTO user_project_score (user_project_id, code_quality_code_id, week, total_score, created_date, modified_date)
VALUES (1, 1, 1, 8, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (1, 2, 1, 7, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (1, 3, 1, 9, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (1, 4, 1, 6, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (1, 5, 1, 10, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (1, 6, 1, 8, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),

       (1, 1, 2, 7, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (1, 2, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (1, 3, 2, 6, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (1, 4, 2, 9, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (1, 5, 2, 7, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (1, 6, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),

       (1, 1, 3, 9, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (1, 2, 3, 10, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (1, 3, 3, 8, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (1, 4, 3, 7, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (1, 5, 3, 9, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (1, 6, 3, 8, '2024-10-28 09:00:00', '2024-10-30 09:00:00');

-- 보연의 1주차, 2주차, 3주차 user_project_score
INSERT INTO user_project_score (user_project_id, code_quality_code_id, week, total_score, created_date, modified_date)
VALUES (2, 1, 1, 8, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (2, 2, 1, 7, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (2, 3, 1, 9, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (2, 4, 1, 6, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (2, 5, 1, 10, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (2, 6, 1, 8, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),

       (2, 1, 2, 7, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (2, 2, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (2, 3, 2, 6, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (2, 4, 2, 9, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (2, 5, 2, 7, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (2, 6, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),

       (2, 1, 3, 9, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (2, 2, 3, 10, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (2, 3, 3, 8, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (2, 4, 3, 7, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (2, 5, 3, 9, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (2, 6, 3, 8, '2024-10-28 09:00:00', '2024-10-30 09:00:00');

-- 선기의 1주차, 2주차, 3주차 user_project_score
INSERT INTO user_project_score (user_project_id, code_quality_code_id, week, total_score, created_date, modified_date)
VALUES (3, 1, 1, 7, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (3, 2, 1, 6, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (3, 3, 1, 8, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (3, 4, 1, 7, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (3, 5, 1, 9, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (3, 6, 1, 7, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),

       (3, 1, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (3, 2, 2, 7, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (3, 3, 2, 6, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (3, 4, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (3, 5, 2, 7, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (3, 6, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),

       (3, 1, 3, 9, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (3, 2, 3, 8, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (3, 3, 3, 10, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (3, 4, 3, 9, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (3, 5, 3, 8, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (3, 6, 3, 7, '2024-10-28 09:00:00', '2024-10-30 09:00:00');

-- 형민의 1주차, 2주차, 3주차 user_project_score
INSERT INTO user_project_score (user_project_id, code_quality_code_id, week, total_score, created_date, modified_date)
VALUES (4, 1, 1, 6, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (4, 2, 1, 7, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (4, 3, 1, 8, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (4, 4, 1, 6, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (4, 5, 1, 9, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),
       (4, 6, 1, 7, '2024-10-16 09:00:00', '2024-10-16 09:00:00'),

       (4, 1, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (4, 2, 2, 9, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (4, 3, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (4, 4, 2, 7, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (4, 5, 2, 9, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),
       (4, 6, 2, 8, '2024-10-21 09:00:00', '2024-10-25 09:00:00'),

       (4, 1, 3, 7, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (4, 2, 3, 8, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (4, 3, 3, 9, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (4, 4, 3, 8, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (4, 5, 3, 7, '2024-10-28 09:00:00', '2024-10-30 09:00:00'),
       (4, 6, 3, 9, '2024-10-28 09:00:00', '2024-10-30 09:00:00');
