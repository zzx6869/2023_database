import pymysql
import datetime

class datebase:
    def __init__(self) -> None:
        self.db = pymysql.connect(host='localhost', user='root', passwd='qwerty123789', database='BANK_MANAGEMENT')
        self.cursor = self.db.cursor()
    
    def rebuild(self):
        # 删除并重建数据库
        with open('./db.sql', 'r') as init_file:
            for op in init_file.read().split(';\n\n'):
                # print(op)
                self.cursor.execute(op + ';')
                self.db.commit()

    def insert_bank(self):
        self.cursor.execute('SELECT COUNT(ID) FROM BANK')
        next_ID = self.cursor.fetchone()
        self.cursor.execute('INSERT INTO Bank VALUE(' + str(next_ID[0]) + ')')
        self.db.commit()
        return str(next_ID[0])
    
    def insert_staff(self, BankID: str, Password: str, Name : str, TeleNum: str):
        try:
            self.cursor.execute('SELECT COUNT(ID) FROM Staff')
            nextID = str(self.cursor.fetchone()[0])
            # print(nextID)
            sql = "INSERT INTO Staff VALUE('{}', '{}', '{}', '{}', '{}')".format(nextID, BankID, Password, Name, TeleNum)
            # print(sql)
            self.cursor.execute(sql)
            self.db.commit()
            return nextID
        except:
            return None
        
    # return [StaffID, BankID, Password, Name, TeleNum]
    def staff_login(self, StaffID: str, Password: str):
        sql = "SELECT * FROM Staff WHERE ID = {}".format(StaffID)
        try:
            self.cursor.execute(sql)
            self.db.commit()
            results = self.cursor.fetchall()[0]
            print(results)
            if Password == results[2]:
                return results
            else:
                return None
        except:
            print('staff_login error')
            return None
        
    def staff_lookup(self, StaffID: str, AccountID: str):
        try:
            sql = "SELECT COUNT(ID) FROM Staff WHERE ID = {}".format(StaffID)
            self.cursor.execute(sql)
            results = self.cursor.fetchone()[0]
            if results == 0:
                print('staff not exists')
                return None
            sql = "SELECT * FROM Account WHERE ID = {}".format(AccountID)
            self.cursor.execute(sql)
            results = self.cursor.fetchall()[0]
            return list(results)
        except:
            print("lookup error")
            return None

    def register(self, name: str, Birthday: str, TeleNum: str, 
                    BankID: str, HeadShotPath: str, Password: str):
            sql = "CALL register('" + name + "', '" + Birthday + "', '" + TeleNum + "', '" + \
                BankID + "', '" + HeadShotPath + "', '" + Password  +  "', @x);"
        
        # try:
            self.cursor.execute(sql)
            self.db.commit()
            self.cursor.execute("SELECT @x;")
            self.db.commit()
            result = self.cursor.fetchone()
            print('return ID', result)
            return result[0]
        # except:
            print('register error')
            return None
    
    # return = transactionID
    def take_transaction(self, AccountID: str, StaffID: str, Type: str, Amount: int):
        try:
            # check
            assert Amount > 0
            assert Type == '0' or Type == '1'
            sql = "SELECT COUNT(ID) FROM Staff WHERE ID = {}".format(StaffID)
            self.cursor.execute(sql)
            results = self.cursor.fetchone()[0]
            assert results > 0

            print( AccountID, StaffID, Type, Amount, 'results', results)

            sql = 'SELECT COUNT(ID) FROM Transaction'
            self.db.commit()
            self.cursor.execute(sql)
            next_ID = self.cursor.fetchone()[0]
            sql = "INSERT INTO Transaction VALUE('{}', '{}', '{}', '{}', '{}')".format(
                str(next_ID), AccountID, StaffID, Type, str(Amount))
            self.cursor.execute(sql)
            self.db.commit()
            if Type == '0':
                sql = "UPDATE Account SET Balance = Balance + {} WHERE ID = {}".format(
                    str(Amount), AccountID)
            elif Type == '1':
                sql = "SELECT Balance FROM Account WHERE ID = {}".format(AccountID)
                self.cursor.execute(sql)
                result = self.cursor.fetchone()[0]
                assert result - Amount >= 0
                sql = "UPDATE Account SET Balance = Balance - {} WHERE ID = {}".format(
                    str(Amount), AccountID)
            else:
                print('type error')
                return [None, None]
            self.cursor.execute(sql)
            self.db.commit()
            sql = "SELECT Balance FROM Account WHERE ID = {}".format(AccountID)
            self.cursor.execute(sql)
            result = self.cursor.fetchone()[0]
            return [next_ID, result]
        except:
            return [None, None]


    # return = [ID, CustomerName, BankID, HeadShot, Password: str, Balance: int]
    def lookup_account(self, AccountID: str, Password: str):
        sql = "SELECT * FROM Account WHERE ID = {}".format(AccountID)
        try:
            self.cursor.execute(sql)
            self.db.commit()
            results = self.cursor.fetchall()[0]
            if Password == results[4]:
                return results
            else:
                return None
        except:
            return None
    
    def rename(self, oldName: str, newName: str):
        sql = "CALL ChangeName('{}', '{}')".format(oldName, newName)
        try:
            self.cursor.execute(sql)
            self.db.commit()
            return True
        except:
            return False
    
    def customerMessage(self, name: str):
            sql = "SELECT * FROM Customer WHERE Customer.Name = '{}'".format(name)
        # try:
            print(sql)
            self.cursor.execute(sql)
            results = self.cursor.fetchall()[0]
            return results
        # except:
            return None
    
    def changeAccountPassword(self, AccountID: str, newPassword: str):
        sql = "UPDATE Account SET Password = '{}' WHERE Account.ID = '{}'".format(newPassword, AccountID)
        self.cursor.execute(sql)
        self.db.commit()
    
    def changeCustomerMassage(self, name: str, birthDate: str, teleNum: str):
        sql = "UPDATE Customer SET Customer.BirthDay = '{}' WHERE Customer.Name = '{}'".format(
            birthDate, name)
        self.cursor.execute(sql)
        self.db.commit()
        sql = "UPDATE Customer SET Customer.TeleNum = '{}' WHERE Customer.Name = '{}'".format(
            teleNum, name)
        self.cursor.execute(sql)
        self.db.commit()

    def changeStaffMessage(self, StaffID: str, name: str, password: str, teleNum: str):
        sql = "UPDATE Staff SET Staff.Name = '{}' WHERE Staff.ID = '{}'".format(
            name, StaffID)
        self.cursor.execute(sql)
        self.db.commit()
        sql = "UPDATE Staff SET Staff.Password = '{}' WHERE Staff.ID = '{}'".format(
            password, StaffID)
        self.cursor.execute(sql)
        self.db.commit()
        sql = "UPDATE Staff SET Staff.TeleNum = '{}' WHERE Staff.ID = '{}'".format(
            teleNum, StaffID)
        self.cursor.execute(sql)
        self.db.commit()




if __name__ == '__main__':
    db = datebase()
    db.rebuild()
    db.insert_bank()
    bank = db.insert_bank()
    db.cursor.execute('SELECT * FROM BANK')
    results = db.cursor.fetchall()
    staffID = db.insert_staff(bank, 'qwerty', 'asd', '12345678900')
    accountID = db.register('xls', '2000/01/01', '12345678900', '0', 'img/1.jpg', 'qwerty')
    accountID = db.register('asd', '2000/01/01', '12345678900', '0', 'img/1.jpg', 'qwerty')
    accountData = db.lookup_account(accountID, '1233456')
    accountData = db.staff_lookup(staffID, accountID)
    a = db.take_transaction(accountID, staffID, '0', 123)
    a = db.take_transaction(accountID, staffID, '0', 123)
    results = db.customerMessage('xls')
    db.changeStaffMessage('0', 'xls', '1234567', '12341234123')
    print(results)
