load "guilib.ring"
load "functions.ring"
_style="border:1px solid #c0c0c0;background: QLinearGradient(x1: 0, y1: 0, x2: 0, y2: 1,stop: 0 #eef, stop: 1 #ccf);"
num1=0
num2=0
m="+"

MyApp = New qApp {

        win1 = new qWidget() {
				setwinicon(self,"images/calc.png")
                setwindowtitle("Ring Calcuator")
                setwindowmodality(true)
                setFixedSize(290,280)
                setwindowflags( qt_dialog & ~ qt_WindowMaximizeButtonHint)
                //setGeometry(10,10,237,280)
                
                
                edit1 = new qlineedit(win1) {
					setGeometry(10,10,270,32)
					setalignment(Qt_AlignHCenter)
					setreturnpressedevent("checkEnter()")
					//setDisabled(true)
					//QValidator("Acceptable")
					//clicked("ccc()")
					//connect("")
					setStyleSheet("background-color: lightyellow;color:darkyellow;font-size: 15pt;")
                }
                
                new qpushbutton(win1) {
                        setGeometry(230,105,50,50)
                        settext("Memo")
                        setclickevent("memo()")
                        setStyleSheet(_style)
                }
                
                new qpushbutton(win1) {
                        setGeometry(230,50,50,50)
                        settext("C")
                        setclickevent("clearCalc()")
                        setStyleSheet("font-weight:bold;font-size:28pt;color:red;border:1px solid #c0c0c0;background: QLinearGradient(x1: 0, y1: 0, x2: 0, y2: 1,stop: 0 #fff, stop: 1 #fcc);")
                        
                }
                
                btn1=new qpushbutton(win1) {
                        setGeometry(10,50,50,50)
                        settext("1")
                        setclickevent("typeNumbers(1)")
                }
                
                
                btn2=new qpushbutton(win1) {
                        setGeometry(65,50,50,50)
                        settext("2")
                        setclickevent("typeNumbers(2)")
                }
                
                
                btn3=new qpushbutton(win1) {
                        setGeometry(120,50,50,50)
                        settext("3")
                        setclickevent("typeNumbers(3)")
                }
                
                
                btn4=new qpushbutton(win1) {
                        setGeometry(10,105,50,50)
                        settext("4")
                        setclickevent("typeNumbers(4)")
                }
                
                btn5=new qpushbutton(win1) {
                        setGeometry(65,105,50,50)
                        settext("5")
                        setclickevent("typeNumbers(5)")
                }
                
                btn6=new qpushbutton(win1) {
                        setGeometry(120,105,50,50)
                        settext("6")
                        setclickevent("typeNumbers(6)")
                }
                
                btn7=new qpushbutton(win1) {
                        setGeometry(10,160,50,50)
                        settext("7")
                        setclickevent("typeNumbers(7)")
                }
                
                btn8=new qpushbutton(win1) {
                        setGeometry(65,160,50,50)
                        settext("8")
                        setclickevent("typeNumbers(8)")
                }
                
                btn9=new qpushbutton(win1) {
                        setGeometry(120,160,50,50)
                        settext("9")
                        setclickevent("typeNumbers(9)")
                }
                
                
                btn0=new qpushbutton(win1) {
                        setGeometry(10,215,50,50)
                        settext("0")
                        setclickevent("typeNumbers(0)")
                }
                
                
                new qpushbutton(win1) {
                        setGeometry(65,215,50,50)
                        settext(".")
                        setclickevent("addPrediod()")
                }
                
                new qpushbutton(win1) {
                        setGeometry(120,215,50,50)
                        settext("%")
                        setclickevent("calcPercent()")
                        setStyleSheet(_style)
                }
                
                
                new qpushbutton(win1) {
                        setGeometry(230,160,50,105)
                        settext("=")
                        setclickevent("checkEnter()")
                        setStyleSheet("border:1px solid #c0c0c0;background: QLinearGradient(x1: 0, y1: 0, x2: 0, y2: 1,stop: 0 #fff, stop: 1 #cfc);")
                }
                
                
                new qpushbutton(win1) {
                        setGeometry(175,50,50,50)
                        settext("+")
                        setclickevent("math('+')")
                        setStyleSheet(_style)
                }
                new qpushbutton(win1) {
                        setGeometry(175,105,50,50)
                        settext("-")
                        setclickevent("math('-')")
                        setStyleSheet(_style)
                }
                new qpushbutton(win1) {
                        setGeometry(175,160,50,50)
                        settext("*")
                        setclickevent("math('*')")
                        setStyleSheet(_style)
                }
                new qpushbutton(win1) {
                        setGeometry(175,215,50,50)
                        settext("/")
                        setclickevent("math('/')")
                        setStyleSheet(_style)
                }
                
                show()
        }
		
        exec()
        
        

}

func ccc
	see "x"



func memo
	MyApp2 = New qApp {

        win2 = new qWidget() {
                setwindowtitle("History Of Ring Calcuator")
                setwindowmodality(true)
                setparent(win1)
                setwinicon(self,"images/calc.png")
                setFixedSize(550,450)
                setwindowflags( qt_dialog & ~ qt_WindowMaximizeButtonHint)
                //setGeometry(300,10,550,450)
                
				
				
				
				Table1 = new qTableWidget(win2) {
						setGeometry(10,10,530,430)
                        setrowcount(20) setcolumncount(3)
						setHorizontalHeaderItem(0, new QTableWidgetItem("Function"))
						setHorizontalHeaderItem(1, new QTableWidgetItem("Result") )
						setHorizontalHeaderItem(2, new QTableWidgetItem("Date") )
						
						
						pODBC = odbc_init()
						n=odbc_connect(pODBC,'DRIVER=SQLite3;Database=calc.db;LongNames=0;Timeout=1000;NoTXN=0;SyncPragma=NORMAL;StepAPI=0;')
						odbc_execute(pODBC,"select * from calc")
						x=1
						while odbc_fetch(pODBC)
							setitem(x-1,0,new qtablewidgetitem(odbc_getdata(pODBC,2)))
							setitem(x-1,1,new qtablewidgetitem(odbc_getdata(pODBC,3)))
							setitem(x-1,2,new qtablewidgetitem(odbc_getdata(pODBC,4)))
							x++
						end
						odbc_disconnect(pODBC)
						odbc_close(pODBC)
						
                }
		
			show()
		}
        exec()

	}





