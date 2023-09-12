# _*_ coding: utf-8 _*_
# @Time : 2023/5/26 11:51
# @Author : zzx2002
# @File : loginWidget.py
# @Project : scr
from registerWidget import *
from userWidget import *
from datebase import *
from adminWidget import *
from PyQt5.Qt import QWidget
from PyQt5 import uic
from errorWidget import ErrorWidget
from adminRegWidget import *

class LoginWidget(QWidget):
    def __init__(self, db: datebase):
        super().__init__()
        self.newUserWidget = UserWidget(db)
        self.newErrorWidget = ErrorWidget()
        self.newRegisterWidget = RegisterWidget(db)
        self.newAdminWidget = AdminWidget(db)
        self.newAdminRegWidget = AdminRegWidget(db)
        self.ui = uic.loadUi("bankLoginWidget.ui")
        # print(self.ui.__dict__)

        self.loginTitle = self.ui.loginTitle
        self.userName = self.ui.accLineEdit
        self.password = self.ui.pasLineEdit
        self.adminBtn = self.ui.adminBtn
        self.regBtn = self.ui.regBtn
        self.logBtn = self.ui.logBtn
        self.fogBtn = self.ui.fogBtn

        self.logBtn.clicked.connect(self.clickedLogBtn)
        self.regBtn.clicked.connect(self.clickedRegBtn)
        self.fogBtn.clicked.connect(self.clickedFogBtn)
        self.adminBtn.clicked.connect(self.clickedAdminBtn)
        self.ui.show()

        self.datebase = db
        self.userMessage = None

    def clickedRegBtn(self):
        if self.adminBtn.text() == '管理员模式':
            self.newRegisterWidget.ui.show()
        else:
            self.newAdminRegWidget.ui.show()
    def clickedLogBtn(self):  # u_pList为所有账号密码对的列表
        # print(self.userName.text()) 获取用户输入用户名
        # print(self.password.text()) 获取用户输入的密码、
        # TODO:判断当前的账号-密码对是否存在于数据库中

        # pair = (self.userName.text(), self.password.text())
        if self.adminBtn.text() == '管理员模式':
            self.userMessage = self.datebase.lookup_account(self.userName.text(), self.password.text())
            if self.userMessage != None:
                self.newUserWidget.userMessage = self.userMessage
                self.newUserWidget.ui.show()
                self.password.setText(None)
            else:
                self.newErrorWidget.ui.show()
                self.password.setText(None)
        else:
            self.userMessage = self.datebase.staff_login(self.userName.text(), self.password.text())
            if self.userMessage != None:
                self.newAdminWidget.staffMessage = self.userMessage
                self.newAdminWidget.ui.show()
                self.password.setText(None)
            else:
                self.newErrorWidget.ui.show()
                self.password.setText(None)

    def clickedFogBtn(self):  # TODO:懒，还没搞（不过搞不搞也无所谓）
        pass

    def clickedAdminBtn(self):
        if self.adminBtn.text() == '管理员模式':
            self.ui.loginTitle.setText("银行管理系统——管理员模式")
            self.adminBtn.setText('用户模式')
            self.password.setText(None)
            self.userName.setText(None)
        else:
            self.ui.loginTitle.setText("银行管理系统")
            self.adminBtn.setText('管理员模式')
            self.password.setText(None)
            self.userName.setText(None)
