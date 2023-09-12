# _*_ coding: utf-8 _*_
# @Time : 2023/5/28 20:32
# @Author : zzx2002
# @File : errorWidget
# @Project : lab
from PyQt5 import uic
from PyQt5.Qt import QWidget


class ErrorWidget(QWidget):
    def __init__(self):
        super().__init__()
        self.ui = uic.loadUi("errorWidget.ui")
        self.errorText = self.ui.errorText
