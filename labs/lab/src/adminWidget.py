# _*_ coding: utf-8 _*_
# @Time : 2023/5/28 17:29
# @Author : zzx2002
# @File : adminWidget
# @Project : lab
import PyQt5
from PyQt5 import uic, QtGui
from PyQt5.Qt import QWidget
from PyQt5.QtCore import Qt
from adminFixWidget import *
from datebase import *
from errorWidget import ErrorWidget
from registerWidget import RegisterWidget


class AdminWidget(QWidget):
    def __init__(self, db: datebase):
        super().__init__()
        self.ui = uic.loadUi("adminWidget.ui")
        self.newFixedWidget = AdminFixWidget(db)
        self.newErrorWidget = ErrorWidget()
        # print(self.ui.__dict__)
        self.tip = 0

        self.textBrowser = self.ui.textBrowser
        self.research = self.ui.research
        self.inquire = self.ui.inquire
        self.deposit = self.ui.deposit
        self.fetch = self.ui.fetch
        self.lineEdit = self.ui.lineEdit
        self.fix = self.ui.fix

        self.research.clicked.connect(self.clickedResBtn)
        self.inquire.clicked.connect(self.clickedInqBtn)
        self.deposit.clicked.connect(self.clickedDepBtn)
        self.fetch.clicked.connect(self.clickedFetBtn)
        self.fix.clicked.connect(self.clickedFix)

        self.datebase = db
        self.staffMessage = None
        self.userMessage = None

    def clickedResBtn(self):
        userID = self.lineEdit.text()  # 这里要求输入账号唯一标识ID
        self.lineEdit.setText(None)
        self.userMessage = self.datebase.staff_lookup(self.staffMessage[0], userID)

        if self.userMessage != None:
            # TODO:判断账户ID是否在数据库中，这里暂时用userNames来表示所有用户名的列表
            self.textBrowser.append('已经查找到账户名为%s的账户' % userID)
            self.textBrowser.repaint()
            self.tip = 1

        else:
            self.newErrorWidget.errorText.setText('银行中没有此账户')
            self.newErrorWidget.ui.show()

    def clickedInqBtn(self):
        # TODO:获取当前账户的余额，这里暂时用balance表示
        balance = self.userMessage[5] # 判断是否为None
        if self.tip == 1:
            self.textBrowser.append("当前余额为%d" % balance)
            self.textBrowser.repaint()
        else:
            self.newErrorWidget.errorText.setText('请先输入查找用户')
            self.newErrorWidget.ui.show()

    def clickedDepBtn(self):  # 存钱
        if self.tip == 1:
            num = self.lineEdit.text()  # 输入的金额数
            if self.lineEdit.text() is not '':
                self.lineEdit.setText('')
                # TODO: 实现数据库的运算并输出到屏幕
                [transactionID, result] = self.datebase.take_transaction(
                    self.userMessage[0], self.staffMessage[0], '0', int(num))

                self.userMessage[5] = result
                self.textBrowser.append('已存入%s元，当前总金额为%d，交易ID为%s' % (num, result, transactionID))
            else:
                self.newErrorWidget.errorText.setText('请先输入需要存入的金额')
                self.newErrorWidget.ui.show()
        else:
            self.newErrorWidget.errorText.setText('请先输入查找用户')
            self.newErrorWidget.ui.show()

    def clickedFetBtn(self):  # 存钱
        if self.tip == 1:
            num = self.lineEdit.text()  # 输入的金额数
            if self.lineEdit.text() is not '':
                self.lineEdit.setText(None)
                # TODO: 实现数据库的运算并输出到屏幕
                [transactionID, result] = self.datebase.take_transaction(
                    self.userMessage[0], self.staffMessage[0], '1', int(num))
                
                if (transactionID == None):
                    self.newErrorWidget.errorText.setText('取出错误')
                    self.newErrorWidget.ui.show()
                else:
                    self.userMessage[5] = result
                    self.textBrowser.append('已取出%s元，当前总金额为%d，交易ID为%s' % (num, result, transactionID))
            else:
                self.newErrorWidget.errorText.setText('请先输入需要取出的金额')
                self.newErrorWidget.ui.show()
        else:
            self.newErrorWidget.errorText.setText('请先输入查找用户')
            self.newErrorWidget.ui.show()

    def clickedFix(self):
        self.newFixedWidget.ui.setWindowModality(Qt.NonModal)
        # TODO:显示相应的数据库内容
        self.newFixedWidget.ui.pasLineEdit.setText(self.staffMessage[2])
        self.newFixedWidget.ui.nameLineEdit.setText(self.staffMessage[3])
        self.newFixedWidget.ui.phoneNumLineEdit.setText(self.staffMessage[4])

        self.newFixedWidget.staffMessage = self.staffMessage
        # 删去出生日期和头像
        # self.newFixedWidget.ui.dateEdit.setDate(PyQt5.QtCore.QDate(2000, 1, 1))
        # imgName = None
        # if imgName is not None:
        #     img = QtGui.QPixmap(imgName).scaled(self.newFixedWidget.avatar.width(), self.newFixedWidget.avatar.height())
        #     self.newFixedWidget.ui.avatar.setPixmap(img)
        self.newFixedWidget.ui.show()
