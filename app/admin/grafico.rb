
ActiveAdmin.register_page "grafico" do

  menu  priority: 4,label: "Grafico Cuentas"


  
  content title: "SITUACION FINANCIERA" do
   
     



    
               render :partial => "grafico",
               :locals => { :param1 => ["aa","bb","cc"],
                            :param2 => [20,10,30],
 
                            :param20 =>  @vtit}


  end


end
