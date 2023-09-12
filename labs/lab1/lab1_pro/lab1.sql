set foreign_key_checks = 0;
delete
from borrow;
delete
from book;
delete
from reserve;
delete
from reader;
set foreign_key_checks = 1;

# 插入书籍
insert into Book(ID, name, author, price, status, borrow_Times) value ('b1', '数据库系统实现', 'Ullman', 59.0, 0, 4);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b2', '数据库系统概念', 'Abraham', 59.0, 1, 3);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b3', 'C++ Primer', 'Stanley', 78.6, 0, 5);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b4', 'Redis设计与实现', '黄建宏', 79.0, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b5', 'Creature', 'John', 114514.00, 0, 4);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b6', '史记(公版)', '司马迁', 220.2, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b7', 'Oracle编程艺术', 'Thomas', 43.1, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b8', '分布式系统及其应用', '邵佩英', 30.0, 0, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b9', 'Oracle管理', '张立杰', 51.9, 1, 5);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b10', '数理逻辑', '汪芳庭', 22.0, 0, 1);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b11', '三体', '刘慈欣', 23.0, 0, 5);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b12', 'Fun python', 'Luciano', 354.2, 1, 3);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b13', 'Learn SQL', 'Seyed', 23.0, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b14', 'Perl&MySQL', '徐泽平', 23.0, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b15', 'Shadows', 'John', 1919.0, 0, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b16', '品鉴迎宾酒', '我修院', 810.0, 1, 3);
insert into Book(ID, name, author, price, status, borrow_Times) value ('b17', '昏睡红茶', '田所浩二', 114.0, 1, 2);

# 插入读者
insert into Reader value ('r1', '李林', 18, '中国科学技术大学东校区');
insert into Reader value ('r2', 'Rose', 22, '中国科学技术大学北校区');
insert into Reader value ('r3', '罗永平', 23, '中国科学技术大学西校区');
insert into Reader value ('r4', 'Nora', 26, '中国科学技术大学北校区');
insert into Reader value ('r5', '汤晨', 22, '先进科学技术研究院');
insert into Reader value ('r6', '李小一', 18, '中国科学技术大学东校区');
insert into Reader value ('r7', '王二', 22, '中国科学技术大学北校区');
insert into Reader value ('r8', '赵三', 23, '中国科学技术大学西校区');
insert into Reader value ('r9', '魏四', 26, '中国科学技术大学北校区');
insert into Reader value ('r10', '汤大晨', 22, '先进科学技术研究院');
insert into Reader value ('r11', '李平', 18, '中国科学技术大学东校区');
insert into Reader value ('r12', 'Lee', 22, '中国科学技术大学北校区');
insert into Reader value ('r13', 'Jack', 23, '中国科学技术大学西校区');
insert into Reader value ('r14', 'Bob', 26, '中国科学技术大学北校区');
insert into Reader value ('r15', '李晓', 22, '先进科学技术研究院');
insert into Reader value ('r16', '王林', 18, '中国科学技术大学东校区');
insert into Reader value ('r17', 'Mike', 22, '中国科学技术大学北校区');
insert into Reader value ('r18', '范维', 23, '中国科学技术大学西校区');
insert into Reader value ('r19', 'David', 26, '中国科学技术大学北校区');
insert into Reader value ('r20', 'Vipin', 22, '先进科学技术研究院');
insert into Reader value ('r21', '林立', 18, '中国科学技术大学东校区');
insert into Reader value ('r22', '张悟', 22, '中国科学技术大学北校区');
insert into Reader value ('r23', '袁平', 23, '中国科学技术大学西校区');
insert into Reader value ('r24', '李田所', 24, '中国科学技术大学北校区');

# 插入借书
insert into Borrow value ('b5', 'r1', '2022-03-12', '2022-04-07');
insert into Borrow value ('b6', 'r1', '2022-03-08', '2022-03-19');
insert into Borrow value ('b11', 'r1', '2022-01-12', '2022-05-19');

insert into Borrow value ('b16', 'r2', '2022-02-22', '2022-03-10');
insert into Borrow value ('b17', 'r2', '2022-02-22', '2022-03-10');
insert into Borrow value ('b3', 'r2', '2022-02-22', '2022-03-10');
insert into Borrow value ('b9', 'r2', '2022-02-22', '2022-04-10');
insert into Borrow value ('b7', 'r2', '2022-04-11', NULL);

insert into Borrow value ('b1', 'r3', '2022-04-02', '2022-07-19');
insert into Borrow value ('b2', 'r3', '2022-04-02', '2022-07-19');
insert into Borrow value ('b4', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value ('b7', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value ('b8', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value ('b9', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value ('b10', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value ('b12', 'r3', '2023-04-02', '2023-04-09');
insert into Borrow value ('b11', 'r3', '2023-04-02', '2023-04-09');
insert into Borrow value ('b15', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value ('b16', 'r3', '2022-04-02', '2022-04-09');

insert into Borrow value ('b6', 'r4', '2022-03-31', NULL);
insert into Borrow value ('b12', 'r4', '2022-03-31', '2022-07-19');

insert into Borrow value ('b4', 'r5', '2022-04-10', NULL);
insert into Borrow value ('b11', 'r5', '2022-08-12', '2022-09-19');

insert into Borrow value ('b3', 'r6', '2022-04-10', '2023-01-01');

insert into Borrow value ('b1', 'r7', '2022-08-10', '2022-12-19');

insert into Borrow value ('b1', 'r8', '2023-01-10', '2023-02-19');
insert into Borrow value ('b5', 'r8', '2022-07-12', '2022-10-07');

insert into Borrow value ('b1', 'r9', '2023-03-10', '2023-03-19');
insert into Borrow value ('b2', 'r9', '2023-03-10', '2023-03-19');

insert into Borrow value ('b2', 'r10', '2023-03-20', NULL);
insert into Borrow value ('b5', 'r10', '2022-05-12', '2022-06-07');
insert into Borrow value ('b11', 'r10', '2022-10-12', '2022-11-19');
insert into Borrow value ('b15', 'r10', '2022-12-11', '2022-12-20');

insert into Borrow value ('b3', 'r12', '2022-04-10', '2022-08-19');

insert into Borrow value ('b3', 'r13', '2022-09-10', '2022-12-19');

insert into Borrow value ('b3', 'r14', '2023-01-10', NULL);

insert into Borrow value ('b9', 'r15', '2022-04-19', '2022-08-19');

insert into Borrow value ('b9', 'r16', '2022-10-10', '2022-12-19');

insert into Borrow value ('b9', 'r17', '2023-01-10', NULL);
insert into Borrow value ('b11', 'r17', '2022-12-12', '2023-01-19');

insert into Borrow value ('b12', 'r18', '2022-10-10', '2022-12-19');
insert into Borrow value ('b13', 'r18', '2022-10-10', '2022-12-19');

insert into Borrow value ('b13', 'r19', '2023-01-10', NULL);
insert into Borrow value ('b5', 'r19', '2023-01-12', '2023-03-07');


insert into Borrow value ('b8', 'r20', '2023-01-10', '2023-02-19');

insert into Borrow value ('b14', 'r22', '2022-10-10', '2022-12-19');

insert into Borrow value ('b14', 'r23', '2023-01-10', NULL);
insert into Borrow value ('b16', 'r23', '2023-01-14', NULL);
insert into Borrow value ('b17', 'r23', '2022-05-14', NULL);


#1.
select book_ID, book.name, borrow_Date
from book,
     reader R,
     borrow
where R.ID = borrow.reader_ID
  and borrow.book_ID = book.ID
  and R.name = 'rose';
#2.
select reader.ID, reader.name
from reader
where ID not IN ((select borrow.reader_ID from borrow) union (select reader_ID from reserve));
#3.
select author
from book
group by author
order by sum(borrow_Times) desc
limit 1;
#4.
select book.ID, book.name
from book
where status = 1
  and name like '%MySQL%';
#5.
select reader.name
from reader,
     borrow
where reader.ID = borrow.reader_ID
group by reader.name
having count(*) > 10;
#6.
select reader.ID, reader.name
from reader
where not exists (select book.ID
                  from book,
                       borrow
                  where ID = borrow.book_ID
                    and reader_ID = reader.ID
                    and author = 'John');
#7.
select reader_ID, reader.name, COUNT(book_ID) as num
from borrow,
     reader
where reader_ID = reader.ID
  and borrow_Date like '2022%'
group by reader_ID
order by count(book_ID) desc
limit 10;
/*#8.
# create view borrow_view(reader_ID, reader_name, book_ID, book_name, borrow_Date) as
# select reader_ID, reader.name, book.ID, book.name, borrow_Date
# from book,
#      borrow,
#      reader
# where book_ID = book.ID
#   and reader_ID = reader.ID;*/
select reader_ID, count(*) as nums
from borrow_view
where borrow_Date > date_sub(curdate(), interval 1 year)
group by reader_ID;

# 三
delimiter //
drop procedure if exists updateReaderID;
create procedure updateReaderID(in OldId char(8), in NewId char(8), out state int)
begin
    declare continue handler for not found set state = 1;
    set state = 0;
    set foreign_key_checks = 0;
    update reader set ID=NewId where ID = OldId;
    update borrow set reader_ID=NewId where reader_ID = OldId;
    set foreign_key_checks = 1;
end;
//
# 四
delimiter //
drop procedure if exists borrowBook;
create procedure borrowBook(in BookID char(8), in ReadID char(8), in BorrowDate date, in ReturnDate date, out state int)
begin
    declare sameBookNum,ifReserved,noBorrowedNum,reservedBook int default 0;
    set state = 0;
    select count(*)
    from borrow
    where reader_ID = ReadID and book_ID = BookID and borrow_Date = BorrowDate
    into sameBookNum;
    select count(*)
    from reserve
    where reserve.book_ID = BookID
      and reserve.reader_ID <> ReadID
    INTO ifReserved;
    select count(*) from borrow where reader_ID = ReadID and return_Date is null group by reader_ID into noBorrowedNum;
    select count(*) from reserve where reader_ID = ReadID and book_ID = BookID into reservedBook;
    if sameBookNum <> 0 then
        set state = 1;
    elseif ifReserved > 0 then
        set state = 2;
    elseif noBorrowedNum >= 3 then
        set state = 3;
    elseif reservedBook <> 0 then
        set state = 4;
        insert into borrow value (BookID, ReadID, BorrowDate, ReturnDate);
        update book set borrow_Times=borrow_Times + 1, reserve_Times=reserve_Times - 1, status=1 where book.ID = BookID;
        delete from reserve where reserve.reader_ID = ReadID and reserve.book_ID = BookID;
    end if;
end;
//
# 五
delimiter //
drop procedure if exists returnBook;
create procedure returnBook(in readerID char(8), in bookID char(8), in borrowDate date, in returnDate date,
                            out state int)
begin
    declare sum int default 0;
    set state = 0;
    select count(*) from borrow where book_ID = bookID and reader_ID = readerID and borrow_Date = borrowDate into sum;
    if sum <> 0 then
        update book set status=0 where status = 1 and book.ID = bookID;
        update borrow set return_Date=returnDate where bookID = book_ID and readerID = reader_ID;
    else
        set state = 1;
    end if;
end;
//


select *
from reader;
# 先取消触发器的影响
drop trigger if exists update_reserve;
drop trigger if exists insert_borrow;
drop trigger if exists after_reserve;


# 3-5测试
call updateReaderID('r4', 'r100', @state);
select *
from reader
where ID = 'r100';
call updateReaderID('r100', 'r4', @state);

select *
from borrow;
call borrowBook('b11', 'r10', '2022-10-12', '2022-11-19', @state);# 同一天统一读者重复借阅同一本书
select @state;

insert into reserve value ('b1', 'r2', '2022-04-12', '2022-07-19');
select *
from reserve;
call borrowBook('b1', 'r8', '2022-04-02', '2022-07-19', @state);# 图书被预约，当前读者没预约
select @state;
delete
from reserve
where reader_ID = 'r2';

insert into reserve
values ('b11', 'r23', '2023-04-22', null);
call borrowBook('b11', 'r23', '2022-04-12', '2022-07-19', @state);
select *
from borrow;
select @state;#一个读者最多预约3本，且未归还
delete
from reserve
where book_ID = 'b11';


insert into reserve value ('b3', 'r10', '2022-02-19', '2022-04-02');#读者已预约,可借阅
call borrowBook('b3', 'r10', '2022-04-02', '2022-07-19', @state);
select @state;
select *
from borrow
where reader_ID = 'r10'
  and book_ID = 'b3';
delete
from borrow
where reader_ID = 'r10'
  and book_ID = 'b3';
delete
from reserve
where reader_ID = 'r10'
  and book_ID = 'b3';

# 5.
select * from borrow
where book_ID='b16'
and reader_ID='r23';
call returnBOOK('r23', 'b16', '2023-01-14', '2023-02-07', @state);
select @state;
update borrow
set return_Date = null
where reader_ID = 'r23'
  and book_ID = 'b16';

select *
from borrow
where reader_ID = 'r10'
  and book_ID = 'b2';
call returnBOOK('r10', 'b2', '2023-01-01', '2023-02-01', @state);
select @state;
# # 六
# delimiter
//
# drop trigger if exists update_reserve;
# create trigger update_reserve after insert on reserve for each row
# begin
# declare bookID char(8);
# update book set status =2,book.reserve_Times=book.reserve_Times+1 where book.ID=new.book_ID;
# end;
#
# drop trigger if exists after_reserve;
# create trigger after_reserve after delete on reserve for each row
# begin
# declare s int default 0;
# select count(*) from borrow
#                        where book_ID=old.book_ID and borrow.reader_ID=old.reader_ID
#                         into s;#读者借出书
# if s =0 then
#     update book set status =0,book.reserve_Times=book.reserve_Times-1 where book.ID=old.book_ID;
# else
#     update book set status =1,reserve_Times=reserve_Times-1 where book_ID=old.book_ID;
# end if;
# end;
# delimiter ;
# 六
delimiter //
drop trigger if exists update_reserve;
create trigger update_reserve
    after insert
    on reserve
    for each row
begin
    update book set status =2, book.reserve_Times=book.reserve_Times + 1 where book.ID = new.book_ID;
end;

# 被借出的
drop trigger if exists insert_borrow;
create trigger insert_borrow
    after insert
    on borrow
    for each row
begin
    update book set status =1, book.reserve_Times=book.reserve_Times - 1 where book.ID = new.book_ID;
    delete from reserve where reserve.book_ID = new.book_ID and reserve.reader_ID = new.reader_ID;
end;

# 取消预约的
drop trigger if exists after_reserve;
create trigger after_reserve
    after delete
    on reserve
    for each row
begin
    declare s int default 0;
    select count(*)
    from borrow
    where book_ID = old.book_ID
      and borrow.reader_ID = old.reader_ID
    into s;#书被借出时
    if s = 0 then #s=0即是被取消预约的
        update book set status =0, book.reserve_Times=book.reserve_Times - 1 where book.ID = old.book_ID;
    end if;
end;
//


#6
insert into reserve value ('b11', 'r1', '2023-04-20', null);
insert into reserve value ('b1', 'r1', '2023-04-20', '2023-05-10');
insert into reserve value ('b10', 'r2', '2023-04-10', '2023-05-10');
insert into reserve value ('b11', 'r20', '2023-04-11', '2023-05-11');
#取消预订
select *
from reserve;
select *
from book;
select *
from borrow;
delete
from reserve
where book_ID = 'b1';
delete
from reserve
where book_ID = 'b10';
#书被借出

insert into borrow value ('b11', 'r20', '2023-04-23', '2023-05-25');
