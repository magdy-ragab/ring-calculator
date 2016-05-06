func typeNumbers x
	edit1.settext(edit1.text()+x)


func math x
	edit1.settext(edit1.text()+ x )
	
func addPrediod
	edit1.settext(edit1.text()+'.')


func clearCalc
	num1=0
	num2=0
	m="+"
	edit1.settext("")

func calcPercent
	edit1.settext(""+ edit1.text()+"*100")




func checkEnter
	try
		enum= edit1.text()
		eval("result="+enum)
		edit1.settext( ""+result )
		add2history(enum,result)
	catch
		see nl+cCatchError+nl
		edit1.settext( "NAN" )
	done
	
	
	
func add2history enum,result
	pODBC = odbc_init()
	odbc_connect(pODBC,'DRIVER=SQLite3;Database=calc.db;LongNames=0;Timeout=1000;NoTXN=0;SyncPragma=NORMAL;StepAPI=0;')
	odbc_execute(pODBC, "insert into `calc` (`math`, `result`) values('"+ enum +"','"+ result +"');")
	odbc_execute(pODBC, "delete from `calc` order by ID desc limit 20,1000")
	odbc_disconnect(pODBC)
	odbc_close(pODBC)
	
