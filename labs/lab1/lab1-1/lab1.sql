
# 插入书籍
insert into Book(ID, name, author, price, status, borrow_Times) value('b1', '数据库系统实现', 'Ullman', 59.0, 0, 4);
insert into Book(ID, name, author, price, status, borrow_Times) value('b2', '数据库系统概念', 'Abraham', 59.0, 1, 3);
insert into Book(ID, name, author, price, status, borrow_Times) value('b3', 'C++ Primer', 'Stanley', 78.6, 0, 5);
insert into Book(ID, name, author, price, status, borrow_Times) value('b4', 'Redis设计与实现', '黄建宏', 79.0, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value('b5', 'Creature', 'John', 114514.00, 0, 4);
insert into Book(ID, name, author, price, status, borrow_Times) value('b6', '史记(公版)', '司马迁', 220.2, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value('b7', 'Oracle编程艺术', 'Thomas', 43.1, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value('b8', '分布式系统及其应用', '邵佩英', 30.0, 0, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value('b9', 'Oracle管理', '张立杰', 51.9, 1, 5);
insert into Book(ID, name, author, price, status, borrow_Times) value('b10', '数理逻辑', '汪芳庭', 22.0, 0, 1);
insert into Book(ID, name, author, price, status, borrow_Times) value('b11', '三体', '刘慈欣', 23.0, 0, 5);
insert into Book(ID, name, author, price, status, borrow_Times) value('b12', 'Fun python', 'Luciano', 354.2, 1, 3);
insert into Book(ID, name, author, price, status, borrow_Times) value('b13', 'Learn SQL', 'Seyed', 23.0, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value('b14', 'Perl&MySQL', '徐泽平', 23.0, 1, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value('b15', 'Shadows', 'John', 1919.0, 0, 2);
insert into Book(ID, name, author, price, status, borrow_Times) value('b16', '品鉴迎宾酒', '我修院', 810.0, 1, 3);
insert into Book(ID, name, author, price, status, borrow_Times) value('b17', '昏睡红茶', '田所浩二', 114.0, 1, 2);

# 插入读者
insert into Reader value('r1', '李林', 18, '中国科学技术大学东校区');
insert into Reader value('r2', 'Rose', 22, '中国科学技术大学北校区');
insert into Reader value('r3', '罗永平', 23, '中国科学技术大学西校区');
insert into Reader value('r4', 'Nora', 26, '中国科学技术大学北校区');
insert into Reader value('r5', '汤晨', 22, '先进科学技术研究院');
insert into Reader value('r6', '李小一', 18, '中国科学技术大学东校区');
insert into Reader value('r7', '王二', 22, '中国科学技术大学北校区');
insert into Reader value('r8', '赵三', 23, '中国科学技术大学西校区');
insert into Reader value('r9', '魏四', 26, '中国科学技术大学北校区');
insert into Reader value('r10', '汤大晨', 22, '先进科学技术研究院');
insert into Reader value('r11', '李平', 18, '中国科学技术大学东校区');
insert into Reader value('r12', 'Lee', 22, '中国科学技术大学北校区');
insert into Reader value('r13', 'Jack', 23, '中国科学技术大学西校区');
insert into Reader value('r14', 'Bob', 26, '中国科学技术大学北校区');
insert into Reader value('r15', '李晓', 22, '先进科学技术研究院');
insert into Reader value('r16', '王林', 18, '中国科学技术大学东校区');
insert into Reader value('r17', 'Mike', 22, '中国科学技术大学北校区');
insert into Reader value('r18', '范维', 23, '中国科学技术大学西校区');
insert into Reader value('r19', 'David', 26, '中国科学技术大学北校区');
insert into Reader value('r20', 'Vipin', 22, '先进科学技术研究院');
insert into Reader value('r21', '林立', 18, '中国科学技术大学东校区');
insert into Reader value('r22', '张悟', 22, '中国科学技术大学北校区');
insert into Reader value('r23', '袁平', 23, '中国科学技术大学西校区');
insert into Reader value('r24', '李田所', 24, '中国科学技术大学北校区');

# 插入借书
insert into Borrow value('b5','r1',  '2022-03-12', '2022-04-07');
insert into Borrow value('b6','r1',  '2022-03-08', '2022-03-19');
insert into Borrow value('b11','r1',  '2022-01-12', '2022-05-19');

insert into Borrow value('b16', 'r2', '2022-02-22', '2022-03-10');
insert into Borrow value('b17', 'r2', '2022-02-22', '2022-03-10');
insert into Borrow value('b3', 'r2', '2022-02-22', '2022-03-10');
insert into Borrow value('b9', 'r2', '2022-02-22', '2022-04-10');
insert into Borrow value('b7', 'r2', '2022-04-11', NULL);

insert into Borrow value('b1', 'r3', '2022-04-02', '2022-07-19');
insert into Borrow value('b2', 'r3', '2022-04-02', '2022-07-19');
insert into Borrow value('b4', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value('b7', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value('b8', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value('b9', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value('b10', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value('b12', 'r3', '2023-04-02', '2023-04-09');
insert into Borrow value('b11', 'r3', '2023-04-02', '2023-04-09');
insert into Borrow value('b15', 'r3', '2022-04-02', '2022-04-09');
insert into Borrow value('b16', 'r3', '2022-04-02', '2022-04-09');

insert into Borrow value('b6', 'r4', '2022-03-31', NULL);
insert into Borrow value('b12', 'r4', '2022-03-31', '2022-07-19');

insert into Borrow value('b4', 'r5', '2022-04-10', NULL);
insert into Borrow value('b11','r5',  '2022-08-12', '2022-09-19');

insert into Borrow value('b3', 'r6', '2022-04-10', '2023-01-01');

insert into Borrow value('b1', 'r7', '2022-08-10', '2022-12-19');

insert into Borrow value('b1', 'r8', '2023-01-10', '2023-02-19');
insert into Borrow value('b5','r8',  '2022-07-12', '2022-10-07');

insert into Borrow value('b1', 'r9', '2023-03-10', '2023-03-19');
insert into Borrow value('b2', 'r9', '2023-03-10', '2022-03-19');

insert into Borrow value('b2', 'r10', '2023-03-20', NULL);
insert into Borrow value('b5','r10',  '2022-05-12', '2022-06-07');
insert into Borrow value('b11','r10',  '2022-10-12', '2022-11-19');
insert into Borrow value('b15','r10',  '2022-12-11', '2022-12-20');

insert into Borrow value('b3', 'r12', '2022-04-10', '2022-08-19');

insert into Borrow value('b3', 'r13', '2022-09-10', '2022-12-19');

insert into Borrow value('b3', 'r14', '2023-01-10', NULL);

insert into Borrow value('b9', 'r15', '2022-04-19', '2022-08-19');

insert into Borrow value('b9', 'r16', '2022-10-10', '2022-12-19');

insert into Borrow value('b9', 'r17', '2023-01-10', NULL);
insert into Borrow value('b11','r17',  '2022-12-12', '2023-01-19');

insert into Borrow value('b12', 'r18', '2022-10-10', '2022-12-19');
insert into Borrow value('b13', 'r18', '2022-10-10', '2022-12-19');

insert into Borrow value('b13', 'r19', '2023-01-10', NULL);
insert into Borrow value('b5','r19',  '2023-01-12', '2023-03-07');


insert into Borrow value('b8', 'r20', '2023-01-10', '2023-02-19');

insert into Borrow value('b14', 'r22', '2022-10-10', '2022-12-19');

insert into Borrow value('b14', 'r23', '2023-01-10', NULL);
insert into Borrow value('b16', 'r23', '2023-01-14', NULL);
insert into Borrow value('b17', 'r23', '2022-05-14', NULL);