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

select *
from tbl_member_detail;

insert into tbl_member(userid, passwd, user_status)
values('dkenlzkf1', 'qwer1234$', default);

insert into tbl_member_detail(usernum, fk_userid, username, birth, gender, email, zipcode, addr1, addr2, grade, hp1, hp2, hp3)
values(seq_member_detail.nextval, (select userid from tbl_member where userid = 'dkenlzkf1'), '사람', '1919-03-01', '남', 'admin@naver.com', '12345', '이런들 어떠하리', '저런들 어떠하리', '8', '010', '1245', '2356');

ROLLBACK;

commit;
