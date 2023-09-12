# _*_ coding: utf-8 _*_
# @Time : 2023/5/26 12:53
# @Author : zzx2002
# @File : main
# @Project : scr
from PyQt5.Qt import QApplication
import sys
from loginWidget import LoginWidget
# noinspection PyUnresolvedReferences
import image

from datebase import *

if __name__ == "__main__":
    app = QApplication(sys.argv)
    db = datebase()
    w = LoginWidget(db)
    sys.exit(app.exec())
