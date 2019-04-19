
ActiveAdmin.register_page "grafico" do

  menu  priority: 4,label: "Grafico Cuentas"


  
  content title: "SITUACION FINANCIERA" do
   
     
    @vtit="CUENTAS"
    @vcuenta=[]
    @vimporte=[]


    Formula.where(product_id:1).order('unidad').each do |situa|
      @vcuenta.push(situa.codigo)
      @vimporte.push(Situation.where(cta:situa.cantidad).sum('importe'))
          
    end



    
               render :partial => "grafico",
               :locals => { :param1 => @vcuenta,
                            :param2 => @vimporte,
 
                            :param20 =>  @vtit}


  end


end
