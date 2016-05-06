Load "qt.rh"
Load "ring_qt.ring"
if iswindows()
	LoadLib("ringqt.dll")
else
	LoadLib("libringqt.so")
ok

func setwinicon pWindow,cImage
		pPixmap = new qpixmap(cImage)
		pWindow.setWindowIcon(new qicon(pPixmap))
		#pWindow.setWindowIcon(new qicon(new qpixmap(cImage)))

func setbtnimage pBtn,cImage
	pPixmap = new qpixmap(cImage)
	pBtn.setIcon(new qicon(pPixmap))




