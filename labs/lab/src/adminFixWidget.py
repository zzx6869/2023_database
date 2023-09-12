# _*_ coding: utf-8 _*_
# @Time : 2023/6/15 17:32
# @Author : zzx2002
# @File : adminFixWidget
# @Project : src
from PyQt5.Qt import QWidget
from PyQt5 import uic, QtGui
from PyQt5.QtWidgets import QFileDialog
from errorWidget import ErrorWidget
from datebase import *


class AdminFixWidget(QWidget):
    def __init__(self, db: datebase):
        super().__init__()

        self.newErrorWidget = ErrorWidget()

        self.ui = uic.loadUi("adminFixWidget.ui")
        self.lineEditLimits()
        print(self.ui.__dict__)

        self.avatar = self.ui.avatar
        self.fixBtn = self.ui.fixBtn
        self.uploadAvatarBtn = self.ui.uploadAvatarBtn
        self.pasLineEdit = self.ui.pasLineEdit
        self.nameLineEdit = self.ui.nameLineEdit
        self.phoneNumLineEdit = self.ui.phoneNumLineEdit

        self.fixBtn.clicked.connect(self.clickedFixBtn)
        self.uploadAvatarBtn.clicked.connect(self.clickedUploadAvatarBtn)

        self.datebase = db
        self.staffMessage = None

    def lineEditLimits(self):  # 有点bug懒得改了应该不太影响
        # my_regex = QtCore.QRegExp("[a-zA-Z0-9]")
        # my_validator = QtGui.QRegExpValidator(my_regex, self.ui.accLineEdit)
        # self.ui.accLineEdit.setValidator(my_validator)
        # my_validator = QtGui.QRegExpValidator(my_regex, self.ui.pasLineEdit)
        # self.ui.pasLineEdit.setValidator(my_validator)
        # my_regex = QtCore.QRegExp("1(3|4|5|6|7|8|9)\d{9}")
        # my_validator = QtGui.QRegExpValidator(my_regex, self.ui.phoneNumLineEdit)
        # self.ui.phoneNumLineEdit.setValidator(my_validator)
        pass

    def clickedFixBtn(self):
        # 实现了注册功能
        # 如下变量分别为姓名、账号、密码、生日、电话号码
        name = self.nameLineEdit.text()
        password = self.pasLineEdit.text()
        phoneNum = self.phoneNumLineEdit.text()
        # 格式判断
        if len(name) != 0 and len(password) >= 6 and len(phoneNum) == 11:
            # TODO: 将员工号账号密码姓名头像等信息存入数据库中
            # ID = self.datebase.insert_staff('0', password, name, phoneNum)
            # self.newErrorWidget.errorText.setText('您账号的id为{}'.format(ID))

            print(self.staffMessage)
            self.datebase.changeStaffMessage(self.staffMessage[0], name, password, phoneNum)
            self.ui.close()
        elif len(name) == 0 or len(password) == 0 or len(phoneNum) == 0:
            self.newErrorWidget.errorText.setText('不能有空缺的信息')
            self.newErrorWidget.ui.show()
        elif len(phoneNum) != 11:
            self.newErrorWidget.errorText.setText('请输入正确的手机号码')
            self.newErrorWidget.ui.show()
        else:
            self.newErrorWidget.errorText.setText('请输入正确格式的信息')
            self.newErrorWidget.ui.show()

    def clickedUploadAvatarBtn(self):
        # 实现了上传图片的功能，
        # imgName为上传图片的路径
        imgName, imgType = QFileDialog.getOpenFileName(self, "打开图片", "", "*.jpg;;*.png;;All Files(*)")
        img = QtGui.QPixmap(imgName).scaled(self.avatar.width(), self.avatar.height())
        self.avatar.setPixmap(img)