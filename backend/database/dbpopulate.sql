

insert into member_ values('96268', 'pass', 'Manuel Gomes', 'manuel.luiz.gomes@tecnico.ulisboa.pt', '+351915163675', 'MEEC', 2);
insert into member_ values('92512', 'pass', 'Mafalda Serafim', 'mafalda.dmserafim@gmail.com', '+351939079700', 'LEIC-A', 3);
insert into member_ values('93152', 'pass', 'Pedro Taborda', 'pedrotaborda04@tecnico.ulisboa.pt', '925896230', 'MEEC', 3);
insert into member_ values('99211', 'pass', 'Diogo Correia', 'diogo.t.correia@tecnico.ulisboa.pt', '917560028', 'LEIC-A', 1);
insert into member_ values('96125', 'pass', 'Margarida Oliveira', 'maggy.oliveira23@gmail.com', '912128143', 'MEM', 2);
insert into member_ values('99952', 'pass', 'Henrique Pocinho', 'hapocinho@gmail.com', '912821447', 'MEEC', 1);
insert into member_ values('92459', 'pass', 'Filipe Varela', 'filipe.andre.varela@gmail.com', '915241625', 'MEMec', 3);
insert into member_ values('95778', 'pass', 'Diogo Matos', 'ogoidmatos@gmail.com', '+351911585053', 'MEAer', 2);
insert into member_ values('89460', 'pass', 'Hugo (Vice) Marques', 'hugofmarques@tecnico.ulisboa.pt', '938729311', 'MEIC', 4);
insert into member_ values('96475', 'pass', 'Renato Sebastião', 'renatosebastiao5@gmail.com', '+351968230829', 'MEMec', 2);
insert into member_ values('95593', 'pass', 'Inês Magessi', 'ines.magessi@tecnico.ulisboa.pt', '927332017', '?', 2);
insert into member_ values('96328', 'pass', 'Tiago Almeida', 'tiagoalmeida5@tecnico.ulisboa.pt', '918757363', 'Meec', 2);
insert into member_ values('93155', 'pass', 'Pedro Ventura', 'pedro.m.c.ventura@tecnico.ulisboa.pt', '910710449', 'MEEC' ,3);
insert into member_ values('96134', 'pass', 'Afonso Certo', 'certafonso@gmail.com', '939605952', 'MEEC',2);
insert into member_ values('96210', 'pass', 'Francisco Rodrigues', 'francisco.rodrigues.09@tecnico.ulisboa.pt', '918869225', 'MEEC', 2);

insert into project values('HS Table', '?');
insert into project values('HS Robot Beta', '?');
insert into project values('HS Smart Irrigation System', '?');
insert into project values('HS Watch', '?');
insert into project values('HS App', 'Application');
insert into project values('HS Inventory', '?');
insert into project values('Betterflow App', '?');

insert into project_members values('HS App', '96268');
insert into project_members values('HS App', '92512');
insert into project_members values('HS App', '93155');


SELECT *
FROM member_;

SELECT *
FROM member_
WHERE member_.member_id = '92512';

SELECT *
FROM project_members;

SELECT *
FROM project;

SELECT *
FROM on_going_p;

SELECT *
FROM done_p;

SELECT *
FROM member_skill;

SELECT *
FROM announcement;

SELECT project.p_name, project.p_description, member_.member_name 
FROM member_ INNER JOIN project_members ON member_.member_id = project_members.member_id 
INNER JOIN project ON project_members.p_name = project.p_name 
WHERE project.p_name = 'HS App';

SELECT member_name
FROM member_ INNER JOIN member_skill ON member_.member_id = member_skill.member_id
WHERE member_skill.skill = 'x';

SELECT skill
FROM member_ INNER JOIN member_skill ON member_.member_id = member_skill.member_id
WHERE member_skill.member_id = '92512';