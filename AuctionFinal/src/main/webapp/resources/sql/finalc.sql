select *
from tbl_member;

delete from tbl_member
where userid = 'leess';


select userid, passwd, email, username, email, hp1
     , hp2, hp3, addr1, addr2, user_status, gender, birth, grade
from
(
select *
from tbl_member A join TBL_MEMBER_DETAIL B
on A.userid = B.fk_userid
)V
where user_status = 1;

<<<<<<< HEAD
select *
from tbl_member_detail;

insert into tbl_member(userid, passwd, user_status)
values('dkenlzkf1', 'qwer1234$', default);

insert into tbl_member_detail(usernum, fk_userid, username, birth, gender, email, zipcode, addr1, addr2, grade, hp1, hp2, hp3)
values(seq_member_detail.nextval, (select userid from tbl_member where userid = 'dkenlzkf1'), '사람', '1919-03-01', '남', 'admin@naver.com', '12345', '이런들 어떠하리', '저런들 어떠하리', '8', '010', '1245', '2356');

ROLLBACK;

commit;
=======
select count(*)
from tbl_member_detail
where fk_userid = 'admin';


select cnum, cname
from tbl_category;

select cdnum, fk_cnum, cdname
from tbl_category_detail;

select *
from tbl_hugiboard;

select *
from tbl_category A left join tbl_category_detail B on A.cnum = B.fk_cnum;

select ep_boardno, fk_userid, fk_actdnum, ep_content, ep_writeday, ep_satisfaction, ep_boardstatus
from tbl_hugiboard
where fk_actdnum = 1;

insert into tbl_hugiboard(ep_boardno, fk_userid, fk_actdnum, ep_content, ep_writeday, ep_satisfaction, ep_boardstatus)
values(seq_hugiboard.nextval, 'rlarbwjs', 2, '가성비 괜찮은 듯 그닥 나쁘진 않은듯 싶음'
      ,default, 1, default);

commit;

update tbl_hugiboard set ep_satisfaction = 1
where ep_boardno = 5;

commit;

alter table tbl_hugiboard  modify (ep_writeday default sysdate);

insert into tbl_category_detail(cdnum, fk_cnum, cdname)
values(seq_category_detail.nextval, 1, '여성의류');

commit;
>>>>>>> branch 'master' of https://github.com/dkenlzkf2018/FinalAuction.git
