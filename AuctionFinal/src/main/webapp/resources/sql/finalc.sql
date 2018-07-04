select *
from tbl_member;

select userid, passwd, email, username, email, hp1
     , hp2, hp3, addr1, addr2, user_status, gender, birth, grade
from
(
select *
from tbl_member A join TBL_MEMBER_DETAIL B
on A.userid = B.fk_userid
)V
where user_status = 1;

select count(*)
from tbl_member_detail
where fk_userid = 'admion'