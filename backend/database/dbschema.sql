START TRANSACTION;

create table project
    (p_name varchar(50) not null unique,
    p_description varchar(200) not null,
    p_status int not null,
    constraint pk_project primary key(p_name));

/*create table on_going_p
    (p_name varchar(50) not null unique,
    constraint pk_on_going_p primary key(p_name),
    constraint fk_on_going_p_project foreign key(p_name) references project(p_name));

create table done_p
    (p_name varchar(50) not null unique,
    constraint pk_done_p primary key(p_name),
    constraint fk_done_p_project foreign key(p_name) references project(p_name));
*/
create table member_
    (m_id varchar(10) not null unique,
    m_pass varchar(50) not null,
    m_name varchar(50) not null,
    m_email varchar(50) not null,
    m_tlm varchar(25) not null,
    m_degree varchar(50) not null,
    m_year int not null,
    constraint pk_member primary key(member_id));

create table project_members
    (p_name varchar(50) not null,
    member_id varchar(10) not null,
    constraint pk_project_members primary key(p_name, member_id),
    constraint fk_project_members_project foreign key(p_name) references project(p_name),
    constraint fk_project_members_member foreign key(member_id) references member_(member_id));

create table member_skill
    (member_id varchar(10) not null,
    skill varchar(20) not null,
    constraint pk_skill primary key(member_id, skill),
    constraint fk_skill_member foreign key(member_id) references member_(member_id));

create table announcement
    (a_id int not null unique,
    a_title varchar(50) not null,
    a_description varchar(500) not null,
    a_reg_date date not null,
    a_del_date date not null,
    constraint pk_announcement primary key(a_id));

COMMIT;
