# _*_ coding: utf-8 _*_
# @Time : 2023/5/26 17:08
# @Author : zzx2002
# @File : UserWidget
# @Project : lab
import PyQt5
from PyQt5.QtCore import Qt
from datebase import *
from fixedWidget import *


class UserWidget(QWidget):
    def __init__(self, db: datebase):
        super().__init__()
        self.ui = uic.loadUi("UserWidget.ui")
        self.newFixedWidget = FixWidget(db)
        self.newErrorWidget = ErrorWidget()
        # print(self.ui.__dict__)
        self.inquire = self.ui.inquire
        self.modify = self.ui.modify
        self.browser = self.ui.browser

        self.inquire.clicked.connect(self.clickedInquire)
        self.modify.clicked.connect(self.clickedModify)

        self.datebase = db
        self.userMessage = None

    def clickedInquire(self):
        # TODO:获取当前账户数据库中的余额DataGrip.balance
        # balance为当前账户余额
        self.browser.setText("当前余额为%d" % self.userMessage[5])
        self.browser.repaint()

    def clickedModify(self):
        # TODO:判断账户ID是否在数据库中，这里暂时用userNames来表示所有用户名的列表
        if self.userMessage != None:
            self.newFixedWidget.ui.fixBtn.setText('修改')
            # TODO:显示相应的数据库内容
            customerMessage = self.datebase.customerMessage(self.userMessage[1])
            self.userMessage = self.userMessage + customerMessage
            self.newFixedWidget.userMessage = self.userMessage
            
            self.newFixedWidget.ui.pasLineEdit.setText(self.userMessage[4])
            self.newFixedWidget.ui.nameLineEdit.setText(self.userMessage[1])
            self.newFixedWidget.ui.phoneNumLineEdit.setText(customerMessage[2])
            self.newFixedWidget.ui.dateEdit.setDate(PyQt5.QtCore.QDate.fromString(
                customerMessage[1].strftime('%Y/%m/%d'), 'yyyy/MM/dd'))
            imgName = self.userMessage[3]
            if imgName is not None:
                img = QtGui.QPixmap(imgName).scaled(self.newFixedWidget.avatar.width(), self.newFixedWidget.avatar.height())
                self.newFixedWidget.ui.avatar.setPixmap(img)
            self.newFixedWidget.ui.show()
