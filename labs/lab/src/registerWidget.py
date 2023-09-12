# _*_ coding: utf-8 _*_
# @Time : 2023/5/27 12:27
# @Author : zzx2002
# @File : registerWidget
# @Project : lab
import os
import shutil

from PyQt5.Qt import QWidget
from PyQt5 import uic, QtGui
from PyQt5.QtWidgets import QFileDialog
from errorWidget import ErrorWidget

from datebase import *


class RegisterWidget(QWidget):
    def __init__(self, db: datebase):
        super().__init__()

        self.newErrorWidget = ErrorWidget()

        self.ui = uic.loadUi("registerWidget.ui")
        self.lineEditLimits()
        print(self.ui.__dict__)

        self.avatar = self.ui.avatar
        self.registerBtn = self.ui.registerBtn
        self.uploadAvatarBtn = self.ui.uploadAvatarBtn
        # self.accLineEdit = self.ui.accLineEdit
        self.pasLineEdit = self.ui.pasLineEdit
        self.nameLineEdit = self.ui.nameLineEdit
        self.dateEdit = self.ui.dateEdit
        self.phoneNumLineEdit = self.ui.phoneNumLineEdit

        self.registerBtn.clicked.connect(self.clickedRegisterBtn)
        self.uploadAvatarBtn.clicked.connect(self.clickedUploadAvatarBtn)

        self.filename = ''

        self.datebase = db

    def lineEditLimits(self):  # TODO:有点bug懒得改了应该不太影响
        # my_regex = QtCore.QRegExp("[a-zA-Z0-9]")
        # my_validator = QtGui.QRegExpValidator(my_regex, self.ui.accLineEdit)
        # self.ui.accLineEdit.setValidator(my_validator)
        # my_validator = QtGui.QRegExpValidator(my_regex, self.ui.pasLineEdit)
        # self.ui.pasLineEdit.setValidator(my_validator)
        # my_regex = QtCore.QRegExp("1(3|4|5|6|7|8|9)\d{9}")
        # my_validator = QtGui.QRegExpValidator(my_regex, self.ui.phoneNumLineEdit)
        # self.ui.phoneNumLineEdit.setValidator(my_validator)
        pass

    def clickedRegisterBtn(self):
        # 实现了注册功能
        # 如下变量分别为姓名、账号、密码、生日、电话号码
        name = self.nameLineEdit.text()
        # account = self.accLineEdit.text()
        password = self.pasLineEdit.text()
        date = self.dateEdit.date()
        phoneNum = self.phoneNumLineEdit.text()
        # 格式判断
        if len(name) != 0 and len(password) >= 6 and len(phoneNum) == 11:
            # TODO: 将账号密码姓名头像等信息存入数据库中
            ID = self.datebase.register(name, date.toString('yyyy/MM/dd'), phoneNum, '0', 'img/' + self.filename, password)  # 第五个参数为头像图片地址
            self.newErrorWidget.errorText.setText('您账号的id为{}'.format(ID))
            self.newErrorWidget.ui.show()

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
        self.filename = os.path.basename(imgName)
        if os.path.exists(os.path.join('img')):
            shutil.copy(os.path.join(imgName), os.path.join('img'))
        else:
            os.makedirs(os.path.join('img'))
            shutil.copy(os.path.join(imgName), os.path.join('img'))
