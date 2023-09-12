# 银行管理系统 实验报告

> 刘阳 PB20111677 ： 后端部分
>
> 张展翔 PB20111669 ： 前端部分

## 需求分析

- 每个客户拥有一个或多个账户。
- 客户可以通过账户进行查询、存款、借款三种业务。
- 银行内有多个员工，存款、借款业务必须经由员工执行。
- 对客户开放的页面仅提供查询服务。
- 对员工提供的页面提供查询、借款、存款业务。

## 概要设计

- 客户实体拥有客户ID、姓名、出生日期。
- 账户实体拥有账户ID、账户头像、拥有者ID、存款数。
- 员工实体拥有员工号。
- 交易实体拥有交易类型（借款、存款），交易对象（账户），交易金额，操作员（员工）。
- 银行实体拥有多个员工。

ER图如下：

<img src="./er.png" alt="er" style="zoom:100%;" />

## 数据库设计

依据上面的ER图，初步得到的数据库设计如下：

```bash
Customer(Name, BirthDay, TelNum);
Account(ID, CustomerName, BankID, HeadShot, Password, balance);
Bank(ID);
Staff(ID, BankID, Name, TelNum Password);
Tranction(ID, AccountID, StaffID, Type, Amount);
```

对于每一个关系模式，Customer的主属性为Name，其余关系模式主属性均为 ID ，且其他属性都直接依赖于 ID ，自然满足3NF。BankID、AccountID、StaffID、CustomerName属性均具有对应Table的外键约束，其余约束由于前端的报错更具有针对性，故在前端写入时进行约束。

其中，对于头像文件（图片）的存储，我们的设计是前段接收到图片后转存到服务器的一个文件夹中，数据库的HeadShot条目以字符串形式存储该图片的地址，需要查看时再依据地址查看图片即可。

上述Table的定义写在 `db.sql` 中，当需要初始化数据库时逐语句运行此文件，同时第一次使用数据库也需要运行此文件。该文件中定义了2个存储过程，一个是用户注册，需要对两个Table进行读写；另一个是用户名字的修改，涉及到外键约束。

然后在 `datebase.py` 文件中，利用 `pymysql` 库对上面定义的数据库进行操作，并为前端部分提供接口。文件中仅有一个datebase类，通过该类的成员函数进行相应的操作。该类通过 `pymysql.connect` 创建数据库对象，再通过 `db.cursor()` 创建游标，使用游标执行以字符串形式输入的sql语句控制数据库。

定义的接口如下：

1. `rebuild`: 重新执行 `db.sql` 文件，删除并重建数据库。
2. `insert_bank`: 插入一个银行。
3. `insert_staff`: 插入一个工作人员。
4. `staff_login`: 工作人员登陆，登陆成功则返回其个人信息，登陆失败则返回None。
5. `staff_lookup`: 工作人员查询，必须输入正确的工作人员的ID，否则查询失败。
6. `register`: 用户注册，如果未存在用户信息则添加新的用户。然后增加一个新的属于该用户的账户。
7. `take_transaction`: 执行交易，交易分为存入和取出两种。需要输入执行员、交易类型、交易的量。
8. `lookup_account`: 用于用户登陆，输入的账号和密码对应时才可以返回正确的信息，否则返回None。
9. `rename`: 用户重命名。
10. `customerMessage`: 得到给定名字的用户的信息。
11. `changeAccountPassword`: 修改用户账户的密码。
12. `changeCustomerMassage`: 修改用户账户信息。
13. `changeStaffMessage`: 修改管理员信息。

## 用户界面设计

程序的ui设计采用QtDesigner进行设计

每一个界面设计一个类来实现响应的响应函数

文件树如下：

![image-20230705152002777](https://s2.loli.net/2023/07/05/MbL3ViWXea71nOk.png)

主界面分别由标题——银行管理系统、模式切换——负责切换管理员模式和用户模式、账号密码输入框，其中，密码输入采用*的方式，符合实际情况，背景采用温迪图片进行美观（不是）

![image-20230705140847622](https://s2.loli.net/2023/07/05/xCRa1O62rA5Vcdl.png)

注册界面分别设计了头像、姓名、密码出生日期和电话号码等信息收集功能。

![](https://s2.loli.net/2023/07/05/vdDSuc8CyxBRJ9l.png)

用户界面为用户提供了查询账户余额和修改个人信息功能，并会在展示框上显示提示信息

![](https://s2.loli.net/2023/07/05/OLs9wITXUeMKB6y.png)

管理员界面为管理员提供了查询账户、修改个人信息、查询余额、存入金额和取出金额功能，并会在展示框上显示提示信息

![image-20230705145330395](https://s2.loli.net/2023/07/05/WloxdKtTqhFw3vQ.png)

## 前后端交互

前端的各个窗口呈树状分布，祖先-孩子关系为窗口创建关系。根部的窗口由 `main.py` 文件运行时打开。

我们在根窗口创建时创建一个新的 `datebase` 变量，用于进行前后端的交互，父窗口创建子窗口的时候子窗口使用父窗口的 `datebase` 变量控制数据库。

## 系统功能能够覆盖需求分析

从前端内容可以看出，我们设计的银行管理系统可以满足上面需求分析中提出的需求。

## 加项

加入了对用户头像的存储

采用QFileDialog和QtGui、os、shutil等库和模块来进行头像的上传、显示和存储功能

```python
    def clickedUploadAvatarBtn(self):
        # 实现了上传图片的功能，
        # imgName为上传图片的路径
        imgName, imgType = QFileDialog.getOpenFileName(self, "打开图片", "", "*.jpg;;*.png;;All Files(*)")
        img = QtGui.QPixmap(imgName).scaled(self.avatar.width(), self.avatar.height())
        self.avatar.setPixmap(img)
        self.filename = os.path.basename(imgName)
        if os.path.exists(os.path.join('img')):
            shutil.copy(os.path.join(imgName), os.path.join('img'))
        else:
            os.makedirs(os.path.join('img'))
            shutil.copy(os.path.join(imgName), os.path.join('img'))
```



